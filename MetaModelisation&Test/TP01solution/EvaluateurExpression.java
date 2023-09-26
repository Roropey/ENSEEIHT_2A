import java.util.Map;
import java.util.HashMap;

/**
  * Évaluer une expression.
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public class EvaluateurExpression implements VisiteurExpression<Integer> {

	private Map<String, Integer> environnement;
	
	// attributs utilisés pour les expressions binaires car quand on appelle
	// accepter(this) sur l'opérateur d'une expression binaire, les deux
	// opérandes doivent être disponibles.
	// Remarque : le calcul des opérandes ne peut pas être fait dans
	// visiterAddition car Addition n'a pas accès à ses opérandes.
	private int operandeGauche;	// opérande gauche d'un op. binaire
	private int operandeDroite;	// opérande droite d'un op. binaire

	// attributs utilisés pour les opérateurs binaires.  Même principe que pour
	// les expression binaires.
	private int operande;	// opérande d'un opérateur unaire

	public EvaluateurExpression(Map<String, Integer> environnement) {
		this.environnement = environnement;
	}

	public Integer visiterAccesVariable(AccesVariable v) {
		Integer valeur = environnement.get(v.getNom());
		if (valeur == null) {
			throw new RuntimeException("Variable non définie : " + v.getNom());
		}
		return valeur;
	}

	public Integer visiterConstante(Constante c) {
		return c.getValeur();
	}

	public Integer visiterExpressionBinaire(ExpressionBinaire e) {
		int og = e.getOperandeGauche().accepter(this);
		this.operandeDroite = e.getOperandeDroite().accepter(this);
		this.operandeGauche = og;
		return e.getOperateur().accepter(this);
	}

	public Integer visiterAddition(Addition a) {
		return this.operandeGauche + this.operandeDroite;
	}

	public Integer visiterMultiplication(Multiplication m) {
		return this.operandeGauche * this.operandeDroite;
	}

	public Integer visiterExpressionUnaire(ExpressionUnaire e) {
		this.operande = e.getOperande().accepter(this);
		return e.getOperateur().accepter(this);
	}

	public Integer visiterNegation(Negation n) {
		return - this.operande;
	}

}
