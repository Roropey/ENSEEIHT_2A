import java.lang.annotation.*;

/** Indicate that a class is a utility class and thus only defines
  * static methods Utility.
  */
@Target(ElementType.TYPE)
@Retention(RetentionPolicy.CLASS)
public @interface Utility {

}
