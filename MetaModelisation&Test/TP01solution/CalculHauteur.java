/**
  * Calculer la hauteur d'une expression.
  * @author	Xavier Crégut
  * @version	$Revision$
  */
public class CalculHauteur implements VisiteurExpression<Integer> {

	public Integer visiterAccesVariable(AccesVariable v) {
		return 1;
	}

	public Integer visiterConstante(Constante c) {
		return 1;
	}

	public Integer visiterExpressionBinaire(ExpressionBinaire e) {
		int hauteurGauche = e.getOperandeGauche().accepter(this);
		int hauteurDroite = e.getOperandeDroite().accepter(this);
		return 1 + Math.max(hauteurGauche, hauteurDroite);
	}

	public Integer visiterAddition(Addition a) {
		throw new UnsupportedOperationException();
	}

	public Integer visiterMultiplication(Multiplication m) {
		throw new UnsupportedOperationException();
	}

	public Integer visiterExpressionUnaire(ExpressionUnaire e) {
		return 1 + e.getOperande().accepter(this);
	}

	public Integer visiterNegation(Negation n) {
		throw new UnsupportedOperationException();
	}

}
