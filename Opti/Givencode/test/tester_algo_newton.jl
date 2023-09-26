@doc doc"""
Tester l'algorithme de Newton local

# Entrées :
   * afficher : (Bool) affichage ou non des résultats de chaque test

# Les cas de test (dans l'ordre)
   * fct 1 : x011,x012
   * fct 2 : x021,x022
"""
function tester_algo_newton(afficher::Bool,Algorithme_De_Newton::Function)
	max_iter = 100
    Tol_abs = sqrt(eps())
    Tol_rel = 1e-15
    epsilon = 1.
	options = [max_iter, Tol_abs, Tol_rel, epsilon]
	@testset "L'algo de Newton" begin
		@testset "Cas test 1 x0 = solution" begin
		    # point de départ x011
		    x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct1,grad_fct1,hess_fct1,sol_exacte_fct1,options)
		    if (afficher)
		    	afficher_resultats("algorithme de Newton ","fct1","x011",x_min,fx_min,flag,sol_exacte_fct1,nb_iters)
		    end
			@testset "solution" begin
		    @test isapprox(x_min, sol_exacte_fct1 , atol = tol_erreur)
		    end
			@testset "itération" begin
		    @test nb_iters == 0
		    end
			@testset "flag" begin
			@test flag == 0
			end
		end
		@testset "Cas test 1 x0 = x011" begin
		    #point de départ x011
		    x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct1,grad_fct1,hess_fct1,pts1.x011,options)
		    if (afficher)
		    	afficher_resultats("algorithme de Newton ","fct1","x011",x_min,fx_min,flag,sol_exacte_fct1,nb_iters)
		    end
			@testset "solution" begin
		    @test isapprox(x_min, sol_exacte_fct1 , atol = tol_erreur)
		    end
			@testset "itération" begin
		    @test nb_iters == 1
		    end
			@testset "flag" begin
			@test flag == 0
			end
		end
		@testset "Cas test 1 x0 = x012" begin
		    x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct1,grad_fct1,hess_fct1,pts1.x012,options)
		    if (afficher)
		    	afficher_resultats("algorithme de Newton ","fct1","x012",x_min,fx_min,flag,sol_exacte_fct1,nb_iters)
		    end
		    @testset "solution" begin
				@test x_min ≈ sol_exacte_fct1  atol = tol_erreur
            end
			@testset "itération" begin
				@test nb_iters == 1
            end
			@testset "flag" begin
			@test flag == 0
			end
		end
		@testset "Cas test 2 x0 = solution" begin
			x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct1,grad_fct1,hess_fct1,sol_exacte_fct1,options)
			if (afficher)
				afficher_resultats("algorithme de Newton ","fct1","x011",x_min,fx_min,flag,sol_exacte_fct1,nb_iters)
			end
			@testset "solution" begin
			@test isapprox(x_min, sol_exacte_fct1 , atol = tol_erreur)
			end
			@testset "itération" begin
			@test nb_iters == 0
			end
			@testset "flag" begin
			@test flag == 0
			end
		end
		@testset "Cas test 2 x0 = x021" begin
		    x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,pts1.x021,options)
		    if (afficher)
			    afficher_resultats("algorithme de Newton ","fct2","x021",x_min,fx_min,flag,sol_exacte_fct2,nb_iters)
		    end
		    @testset "solution" begin
			    @test x_min ≈ sol_exacte_fct2  atol = tol_erreur
	        end
			@testset "itération" begin
				@test nb_iters == 6
            end
			@testset "flag" begin
			@test flag == 0
			end
		end
		@testset "Cas test 2 x0 = x022" begin
		    x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,pts1.x022,options)
		    if (afficher)
		    	afficher_resultats("algorithme de Newton ","fct2","x022",x_min,fx_min,flag,sol_exacte_fct2,nb_iters)
		    end
		    @testset "solution" begin
				@test x_min ≈ sol_exacte_fct2  atol = tol_erreur
            end
			@testset "itération" begin
				@test nb_iters == 5
            end
			@testset "flag" begin
			@test flag == 0
			end
		end

		@testset "Cas test 2 x0 = x023" begin
			options[1] = 1
			sol = [-4.99999958629818e9, 8.673617379884035e-19]
		    x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,pts1.x023,options)
		    if (afficher)
		    	afficher_resultats("algorithme de Newton ","fct2","x022",x_min,fx_min,flag,sol_exacte_fct2,nb_iters)
		    end
		    @testset "solution" begin
				@test x_min ≈ sol  atol = tol_erreur
            end
			@testset "flag" begin
			@test flag == 3
			end
			@testset "itération" begin
			@test nb_iters == 1
			end
		    @testset "exception" begin
				options[1] = 100
			    @test_throws SingularException x_min, fx_min, flag, nb_iters = Algorithme_De_Newton(fct2,grad_fct2,hess_fct2,pts1.x023,options)
			end
		end
	end
end
