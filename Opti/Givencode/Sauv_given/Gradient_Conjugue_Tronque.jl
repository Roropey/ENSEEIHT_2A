@doc doc"""
Minimise le problème : ``min_{||s||< \delta_{k}} q_k(s) = s^{t}g + (1/2)s^{t}Hs``
                        pour la ``k^{ème}`` itération de l'algorithme des régions de confiance

# Syntaxe
```julia
sk = Gradient_Conjugue_Tronque(fk,gradfk,hessfk,option)
```

# Entrées :   
   * **gradfk**           : (Array{Float,1}) le gradient de la fonction f appliqué au point xk
   * **hessfk**           : (Array{Float,2}) la Hessienne de la fonction f appliqué au point xk
   * **options**          : (Array{Float,1})
      - **delta**    : le rayon de la région de confiance
      - **max_iter** : le nombre maximal d'iterations
      - **tol**      : la tolérance pour la condition d'arrêt sur le gradient


# Sorties:
   * **s** : (Array{Float,1}) le pas s qui approche la solution du problème : ``min_{||s||< \delta_{k}} q(s)``

# Exemple d'appel:
```julia
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
xk = [1; 0]
options = []
s = Gradient_Conjugue_Tronque(gradf(xk),hessf(xk),options)
```
"""
function Gradient_Conjugue_Tronque(gradfk,hessfk,options)

    # Initialisation des variables 
    g = gradfk
    H = hessfk
    n = length(gradfk)
    s = zeros(n) 
    sj = s            #s0 
    gj = g            #p0 
    pj = -g           #g0 
    sj1 = sj          #sj+1 
    gj1 = gj          #pj+1 
    pj1 = pj          #gj+1   
    j = -1  
    q(x) = g'*x + (1/2)*x'*H*x

    # Si option est vide on initialise les 3 paramètres par défaut
    if options == []
        deltak = 2
        max_iter = 100
        tol = 1e-6
    else
        deltak = options[1]
        max_iter = options[2]
        tol = options[3]
    end

    if g != zeros(n)
        while j <= max_iter
            j += 1
            kj = pj'*H*pj
            if kj <= 0
                sigma_neg = ( (-2*sj'*pj) - sqrt(4*(sj'*pj)^2 - 4*norm(pj)^2*(norm(sj)^2 - deltak^2)) )/( 2*norm(pj)^2 )
                sigma_pos = ( (-2*sj'*pj) + sqrt(4*(sj'*pj)^2 - 4*norm(pj)^2*(norm(sj)^2 - deltak^2)) )/( 2*norm(pj)^2 )
                if q(sj + sigma_neg*pj) <= q(sj + sigma_pos*pj)
                    s = sj + sigma_neg*pj
                else
                    s = sj + sigma_pos*pj
                end
                break
            end
            
            alphaj = (gj'*gj)/kj
            if norm(sj+alphaj*pj) >= deltak
                sigma_neg = ( (-2*sj'*pj) - sqrt(4*(sj'*pj)^2 - 4*norm(pj)^2*(norm(sj)^2 - deltak^2)) )/( 2*norm(pj)^2 )
                sigma_pos = ( (-2*sj'*pj) + sqrt(4*(sj'*pj)^2 - 4*norm(pj)^2*(norm(sj)^2 - deltak^2)) )/( 2*norm(pj)^2 )
                if sigma_neg >= 0 
                    s = sj + sigma_neg*pj
                else 
                    s = sj + sigma_pos*pj
                end
                break
            end

            sj1 = sj + alphaj*pj
            gj1 = gj + alphaj*H*pj
            betaj = (gj1'*gj1)/(gj'*gj)
            pj1 = -gj1 + betaj*pj
            
            if norm(gj1) <= tol*norm(g)
                s = sj1
                break
            end

            sj = sj1
            gj = gj1
            pj = pj1
        end
    end
   
   return s
end
