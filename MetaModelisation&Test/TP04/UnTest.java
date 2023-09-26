import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface UnTest {

    static class None extends Throwable {
        private None() {}
    }

    public boolean enable() default true;
    
    public Class<? extends Throwable> expected() default None.class;
    
}
