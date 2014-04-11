package aspects;
 
import java.util.HashMap;
import clases.*;

public aspect ContadorLlamadasAspect {
	public HashMap<Object, Integer> contadorPersonasSet = new HashMap<Object, Integer>();
	public HashMap<Object, Integer> contadorPersonasGet = new HashMap<Object, Integer>();
	public HashMap<String, HashMap<Object, Integer>> contadores = 
	new HashMap<String, HashMap<Object, Integer>>(){  
		private static final long serialVersionUID = 1L;

		{  put("get",contadorPersonasGet);  
	       put("set",contadorPersonasSet);  
	     }  
	     };  
	pointcut monitoredSet(Object target, Object newValue) : set(* Persona..*) && args(newValue) && target(target) && @withincode(Monitored);
	   

	pointcut monitoredCall(Object target, Object newValue) : 
		call(* clases..getNombre()) && args(newValue) && target(target);

	void around(Object target, Object newValue) : monitoredSet(target, newValue){
		proceed(target,newValue);
		if(contadorPersonasSet.get(target)!=null){
			contadorPersonasSet.put(target,contadorPersonasSet.get(target)+1);
		}
		else{
			contadorPersonasSet.put(target,1);
		}
		}
	
	
	void around(Object target, Object newValue) : monitoredCall(target, newValue){
		proceed(target,newValue);
		if(contadorPersonasGet.get(target)!=null){
			contadorPersonasGet.put(target,contadorPersonasGet.get(target)+1);
		}
		else{
			contadorPersonasGet.put(target,1);
		}	}
	
	public int CantidaLLamados(Object target, String string){
		return contadores.get(string).get(target);
	}
}
