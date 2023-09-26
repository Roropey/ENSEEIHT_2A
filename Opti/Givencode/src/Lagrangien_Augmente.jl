@doc doc"""
#### Objet

Résolution des problèmes de minimisation avec une contrainte d'égalité scalaire par l'algorithme du lagrangien augmenté.

#### Syntaxe
```julia
xmin,fxmin,flag,iter,muks,lambdaks = Lagrangien_Augmente(algo,f,gradf,hessf,c,gradc,hessc,x0,options)
```

#### Entrées
  - algo : (String) l'algorithme sans contraintes à utiliser:
    - "newton"  : pour l'algorithme de Newton
    - "cauchy"  : pour le pas de Cauchy
    - "gct"     : pour le gradient conjugué tronqué
  - f : (Function) la fonction à minimiser
  - gradf       : (Function) le gradient de la fonction
  - hessf       : (Function) la hessienne de la fonction
  - c     : (Function) la contrainte [x est dans le domaine des contraintes ssi ``c(x)=0``]
  - gradc : (Function) le gradient de la contrainte
  - hessc : (Function) la hessienne de la contrainte
  - x0 : (Array{Float,1}) la première composante du point de départ du Lagrangien
  - options : (Array{Float,1})
    1. epsilon     : utilisé dans les critères d'arrêt
    2. tol         : la tolérance utilisée dans les critères d'arrêt
    3. itermax     : nombre maximal d'itération dans la boucle principale
    4. lambda0     : la deuxième composante du point de départ du Lagrangien
    5. mu0, tho    : valeurs initiales des variables de l'algorithme

#### Sorties
- xmin : (Array{Float,1}) une approximation de la solution du problème avec contraintes
- fxmin : (Float) ``f(x_{min})``
- flag : (Integer) indicateur du déroulement de l'algorithme
   - 0    : convergence
   - 1    : nombre maximal d'itération atteint
   - (-1) : une erreur s'est produite
- niters : (Integer) nombre d'itérations réalisées
- muks : (Array{Float64,1}) tableau des valeurs prises par mu_k au cours de l'exécution
- lambdaks : (Array{Float64,1}) tableau des valeurs prises par lambda_k au cours de l'exécution

#### Exemple d'appel
```julia
using LinearAlgebra
algo = "gct" # ou newton|gct
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
c(x) =  (x[1]^2) + (x[2]^2) -1.5
gradc(x) = [2*x[1] ;2*x[2]]
hessc(x) = [2 0;0 2]
x0 = [1; 0]
options = []
xmin,fxmin,flag,iter,muks,lambdaks = Lagrangien_Augmente(algo,f,gradf,hessf,c,gradc,hessc,x0,options)
```

#### Tolérances des algorithmes appelés

Pour les tolérances définies dans les algorithmes appelés (Newton et régions de confiance), prendre les tolérances par défaut définies dans ces algorithmes.

"""
function Lagrangien_Augmente(algo,fonc::Function,contrainte::Function,gradfonc::Function,
        hessfonc::Function,grad_contrainte::Function,hess_contrainte::Function,x0,options)

  if options == []
		epsilon = 1e-2
		tol = 1e-5
		itermax = 1000
		lambda0 = 2
		mu0 = 100
		tho = 2
	else
		epsilon = options[1]
		tol = options[2]
		itermax = options[3]
		lambda0 = options[4]
		mu0 = options[5]
		tho = options[6]
	end

  n = length(x0)
  xmin = x0
  fxmin = fonc(xmin)
  flag = -2
  iter = 0
  muk = mu0
  muks = [mu0]
  lambdak = lambda0
  lambdaks = [lambda0]

  iter = 0
  beta = 0.9
  eta = 0.1258925
  alpha = 0.1
  epsilon0 = 1/mu0
  epsilonk = epsilon0
  etak=eta/(mu0^alpha)

  normgradLAx0 = norm(gradfonc(x0) + lambda0'*grad_contrainte(x0) + mu0*contrainte(x0)*grad_contrainte(x0))
  normcontraintex0 = norm(contrainte(x0))
  if (normgradLAx0 <= tol) && (normcontraintex0 <= tol)
    flag = 0
  end

while (flag==-2)

    LA(x) = fonc(x) + lambdak'*contrainte(x) + (muk/2)*(norm(contrainte(x))^2)
    gradLA(x) = gradfonc(x) + lambdak'*grad_contrainte(x) + muk*grad_contrainte(x)*contrainte(x)
    hessLA(x) = hessfonc(x) + lambdak'*hess_contrainte(x) + muk*(contrainte(x)*hess_contrainte(x) + grad_contrainte(x)*grad_contrainte(x)')

    if algo == "newton"
      xmin,_,_,_ = Algorithme_De_Newton(LA,gradLA,hessLA,xmin,[itermax,epsilonk,10^-15,1,epsilon])
    elseif (algo == "cauchy") || (algo == "gct") 
      xmin,_,_,_ = Regions_De_Confiance(algo,LA,gradLA,hessLA,xmin,[10,0.5,2,0.25,2,0.75,itermax,epsilonk,10^-15,epsilon])
    else
      flag = -1
      #error("Algorithme non défini (accepte que newton, cauchy ou gct)")
    end
 
    if (norm(gradfonc(xmin)+lambdak*grad_contrainte(xmin)) <= max(tol * normgradLAx0,tol)) && (norm(contrainte(xmin))<=max(tol*normcontraintex0,tol))
      flag = 0
    end

    if norm(contrainte(xmin)) <= etak
      lambdak = lambdak + muk*contrainte(xmin)
      epsilonk = epsilonk/muk
      etak=etak/(muk^beta)
    else
      muk = tho*muk
      epsilonk = epsilon0/muk
      etak=eta/(muk^alpha)
    end
    push!(muks, muk)
    push!(lambdaks, lambdak)


    iter +=1 
    if iter >= itermax+1
      flag = 1
    end

  end
  fxmin = fonc(xmin)
  return xmin,fxmin,flag,iter #, muks, lambdaks
  #=
  
  tol_abs = sqrt(eps())
  n = length(x0)
  xmin = zeros(n)
	fxmin = 0
	flag = 0
	iter = 0
  xk = x0
  xk1 = xk                #xk+1
  lambdak = lambda0
  lambdak1 = lambdak
  muk = mu0
  muk1 = muk
  etachap = 0.1258925
  alpha = 0.1
  beta = 0.9
  etak = etachap/(mu0^alpha)
  etak1 = etak
  eps0 = 1/mu0
  epsk = eps0
  epsk1 = epsk
  flag = -1
  Convergence = false
  maxIterAtteint = false
  k = 0
  gradLAx0 = gradfonc(x0) + lambda0'*grad_contrainte(x0) + mu0*grad_contrainte(x0)*contrainte(x0)
    
  while !(maxIterAtteint)
    LA(x) = fonc(x) + lambdak'*contrainte(x) + (muk/2)*norm(contrainte(x))^2
    gradLA(x) = gradfonc(x) + lambdak'*grad_contrainte(x) + muk*grad_contrainte(x)*contrainte(x)
    hessLA(x) = hessfonc(x) + lambdak'*hess_contrainte(x) + muk*hess_contrainte(x)*contrainte(x) + muk*grad_contrainte(x)*grad_contrainte(x)'
    if algo == "newton"
      xk1,~ = Algorithme_De_Newton(LA,gradLA,hessLA,xk,[])
    else
      xk1,~ = Regions_De_Confiance(algo,LA,gradLA,hessLA,xk,[])
    end
    Convergence = ( (norm(gradLA(xk1)) <= max(tol * norm(gradLAx0), tol_abs)) && (norm(contrainte(xk1)) <= max(tol*norm(contrainte(x0)), tol_abs)) )
    if Convergence
      break
    end
    if norm(contrainte(xk1)) <= etak
      lambdak1 = lambdak + muk*contrainte(xk1)
      muk1 = muk
      epsk1 = epsk/muk
      etak1 = etak/(muk^beta)
      k += 1
    else
      muk1 = muk*tho
      epsk1 = eps0/muk1
      etak1 = etachap/(muk1^alpha)
      k += 1
    end

    lambdak = lambdak1
    muk = muk1
    etak = etak1
    epsk = epsk1
    xk = xk1

    
    maxIterAtteint = k >= itermax
  end

  xmin = xk
  fxmin = fonc(xmin)

  if Convergence
    flag = 0
  elseif maxIterAtteint
    flag = 1
  end

  iter = k
	return xmin,fxmin,flag,iter
  =#
end
