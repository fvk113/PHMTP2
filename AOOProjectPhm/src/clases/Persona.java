package clases;


public class Persona {
	 	private String nombre ;
	    
	    @Monitored
	    public String getNombre() {
	        return this.nombre ;
	    }

	    @Monitored
	    public void setNombre(String nombre) {
	        this.nombre = nombre;
	    }
}
