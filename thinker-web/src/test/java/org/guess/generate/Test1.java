package org.guess.generate;

import org.guess.core.utils.FileUtils;

public class Test1 {

	public static void main(String[] args) {
		FileUtils.zipFiles("D:/temp", "*", "D:/template.zip");
	}
}
