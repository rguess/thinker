package org.guess.test;

import org.guess.core.utils.DateUtil;
import org.junit.Test;
import org.springframework.core.SpringVersion;

import java.util.Date;

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

    @Test
   public void test02(){
        System.out.println(DateUtil.getYesterday(new Date()));
        System.out.println(DateUtil.getNowStr());
   }
	
	
}
