import javax.annotation.processing.*;
import javax.lang.model.SourceVersion;
import javax.lang.model.element.*;
import java.util.*;
import javax.tools.Diagnostic.Kind;

/** Check that a class marked {@code @Utility} is indeed a utility class. */
@SupportedAnnotationTypes("Utility")
@SupportedSourceVersion(SourceVersion.RELEASE_11)
public class UtilityProcessor extends AbstractProcessor {

	@Override
	public boolean process(
			Set<? extends TypeElement> annotations,
			RoundEnvironment roundingEnvironment)
	{
		Messager messager = processingEnv.getMessager();
		messager.printMessage(Kind.NOTE,
				"UtilityProcessor executed.");
		//messager.printMessage(Kind.WARNING,
		//		"The provided UtilityProcessor class is wrong.  Correct it!");
		for (TypeElement te : annotations) {
			for (Element elt : roundingEnvironment.getElementsAnnotatedWith(te)) {
				
				if (elt.getKind() == ElementKind.CLASS) {	// elt is a class
					try {
						// Check that the class is declared final
						if (elt.getModifiers().contains(Modifier.FINAL)) {
							// Check that enclosed elements are static
							List<? extends Element> listeEnclosedElements = elt.getEnclosedElements();
							boolean verificateur = true;
							for (Element e : listeEnclosedElements) {
								if (e.getKind()==ElementKind.CONSTRUCTOR){
									ExecutableElement constructeur = (ExecutableElement) e;
									if (constructeur.getParameters().size()>0){
										verificateur = false;
										messager.printMessage(Kind.ERROR,
											"@Utility applies to class instantiated  :", e);
									}
								} else {
								
									if (!(e.getModifiers().contains(Modifier.STATIC))) {
										messager.printMessage(Kind.ERROR,
											"@Utility applies to static enclosed elements:", e);
										verificateur = false;

									}
								}							
							}
							if (verificateur) {

							} 
						} else {messager.printMessage(Kind.ERROR,
							"@Utility applies to final class only:", elt);
						}

						
					} catch (Exception e){
						e.printStackTrace();
					}
					

				} else {
					messager.printMessage(Kind.ERROR,
							"@Utility applies to class only:", elt);
				}
			}
		}
		return true;
	}

}
