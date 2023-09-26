@doc doc"""
Tester l'algorithme du pas de Cauchy

# Entrées :
   * afficher : (Bool) affichage ou non des résultats de chaque test

"""
function tester_pas_de_Cauchy(afficher::Bool,Pas_De_Cauchy::Function)
	
	
	@testset "L'algo du pas de Cauchy" begin
		@testset "Cas test 1" begin
			g = [0; 0]
			H = [7 0 ; 0 2]
			delta = 1
		    s, e = Pas_De_Cauchy(g,H,delta)
		    if (afficher)
		    	afficher_resultats("algorithme du pas de Cauchy ","s","e",s,e,s_sol_exact,)
		    end
			@testset "solution" begin
		    @test s == [0.0;0.0]
		    end
			@testset "indice" begin
		    @test e == 0
		    end
			
		end

		@testset "Cas test 2" begin
			g = [1; 2]
			H = -I
			delta = 5
		    s, e = Pas_De_Cauchy(g,H,delta)
		    if (afficher)
		    	afficher_resultats("algorithme du pas de Cauchy ","s","e",s,e,s_sol_exact,)
		    end
			@testset "solution" begin
		    @test s == -delta/norm(g)*g
		    end
			@testset "indice" begin
		    @test e == -1
		    end
			
		end

		@testset "Cas test 3" begin
			g = [1; 1]
			H = I
			delta = 0.9*norm(g)
		    s, e = Pas_De_Cauchy(g,H,delta)
		    if (afficher)
		    	afficher_resultats("algorithme du pas de Cauchy ","s","e",s,e,s_sol_exact,)
		    end
			@testset "solution" begin
		    @test s == -delta/norm(g)*g
		    end
			@testset "indice" begin
		    @test e == -1
		    end			
		end

		@testset "Cas test 4" begin
			g = [1; 1]
			H = I
			delta = 1.1*norm(g)
		    s, e = Pas_De_Cauchy(g,H,delta)
		    if (afficher)
		    	afficher_resultats("algorithme du pas de Cauchy ","s","e",s,e,s_sol_exact,)
		    end
			@testset "solution" begin
		    @test s == -norm(g)^2/(g'*H*g)*g
		    end
			@testset "indice" begin
		    @test e == 1
		    end			
		end

		@testset "Cas test 5" begin
			g = [1; 1]
			H = zeros(2,2)
			delta = 1
		    s, e = Pas_De_Cauchy(g,H,delta)
		    if (afficher)
		    	afficher_resultats("algorithme du pas de Cauchy ","s","e",s,e,s_sol_exact,)
		    end
			@testset "solution" begin
		    @test s == -delta/norm(g)*g
		    end
			@testset "indice" begin
		    @test e == -1
		    end			
		end

		@testset "Cas test 5" begin
			g = [1; 1]
			H = -I
			delta = 1
		    s, e = Pas_De_Cauchy(g,H,delta)
		    if (afficher)
		    	afficher_resultats("algorithme du pas de Cauchy ","s","e",s,e,s_sol_exact,)
		    end
			@testset "solution" begin
		    @test s == -delta/norm(g)*g
		    end
			@testset "indice" begin
		    @test e == -1
		    end			
		end
	end
	
end
