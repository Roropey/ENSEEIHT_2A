/**
  * PrioriteExpression :
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public class PrioriteExpression implements VisiteurExpression<Integer> {

	public Integer visiterAccesVariable(AccesVariable v) {
		return 1;
	}

	public Integer visiterConstante(Constante c) {
		return 1;
	}

	public Integer visiterExpressionBinaire(ExpressionBinaire e) {
		return e.getOperateur().accepter(this);
	}

	public Integer visiterAddition(Addition a) {
		return 5;
	}

	public Integer visiterMultiplication(Multiplication m) {
		return 4;
	}

	public Integer visiterExpressionUnaire(ExpressionUnaire e) {
		return e.getOperateur().accepter(this);
	}

	public Integer visiterNegation(Negation n) {
		return 2;
	}

}
