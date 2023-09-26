@doc doc"""
#### Objet
Cette fonction calcule une solution approchée du problème

```math
\min_{||s||< \Delta}  q(s) = s^{t} g + \frac{1}{2} s^{t}Hs
```

par l'algorithme du gradient conjugué tronqué

#### Syntaxe
```julia
s = Gradient_Conjugue_Tronque(g,H,option)
```

#### Entrées :   
   - g : (Array{Float,1}) un vecteur de ``\mathbb{R}^n``
   - H : (Array{Float,2}) une matrice symétrique de ``\mathbb{R}^{n\times n}``
   - options          : (Array{Float,1})
      - delta    : le rayon de la rég_ion de confiance
      - max_iter : le nombre maximal d'iterations
      - tol      : la tolérance pour la condition d'arrêt sur le gradient

#### Sorties:
   - s : (Array{Float,1}) le pas s qui approche la solution du problème : ``min_{||s||< \Delta} q(s)``

#### Exemple d'appel:
```julia
gradf(x)=[-400*x[1]*(x[2]-x[1]^2)-2*(1-x[1]) ; 200*(x[2]-x[1]^2)]
hessf(x)=[-400*(x[2]-3*x[1]^2)+2  -400*x[1];-400*x[1]  200]
xk = [1; 0]
options = []
s = Gradient_Conjugue_Tronque(gradf(xk),hessf(xk),options)
```
"""
function Gradient_Conjugue_Tronque(g,H,options)

    "# s_i option est vide on initialise les 3 paramètres par défaut"
    if options == []
        delta = 2
        max_iter = 100
        tol = 1e-6
    else
        delta = options[1]
        max_iter = options[2]
        tol = options[3]
    end
    
    n = length(g)
    s = zeros(n)
    nb_iters = 0
    s_i = s
    g_i = g
    p_i = -g

    q(x)= g'*x+(1/2)*x'*H*x

    Commencement = (nb_iters < max_iter) && (norm(g_i) > norm(g)*tol) && (norm(g)!=0)
    
    while (nb_iters <= max_iter) && Commencement

        kappa_i = p_i'*H*p_i

        if kappa_i <= 0
            discr = 4*(s_i'*p_i)^2 - 4*norm(p_i)^2*(norm(s_i)^2 - delta^2)
            sigma_racine_1 = ((-2*s_i'*p_i) - sqrt(discr))/( 2*norm(p_i)^2 )
            sigma_racine_2 = ((-2*s_i'*p_i) + sqrt(discr))/( 2*norm(p_i)^2 )
            if q(s_i + sigma_racine_1*p_i) <= q(s_i + sigma_racine_2*p_i)
                s = s_i + sigma_racine_1*p_i
            else
                s = s_i + sigma_racine_2*p_i
            end
            break
        end

        alpha_i = (g_i'*g_i)/kappa_i

        if norm(s_i + alpha_i*p_i) >= delta
            discr = 4*(s_i'*p_i)^2 - 4*norm(p_i)^2*(norm(s_i)^2 - delta^2)
            sigma_racine_1 = ((-2*s_i'*p_i) - sqrt(discr))/( 2*norm(p_i)^2 )
            sigma_racine_2 = ((-2*s_i'*p_i) + sqrt(discr))/( 2*norm(p_i)^2 )
            if sigma_racine_1 >= 0
                s = s_i + sigma_racine_1*p_i
            else
                s = s_i + sigma_racine_2*p_i
            end
            break
        end

        s_i = s_i + alpha_i*p_i
        g_i_next = g_i + alpha_i*H*p_i
        betai = (g_i_next'*g_i_next)/(g_i'*g_i)
        p_i = -g_i_next + betai*p_i

        g_i = g_i_next
        nb_iters +=1

        if norm(g_i) <= tol*norm(g)
            s = s_i
            break
        end 

   end
   return s
   #=
   # Initialisation des variables 
   
   n = length(g)
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
  =#
end
