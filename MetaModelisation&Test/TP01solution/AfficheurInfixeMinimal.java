/**
  * AfficheurInfixeMinimal :
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public class AfficheurInfixeMinimal extends AfficheurInfixe {

	private final static PrioriteExpression priorite = new PrioriteExpression();

	private int getPriorite(Expression e) {
		return e.accepter(priorite);
	}

	public String visiterAccesVariable(AccesVariable v) {
		return v.getNom();
	}

	public String visiterConstante(Constante c) {
		return String.valueOf(c.getValeur());
	}

	private String expressionToString(Expression e, boolean avecParentheses) {
		String eInfixe = e.accepter(this);
		if (avecParentheses) {
			return "(" + eInfixe + ")";
		} else {
			return eInfixe;
		}
	}

	public String visiterExpressionBinaire(ExpressionBinaire e) {
		String eGauche = expressionToString(e.getOperandeGauche(),
				getPriorite(e.getOperandeGauche()) > getPriorite(e));
		String eDroite = expressionToString(e.getOperandeDroite(),
					getPriorite(e.getOperandeDroite()) >= getPriorite(e));
		String op = e.getOperateur().accepter(this);
		return  eGauche + " " + op + " " + eDroite;
	}

	public String visiterExpressionUnaire(ExpressionUnaire e) {
		return 
			e.getOperateur().accepter(this)
			+ " "
			+ expressionToString(e.getOperande(),
					getPriorite(e.getOperande()) > getPriorite(e));
	}

}
