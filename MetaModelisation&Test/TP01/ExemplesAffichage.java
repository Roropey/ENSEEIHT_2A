/**
  * Exemples d'affichage d'expressions arithmétiques
  *
  * @author	Xavier Crégut
  * @version	$Revision$
  */

public class ExemplesAffichage {

	static final private OperateurBinaire plus = new Addition();
	static final private OperateurBinaire fois = new Multiplication();
	static final private OperateurBinaire moins = new Soustraction();
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

	static public Expression expression3() {
		return new ExpressionBinaire(moins,
					new Constante(3),
					new ExpressionBinaire(fois,
							new AccesVariable("y"),
							new Constante(40)));
	}


	public static void main(String[] args) {
		System.out.println("Affichage Infixe :");
		// Afficher expression 1
		AfficheurInfixe infixe = new AfficheurInfixe();
		String e1infixe = expression1().accepter(infixe);
		System.out.println("e1 = " + e1infixe);

		// Afficher expression2
		String e2infixe = expression2().accepter(infixe);
		System.out.println("e2 = " + e2infixe);

		// Afficher expression3
		String e3infixe = expression3().accepter(infixe);
		System.out.println("e3 = " + e3infixe);

		System.out.println("Affichage Postfixe :");
		// Afficher expression 1
		AfficheurPostfixe postfixe = new AfficheurPostfixe();
		String e1postfixe = expression1().accepter(postfixe);
		System.out.println("e1 = " + e1postfixe);

		// Afficher expression2
		String e2postfixe = expression2().accepter(postfixe);
		System.out.println("e2 = " + e2postfixe);

		// Afficher expression3
		String e3postfixe = expression3().accepter(postfixe);
		System.out.println("e3 = " + e3postfixe);

		System.out.println("Affichage Hauteur :");
		// Afficher expression 1
		CalculHauteur hauteur = new CalculHauteur();
		Integer e1hauteur = expression1().accepter(hauteur);
		System.out.println("e1 = " + e1hauteur);

		// Afficher expression2
		Integer e2hauteur = expression2().accepter(hauteur);
		System.out.println("e2 = " + e2hauteur);

		// Afficher expression3
		Integer e3hauteur = expression3().accepter(hauteur);
		System.out.println("e3 = " + e3hauteur);
	}
}

