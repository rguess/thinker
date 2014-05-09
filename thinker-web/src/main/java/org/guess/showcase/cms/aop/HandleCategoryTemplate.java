package org.guess.showcase.cms.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * aop方式静态化cms模块
 * @author rguess
 *
 */
@Aspect
@Component
public class HandleCategoryTemplate {
	@Pointcut("execution(* org.guess.sys..*(..))")
    private void anyMethod(){}//定义一个切入点  
    
    @AfterReturning("anyMethod()")
    public void doAfter(){
        System.out.println("后置通知");  
    }  
      
    @After("anyMethod()")
    public void after(){  
        System.out.println("最终通知");  
    }  
      
    @AfterThrowing("anyMethod()")  
    public void doAfterThrow(){  
        System.out.println("例外通知");  
    }  
      
    @Around("anyMethod()")  
    public Object doBasicProfiling(ProceedingJoinPoint pjp) throws Throwable{  
        System.out.println("进入环绕通知");
        System.out.println(pjp.getTarget().getClass().getName());
        Object object = pjp.proceed();//执行该方法  
        System.out.println("退出方法");  
        return object;  
    }
}
