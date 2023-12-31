@doc doc"""
Résolution des problèmes de minimisation sous contraintes d'égalités

# Syntaxe
```julia
Lagrangien_Augmente(algo,fonc,contrainte,gradfonc,hessfonc,grad_contrainte,
			hess_contrainte,x0,options)
```

# Entrées
  * **algo** 		   : (String) l'algorithme sans contraintes à utiliser:
    - **"newton"**  : pour l'algorithme de Newton
    - **"cauchy"**  : pour le pas de Cauchy
    - **"gct"**     : pour le gradient conjugué tronqué
  * **fonc** 		   : (Function) la fonction à minimiser
  * **contrainte**	   : (Function) la contrainte [x est dans le domaine des contraintes ssi ``c(x)=0``]
  * **gradfonc**       : (Function) le gradient de la fonction
  * **hessfonc** 	   : (Function) la hessienne de la fonction
  * **grad_contrainte** : (Function) le gradient de la contrainte
  * **hess_contrainte** : (Function) la hessienne de la contrainte
  * **x0** 			   : (Array{Float,1}) la première composante du point de départ du Lagrangien
  * **options**		   : (Array{Float,1})
    1. **epsilon** 	   : utilisé dans les critères d'arrêt
    2. **tol**         : la tolérance utilisée dans les critères d'arrêt
    3. **itermax** 	   : nombre maximal d'itération dans la boucle principale
    4. **lambda0**	   : la deuxième composante du point de départ du Lagrangien
    5. **mu0,tho** 	   : valeurs initiales des variables de l'algorithme

# Sorties
* **xmin**		   : (Array{Float,1}) une approximation de la solution du problème avec contraintes
* **fxmin** 	   : (Float) ``f(x_{min})``
* **flag**		   : (Integer) indicateur du déroulement de l'algorithme
   - **0**    : convergence
   - **1**    : nombre maximal d'itération atteint
   - **(-1)** : une erreur s'est produite
* **niters** 	   : (Integer) nombre d'itérations réalisées

# Exemple d'appel
```julia
using LinearAlgebra
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
algo = "gct" # ou newton|gct
x0 = [1; 0]
options = []
contrainte(x) =  (x[1]^2) + (x[2]^2) -1.5
grad_contrainte(x) = [2*x[1] ;2*x[2]]
hess_contrainte(x) = [2 0;0 2]
output = Lagrangien_Augmente(algo,f,contrainte,gradf,hessf,grad_contrainte,hess_contrainte,x0,options)
```
"""
function Lagrangien_Augmente(algo,fonc::Function,contrainte::Function,gradfonc::Function,
	hessfonc::Function,grad_contrainte::Function,hess_contrainte::Function,x0,options)

	if options == []
		epsilon = 1e-8
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

  while !(maxIterAtteint)
    LA(x) = fonc(x) + lambdak'*contrainte(x) + (muk/2)*norm(contrainte(x))^2
    gradLA(x) = gradfonc(x) + lambdak'*grad_contrainte(x) + muk*grad_contrainte(x)*contrainte(x)
    hessLA(x) = hessfonc(x) + lambdak'*hess_contrainte(x) + muk*hess_contrainte(x)*contrainte(x) + muk*grad_contrainte(x)*grad_contrainte(x)'
    if algo == "newton"
      xk1,~ = Algorithme_De_Newton(LA,gradLA,hessLA,xk,[])
    else
      xk1,~ = Regions_De_Confiance(algo,LA,gradLA,hessLA,xk,[])
    end
    Convergence = ( (norm(gradfonc(xk1)+lambdak'*grad_contrainte(xk1)) <= max(tol * norm(gradfonc(x0)+lambda0'*grad_contrainte(x0)), tol_abs)) && (norm(contrainte(xk1)) <= max(tol*norm(contrainte(x0)), tol_abs)) )
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
end
