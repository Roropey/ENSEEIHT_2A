using Markdown
using Test
using LinearAlgebra

include("../src/Algorithme_De_Newton.jl")
include("../src/Gradient_Conjugue_Tronque.jl")
include("../src/Lagrangien_Augmente.jl")
include("../src/Pas_De_Cauchy.jl")#
include("../src/Regions_De_Confiance.jl")

#include("cacher_stacktrace.jl")
#cacher_stacktrace()


# Tolérance pour les tests d'égalité
tol_erreur = sqrt(eps())

## ajouter les fonctions de test
include("./fonctions_de_tests.jl")

include("./tester_algo_newton.jl")

include("tester_pas_de_cauchy.jl")
#
include("tester_gct.jl")

include("tester_regions_de_confiance.jl")

include("tester_lagrangien_augmente.jl")

affiche = true
println("affiche = ",affiche)
# Tester l'ensemble des algorithmes
@testset "Test SujetOptinum" begin
	# Tester l'algorithme de Newton
	tester_algo_newton(affiche,Algorithme_De_Newton)

	# Tester l'algorithme du pas de Cauchy
	tester_pas_de_cauchy(affiche,Pas_De_Cauchy)

	# Tester l'algorithme du gradient conjugué tronqué
	tester_gct(affiche,Gradient_Conjugue_Tronque)

	# Tester l'algorithme des Régions de confiance avec PasdeCauchy | GCT
	tester_regions_de_confiance(affiche,Regions_De_Confiance)

	# Tester l'algorithme du Lagrangien Augmenté
	tester_lagrangien_augmente(affiche,Lagrangien_Augmente)
end
