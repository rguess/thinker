package org.guess.test;

import org.guess.core.utils.security.Coder;
import org.junit.Test;

public class FileTest {

	@Test
	public void testAppend(){
//		FileUtils.appendFile("D:/hello.txt", "追加的内容");
		
		System.out.println(Coder.encryptMD5("502876941@qq.com"));
	}
	
	/*@Test
	public void testJacob(){
		MsWordUtils word = new MsWordUtils();
		try {
			 //是否显示打开word  
			word.openWord(false);  
			//打开模版文件  
			word.openDocument("E:\\tmp\\xxx.docx");
			//替换书签内容  
			word.replace("${a}", "123452222");
//			word.replaceBookMark("${a}", "12345");
			//保存到path  
			word.saveFileAs("E:\\tmp\\t1.docx");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			word.closeDocument();  
		    word.closeWord();
		}
	}
	*/
	
}
