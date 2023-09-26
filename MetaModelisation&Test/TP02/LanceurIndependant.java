import java.lang.management.ThreadInfo;
import java.lang.reflect.*;
import java.util.*;

/** L'objectif est de faire un lanceur simple sans utiliser toutes les clases
  * de notre architecture JUnit.   Il permet juste de valider la compréhension
  * de l'introspection en Java.
  */
public class LanceurIndependant {
	private int nbTestsLances;
	private int nbErreurs;
	private int nbEchecs;
	private List<Throwable> erreurs = new ArrayList<>();

	public LanceurIndependant(String... nomsClasses) {
	    System.out.println();
		this.nbEchecs = 0;
		this.nbErreurs = 0;
		this.nbTestsLances = 0;
		// Lancer les tests pour chaque classe
		for (String nom : nomsClasses) {
			try {
				System.out.print(nom + " : ");
				this.testerUneClasse(nom);
				System.out.println();
			} catch (ClassNotFoundException e) {
				System.out.println(" Classe inconnue !");
			} catch (Exception e) {
				System.out.println(" Problème : " + e);
				e.printStackTrace();
			}
		}

		// Afficher les erreurs
		for (Throwable e : erreurs) {
			System.out.println();
			e.printStackTrace();
		}

		// Afficher un bilan
		System.out.println();
		System.out.printf("%d tests lancés dont %d échecs et %d erreurs.\n",
				nbTestsLances, nbEchecs, nbErreurs);
	}


	public int getNbTests() {
		return this.nbTestsLances;
	}


	public int getNbErreurs() {
		return this.nbErreurs;
	}


	public int getNbEchecs() {
		return this.nbEchecs;
	}


	private void testerUneClasse(String nomClasse)
		throws ClassNotFoundException, InstantiationException,
						  IllegalAccessException
	{
		// Récupérer la classe

		Class<?> classTestee = Class.forName(nomClasse);

		// Récupérer les méthodes "preparer" et "nettoyer"
		Method preparer=null;
		try {
			preparer = classTestee.getMethod("preparer");
		} catch (NoSuchMethodException e){

		} 
		Method nettoyer=null;
		try {		
			nettoyer = classTestee.getMethod("nettoyer");
		} catch (NoSuchMethodException e){

		}
		Constructor<?> constructeurTest = null;
		// Instancier l'objet qui sera le récepteur des tests
		try {		
			constructeurTest = classTestee.getConstructor();
		} catch (NoSuchMethodException e){
			e.printStackTrace();
		}
		
		Object objet = null;
		try {
			objet = constructeurTest.newInstance();
		} catch (IllegalArgumentException e){
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		// Exécuter les méthods de test
		List<Method> methodesTests = new ArrayList<Method>();
		Method[] methodes = classTestee.getMethods();
		for (Method methode : methodes){
			int indice = methode.getModifiers();
			if ((methode.getName().startsWith("test")) && (Modifier.isPublic(indice))  && !(Modifier.isStatic(indice)) &&(methode.getParameterCount()==0)) {
				methodesTests.add(methode);
			}
		}
		try {
			preparer.invoke(objet);
		}catch (Exception e){

		}
		for (Method test : methodesTests){
			try {
				this.nbTestsLances ++;
				test.invoke(objet);
			} catch (Exception e) {
				this.nbErreurs++;				
				this.erreurs.add(e);
			} catch (Echec e){
				this.nbEchecs++;
			}
			
		}
		try {
			nettoyer.invoke(objet);
		}catch (Exception e){

		}
	}

	public static void main(String... args) {
		LanceurIndependant lanceur = new LanceurIndependant(args);
	}

}
