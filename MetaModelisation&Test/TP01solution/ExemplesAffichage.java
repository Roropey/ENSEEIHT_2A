/**
  * Exemples d'affichage d'expressions arithmétiques
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public class ExemplesAffichage {

	static final private OperateurBinaire plus = new Addition();
	static final private OperateurBinaire fois = new Multiplication();
	static final private OperateurUnaire negation = new Negation();

	static public Expression expression1() {
		return new ExpressionUnaire(negation,
					new ExpressionBinaire(fois,
						new Constante(2),
						new ExpressionBinaire(plus,
							new Constante(1),
							new AccesVariable("x"))));
	}

	static public Expression expression2() {
		return new ExpressionBinaire(plus,
					new Constante(5),
					new ExpressionBinaire(fois,
							new AccesVariable("x"),
							new Constante(4)));
	}


	public static void main(String[] args) {
		// Afficher expression 1
		AfficheurInfixe infixe = new AfficheurInfixe();
		String e1infixe = expression1().accepter(infixe);
		System.out.println("e1 = " + e1infixe);
		AfficheurPostfixe postfixe = new AfficheurPostfixe();
		String e1postfixe = expression1().accepter(postfixe);
		System.out.println("e1 = " + e1postfixe);

		// Afficher expression2
		String e2infixe = expression2().accepter(infixe);
		System.out.println("e2 = " + e2infixe);
		String e2postfixe = expression2().accepter(postfixe);
		System.out.println("e2 = " + e2postfixe);
	}
}

