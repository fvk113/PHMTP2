package clases;

import static org.junit.Assert.*;

import org.junit.*;

import aspects.ContadorLlamadasAspect;


public class TestEjercicio1 {	
    
    	Persona p1;
    	Persona p2;
    	
		@Before
		public void init(){
			p1 = new Persona();
		    p2 = new Persona();
		}
	
	    @Test
	    public void sampleTest () {

			p1.getNombre();
	        p1.setNombre(" Nico ");
	        p1.setNombre(" Carlos ");
	        p1.setNombre(" Carlos ");
	        int llamadas_p1_setNombre =
	            ContadorLlamadasAspect.aspectOf().CantidaLLamados(p1, "set");
//	        int llamadas_p1_setNombre =
//	            ContadorLlamadasAspect.aspectOf().CantidaLLamados(p1, "setNombre");
//	        int llamadas_p2_setNombre =
//	            ContadorLlamadasAspect.aspectOf().CantidaLLamados(p2, "setNombre");
	        assertEquals(llamadas_p1_setNombre, 3) ;
//	        assertEquals(llamadas_p1_setNombre , 2) ;
//	        assertEquals(llamadas_p2_setNombre , 0) ;
	    }
	
}
