package clases;

import java.lang.annotation.*;
@Inherited 
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Monitored {

}
