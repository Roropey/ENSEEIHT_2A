@doc doc"""
Tester l'algorithme des régions de confiance

# Entrées :
   * affichage : (Bool) affichage ou non des résultats de chaque test

# les cas de test (dans l'ordre)
   * avec Cauchy :
	   - fct 1 : x011,x012
	   - fct 2 : x021,x022,x023
   * avec gct :
       - fct 1 : x011,x012
       - fct 2 : x021,x022,x023
"""
function tester_regions_de_confiance(afficher::Bool,Regions_De_Confiance::Function)

	# La tolérance utilisée dans les tests
	tol_erreur = 1e-2
	# initialisation des variables de l'algorithme
	gamma1 = 0.5
	gamma2 = 2.00
	eta1 = 0.25
	eta2 = 0.75
	deltaMax = 10
	Tol_abs = sqrt(eps())
	Tol_rel = 1e-8
    epsilon = 1
	maxits = 5000
	delta0_1 = 2
	delta0_2 = 2
	options1 =[deltaMax,gamma1,gamma2,eta1,eta2,delta0_1,maxits,Tol_abs,Tol_rel,epsilon]
	options2 =[deltaMax,gamma1,gamma2,eta1,eta2,delta0_2,maxits,Tol_abs,Tol_rel,epsilon]

	# l'ensemble de tests
	@testset "La méthode des RC " begin
		###################################################
		#	les tests avec le pas de Cauchy 			  #
		###################################################
		# Un premier sous-ensemble de tests
		@testset "avec Cauchy " begin
			# cas de test 1
			x_min11, fmin11, flag11, nb_iters11 = Regions_De_Confiance("cauchy",fct1,grad_fct1,hess_fct1,pts1.x011,options1)
			if (afficher)
				afficher_resultats("régions de confiance avec "*"cauchy","fonction 1","x011",x_min11,fmin11, flag11,sol_exacte_fct1,nb_iters11)
			end
			@test isapprox(x_min11,sol_exacte_fct1 ,atol=tol_erreur)
			@test flag11 == 2
			@test nb_iters11 == 26

			# cas de test 2
			x_min12, fmin12, flag12, nb_iters12  = Regions_De_Confiance("cauchy",fct1,grad_fct1,hess_fct1,pts1.x012,options1)
			if (afficher)
				afficher_resultats("régions de confiance avec "*"cauchy","fonction 1","x012",x_min12,fmin12, flag11,sol_exacte_fct1,nb_iters12)
			end
			@test x_min12 ≈ sol_exacte_fct1 atol=tol_erreur
			@test flag12 == 2
			@test nb_iters12 == 28

			# cas de test 3
			x_min21, fmin21, flag21, nb_iters21,  = Regions_De_Confiance("cauchy",fct2,grad_fct2,hess_fct2,pts1.x021,options2)
			if (afficher)
				afficher_resultats("régions de confiance avec "*"cauchy","fonction 2","x021",x_min21,fmin21, flag21,sol_exacte_fct2,nb_iters21)
			end
			@test x_min21 ≈ sol_exacte_fct2 atol=tol_erreur
			@test flag21 == 2
			@test nb_iters21 == 3988

			# cas de test 4
			x_min22, fmin22, flag22, nb_iters22 = Regions_De_Confiance("cauchy",fct2,grad_fct2,hess_fct2,pts1.x022,options2)
			println("iters = ", nb_iters22)
			if (afficher)
				afficher_resultats("régions de confiance avec "*"cauchy","fonction 2","x022",x_min22,fmin22, flag22,sol_exacte_fct2,nb_iters22)
			end
			@test x_min22 ≈ sol_exacte_fct2 atol=tol_erreur
			@test flag22 == 0
			@test nb_iters22 == 864

			# cas de test 5
			x_min23, fmin23, flag23, nb_iters23 = Regions_De_Confiance("cauchy",fct2,grad_fct2,hess_fct2,pts1.x023,options2)
			if (afficher)
				afficher_resultats("régions de confiance avec "*"cauchy","fonction 2","x023",x_min23,fmin23, flag23,sol_exacte_fct2,nb_iters23)
			end
			@test x_min23 ≈ sol_exacte_fct2 atol=tol_erreur
			@test flag23 == 2
			@test nb_iters23 == 3198
		end

		###################################################
		#	les tests avec le gradient conjugué tronqué   #
		###################################################
		# Un deuxième sous-ensemble de tests
		#= @testset "avec GCT " begin
			# cas de test 1
			x_min11, fmin11, flag11, nb_iters11= Regions_De_Confiance("gct",fct1,grad_fct1,hess_fct1,pts1.x011,options1)
			if (afficher)
				afficher_resultats("régions de confiance avec "*"gct","fonction 1","x011",x_min11,fmin11, flag11,sol_exacte_fct1,nb_iters11)
			end
			@test isapprox(x_min11,sol_exacte_fct1 ,atol=tol_erreur)
			@test flag11 == 0
			@test nb_iters11 == 1

			# cas de test 2
			x_min12, fmin12, flag12, nb_iters12 = Regions_De_Confiance("gct",fct1,grad_fct1,hess_fct1,pts1.x012,options1)
			if (afficher)
				afficher_resultats("régions de confiance avec "*"gct","fonction 1","x012",x_min12,fmin12, flag12,sol_exacte_fct1,nb_iters12)
			end
			@test x_min12 ≈ sol_exacte_fct1 atol=tol_erreur
			@test flag12 == 0
			@test nb_iters12 == 3

			# cas de test 3
			x_min21, fmin21, flag21, nb_iters21 = Regions_De_Confiance("gct",fct2,grad_fct2,hess_fct2,pts1.x021,options2)
			if (afficher)
				afficher_resultats("régions de confiance avec "*"gct","fonction 2","x021",x_min21,fmin21, flag21,sol_exacte_fct2,nb_iters21)
			end
			@test x_min21 ≈ sol_exacte_fct2 atol=tol_erreur
			@test flag21 == 0
			@test nb_iters21 == 31
			

			# cas de test 4
			x_min22, fmin22, flag22, nb_iters22 = Regions_De_Confiance("gct",fct2,grad_fct2,hess_fct2,pts1.x022,options2)
			if (afficher)
				afficher_resultats("régions de confiance avec "*"gct","fonction 2","x022",x_min22,fmin22, flag22,sol_exacte_fct2,nb_iters22)
			end
			@test x_min22 ≈ sol_exacte_fct2 atol=tol_erreur
			@test flag22 == 0
			@test nb_iters22 == 44

			# cas de test 5
			x_min23, fmin23, flag23, nb_iters23 = Regions_De_Confiance("gct",fct2,grad_fct2,hess_fct2,pts1.x023,options2)
			if (afficher)
				afficher_resultats("régions de confiance avec "*"gct","fonction 2","x023",x_min11,fmin23, flag23,sol_exacte_fct2,nb_iters23)
			end
			@test x_min23 ≈ sol_exacte_fct2 atol=tol_erreur
			@test flag23 == 0
			@test nb_iters23 == 19
        end =#
	end
end
