package org.guess.test;

import org.guess.core.utils.FileUtils;
import org.junit.Test;

public class FileTest {

	@Test
	public void testAppend(){
		FileUtils.appendFile("D:/hello.txt", "追加的内容");
	}
}
