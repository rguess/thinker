package org.guess.test;

import org.guess.core.utils.security.Coder;
import org.junit.Test;

public class FileTest {

	@Test
	public void testAppend(){
//		FileUtils.appendFile("D:/hello.txt", "追加的内容");
		
		System.out.println(Coder.encryptMD5("502876941@qq.com"));
	}
	
	
}
