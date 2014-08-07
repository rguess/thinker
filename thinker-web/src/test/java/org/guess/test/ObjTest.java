package org.guess.test;

import java.io.IOException;

class Hello{
	
	public Hello() {
		System.out.println("cons");
	}
	
	public static void sayHello(){
		System.out.println("hello");
	}
}

public class ObjTest {
	public static void main(String[] args) throws IOException {
		Hello.sayHello();
		
		Hello hello = new Hello();
		System.out.println(hello.getClass().getClassLoader().getResources("/hello"));
	}
}
