package com.xpediant;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;



@Aspect
@Component
public class ControllerLoggingAspect {
	
	Logger log = Logger.getLogger(this.getClass());
  
	
	@After("execution(* com.xpediant.UserController.*(..))")
    public void log(JoinPoint point) {
		BasicConfigurator.configure();
        log.info(point.getSignature().getName() + " called...");
    }

}
