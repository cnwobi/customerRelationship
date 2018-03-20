package com.buck.springdemo.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
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
    //setup pointcut declaration

  @Pointcut("execution(* com.buck.springdemo.controller ..*.*(..))")
    private void forControllerPackage(){

    }
    @Pointcut("execution(* com.buck.springdemo.services ..*.*(..))")
    private void forServicesPackage(){

    }
    @Pointcut("execution(* com.buck.springdemo.dao ..*.*(..))")
    private void forDaoPackage(){

    }
   @Pointcut("forControllerPackage()|| forServicesPackage()||forDaoPackage()")
   private void forAppFlow(){

   }


    //add @Before advice
    @Before("forAppFlow()")
    public  void before(JoinPoint joinPoint){
        //display method being called
        String method=joinPoint.getSignature().toShortString();
        logger.info("======>> in @Before: calling method: " +method);
        // display arguments to the method
//get the arguments
        Object [] args =joinPoint.getArgs();
        // loop and display
        for(Object tempArg:args){
            logger.info("====>> argumet: " +tempArg);
        }
    }
    //add @after returning advice
@AfterReturning(pointcut = "forAppFlow()",returning = "result")
    public void afterReturning(JoinPoint joinPoint,Object result){
      //display method returning
    String method=joinPoint.getSignature().toShortString();
    logger.info("======>> in @AfterReturning: calling method: " + method);
    //display data returned
    logger.info("====>> result: " + result);

    }

}
