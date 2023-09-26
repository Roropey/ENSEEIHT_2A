
public class CalculHauteur implements VisiteurExpression<Integer>{

    @Override
    public Integer visiterAccesVariable(AccesVariable v) {
        return 1;
    }

    @Override
    public Integer visiterConstante(Constante c) {
        return 1;
    }

    @Override
    public Integer visiterExpressionBinaire(ExpressionBinaire e) {

        return 1 + Math.max(e.getOperandeGauche().accepter(this),e.getOperandeDroite().accepter(this));
    }

    @Override
    public Integer visiterAddition(Addition a) {

        return 0;
    }

    @Override
    public Integer visiterMultiplication(Multiplication m) {

        return 0;
    }
   
    public Integer visiterSoustraction(Soustraction a) {
		return 0;
	}
    @Override
    public Integer visiterExpressionUnaire(ExpressionUnaire e) {

        return 1+e.getOperande().accepter(this);
    }

    @Override
    public Integer visiterNegation(Negation n) {

        return 0;
    }

    
}
