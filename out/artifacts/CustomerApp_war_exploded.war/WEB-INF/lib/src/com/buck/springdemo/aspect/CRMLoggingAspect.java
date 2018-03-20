/*package com.buck.springdemo.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.logging.Logger;

@Aspect
@Component
public class CRMLoggingAspect {
    //setup logger
    private Logger logger= Logger.getLogger(getClass().getName());
    //setup pointcut declaratiom
    @Pointcut("execution(* com.buck.springdemo.controller .* .*(..))")
    private void forControllerPackage(){

    }
    @Pointcut("execution(* com.buck.springdemo.services. * .*(..))")
    private void forServicesPackage(){

    }
    @Pointcut("execution(* com.buck.springdemo.dao. * .*(..))")
    private void forDAOPackage(){

    }

    @Pointcut("forControllerPackage()|| forDAOPackage()|| forServicesPackage()")
    private void forAppFlow(){

    }
    //add @Before advice
    @Before("forAppFlow()")
    public  void before(JoinPoint joinPoint){
        //display method being called
        String method=joinPoint.getSignature().toShortString();
        logger.info("======>> in @Before: calling method: " +method);
        // display arguments to the method

    }
    //add @AfterReturning advice
}*/
