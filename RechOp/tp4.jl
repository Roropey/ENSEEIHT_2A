#probleme du sac a dos
function prog_dynamique(valeurs, poids, capacite) 
    n = length(valeurs) +1
    m = capacite+1 
    tab = zeros(Int8, n, m)
    solution = zeros(Int8, n)

    # Creation du tableau
    # première colonne et premiere ligne à 0 
    for i in 2:n
        for j in 2:m
            if j-poids[i-1] >= 1
                tab[i, j] = max(tab[i-1, j], tab[i-1, j - poids[i-1]] + valeurs[i-1])
            else
                tab[i, j] = tab[i-1, j]
            end
        end
    end

    # Resolution du probleme
    j = m
    for i in 1:n-1
        k = n+1-i
        if tab[k, j] != tab[k-1, j]
            solution[k-1] = 1
            j = j - poids[k-1]
        end
    end
    return tab[n, m], solution
end

# Exemple d'execution de l'énoncé
valeurs = [42, 40, 25, 12, 20]
poids = [7, 4, 5, 3, 6]
capacite = 12 
t, solution = prog_dynamique(valeurs, poids, capacite)