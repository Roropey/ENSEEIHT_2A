@doc doc"""

#### Objet

Minimise une fonction de ``\mathbb{R}^{n}`` à valeurs dans ``\mathbb{R}`` en utilisant l'algorithme des régions de confiance. 

La solution approchées des sous-problèmes quadratiques est calculé 
par le pas de Cauchy ou le pas issu de l'algorithme du gradient conjugue tronqué

#### Syntaxe
```julia
xmin, fxmin, flag, nb_iters = Regions_De_Confiance(algo,f,gradf,hessf,x0,option)
```

#### Entrées :

   - algo        : (String) string indicant la méthode à utiliser pour calculer le pas
        - "gct"   : pour l'algorithme du gradient conjugué tronqué
        - "cauchy": pour le pas de Cauchy
   - f           : (Function) la fonction à minimiser
   - gradf       : (Function) le gradient de la fonction f
   - hessf       : (Function) la hessiene de la fonction à minimiser
   - x0          : (Array{Float,1}) point de départ
   - options     : (Array{Float,1})
     - deltaMax       : utile pour les m-à-j de la région de confiance
                      ``R_{k}=\left\{x_{k}+s ;\|s\| \leq \Delta_{k}\right\}``
     - gamma1, gamma2 : ``0 < \gamma_{1} < 1 < \gamma_{2}`` pour les m-à-j de ``R_{k}``
     - eta1, eta2     : ``0 < \eta_{1} < \eta_{2} < 1`` pour les m-à-j de ``R_{k}``
     - delta0         : le rayon de départ de la région de confiance
     - max_iter       : le nombre maximale d'iterations
     - Tol_abs        : la tolérence absolue
     - Tol_rel        : la tolérence relative
     - epsilon       : epsilon pour les tests de stagnation

#### Sorties:

   - xmin    : (Array{Float,1}) une approximation de la solution du problème : 
               ``\min_{x \in \mathbb{R}^{n}} f(x)``
   - fxmin   : (Float) ``f(x_{min})``
   - flag    : (Integer) un entier indiquant le critère sur lequel le programme s'est arrêté (en respectant cet ordre de priorité si plusieurs critères sont vérifiés)
      - 0    : CN1
      - 1    : stagnation du ``x``
      - 2    : stagnation du ``f``
      - 3    : nombre maximal d'itération dépassé
   - nb_iters : (Integer)le nombre d'iteration qu'à fait le programme

#### Exemple d'appel
```julia
algo="gct"
f(x)=100*(x[2]-x[1]^2)^2+(1-x[1])^2
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
x0 = [1; 0]
options = []
xmin, fxmin, flag, nb_iters = Regions_De_Confiance(algo,f,gradf,hessf,x0,options)
```
"""
function Regions_De_Confiance(algo,f::Function,gradf::Function,hessf::Function,x0,options)
    
    if options == []
        deltaMax = 10
        gamma1 = 0.5
        gamma2 = 2.00
        eta1 = 0.25
        eta2 = 0.75
        delta0 = 2
        max_iter = 1000
        Tol_abs = sqrt(eps())
        Tol_rel = 1e-15
        epsilon = 1.e-2
    else
        deltaMax = options[1]
        gamma1 = options[2]
        gamma2 = options[3]
        eta1 = options[4]
        eta2 = options[5]
        delta0 = options[6]
        max_iter = options[7]
        Tol_abs = options[8]
        Tol_rel = options[9]
        epsilon = options[10]
    end
   
    n = length(x0)
    xmin = x0
    fxmin = f(xmin)
    gradfx0 = gradf(x0)
    deltak=delta0
    flag = 0
    nb_iters = 0
    Non_arret = (norm(gradfx0) >= Tol_abs) && (max_iter > 0)
    
    while Non_arret

        
        fxmin = f(xmin)
        g = gradf(xmin)
        H = hessf(xmin)

        if algo=="gct"
            sk = Gradient_Conjugue_Tronque(g,H,[deltak,max_iter,Tol_rel])
        elseif algo == "cauchy"
            sk,_ = Pas_De_Cauchy(g,H,deltak)
        else
           error("Algorithme non défini (accepte que cauchy ou gct)")
        end

        
        
        mk_xmin_sk = fxmin + g'*sk + (1/2)*(sk'*H*sk)
        mk_xmin = fxmin
        rhok = (fxmin-f(xmin+sk))/(mk_xmin-mk_xmin_sk)
        
        
        
        
        if rhok >= eta1
            xmin_next = xmin + sk
            fmin_next=f(xmin_next)

            if norm(xmin_next - xmin) <= max(Tol_rel*norm(xmin),Tol_abs) 
                flag = 1
                Non_arret = false
            elseif abs(fmin_next - fxmin) <= max(Tol_rel*abs(fxmin),Tol_abs) 
                flag = 2
                Non_arret = false
            end
        else
            xmin_next = xmin
        end


        if rhok >= eta2
            deltak_next = min(gamma2*deltak,deltaMax)
        elseif rhok < eta1
            deltak_next = gamma1*deltak
        else
            deltak_next = deltak
        end

        nb_iters += 1

        if rhok>=eta1
            if norm(gradf(xmin_next)) <= max(Tol_rel * norm(gradfx0),Tol_abs)
                flag = 0
                Non_arret = false#=
            elseif norm(xmin_next - xmin) <= epsilon * max(Tol_rel*norm(xmin),Tol_abs) 
                flag = 1
                Non_arret = false
            elseif abs(fmin_next - fxmin) <= epsilon * max(Tol_rel*abs(fxmin),Tol_abs) 
                flag = 2
                Non_arret = false=#
            elseif nb_iters == max_iter
                flag = 3
                Non_arret = false
            end
        end

        deltak=deltak_next
        xmin=xmin_next
    end
    return xmin, fxmin, flag, nb_iters
    
    
    
    
    #=
    n = length(x0)
    xmin = zeros(n)
    fxmin = f(xmin)
    flag = 0
    nb_iters = 0
    
    xk = x0
    yk = x0             # xk+1
    deltak = delta0
    deltak1 = delta0    #deltak+1
    
    # Initialisation des tests de convergence
    Conv = norm(gradf(yk)) <= max(Tol_rel*norm(gradf(x0)), Tol_abs)
    Stagxk = false
    Stagf = false
    maxIterAtteint = false
    rok = 0
    
    while !(Conv || Stagxk || Stagf || maxIterAtteint)
        
        #calcul de sk la solution du sous-problème
        if algo == "cauchy"
            sk = Pas_De_Cauchy(gradf(xk), hessf(xk), deltak)
            sk = sk[1]
        else
            sk = Gradient_Conjugue_Tronque(gradf(xk),hessf(xk),[deltak,max_iter,Tol_rel])
        end

        
        
        # Evaluation de f(xk + sk) et rok
        fk = f(xk)
        gk = gradf(xk)
        Hk = hessf(xk)


        mk_xk_sk = fk + gk'*sk + (1/2)*(sk'*Hk*sk)
        mk_xk = fk
        rok = (fk-f(xk+sk))/(mk_xk-mk_xk_sk)
        
        
        
        # Mise à jour de l'itéré
        if rok >= eta1
            yk = xk + sk
            Stagxk = norm(yk - xk) <= max(Tol_rel*norm(xk), Tol_abs)
            Stagf = norm(f(yk)-f(xk))<= max(Tol_rel*norm(f(xk)), Tol_abs)
        else
            yk = xk
        end
        
        
        
        # Mise à jour de la région de confiance
        if rok >= eta2
            deltak1 = min(gamma2*deltak,deltaMax)
        elseif rok < eta1
            deltak1 = gamma1*deltak
        else
            deltak1 = deltak
        end
        
        
        # Mise à jour des flags de converence
        Conv = norm(gradf(yk)) <= max(Tol_rel*norm(gradf(x0)), Tol_abs)
        maxIterAtteint = nb_iters == max_iter
            
        xk = yk
        deltak = deltak1
        nb_iters += 1
    
    end
    
    xmin = xk
    fxmin = f(xmin)
    
    if Conv
        flag = 0
    elseif Stagxk 
        flag = 1
    elseif Stagf
        flag = 2
    elseif maxIterAtteint
        flag = 3
    end

    return xmin, fxmin, flag, nb_iters
=#
end
