package org.guess.test;

import org.junit.Test;
import org.springframework.core.SpringVersion;

public class SpirngTest {

	@Test
	public void test01(){
		System.out.println(SpringVersion.getVersion());

        int a = 1;
        changeA(a);
        System.out.println(a);
	}

   public static void changeA(int a){
       a = 2;
       System.out.println(a);
   }
	
	
}
