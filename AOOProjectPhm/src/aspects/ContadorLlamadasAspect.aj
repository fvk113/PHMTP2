package aspects;

import annotations.Monitored;

public aspect ContadorLlamadasAspect {
	public int counter = 0;


	pointcut fieldRead(Object target, Object newValue) : 
		set(* @Monitored AOOProjectPhm.clases..*) && args(newValue) && target(target);
	
	pointcut fieldWrite(Object target, Object newValue) : 
		set(* AOOProjectPhm.clases..*) && args(newValue) && target(target);

	pointcut monitored(Object target, Object newValue) : set(* *..*) && args(newValue) && target(@Monitored target);
	
	void around(Object target, Object newValue) : monitored(target, newValue){
		proceed(target,newValue);
		this.counter += 1;
	}
}
