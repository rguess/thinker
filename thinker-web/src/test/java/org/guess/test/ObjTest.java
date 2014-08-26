package org.guess.test;

import java.io.IOException;

import org.guess.sys.model.User;
import org.junit.Test;

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
	
	@Test
	public void test01(){
		User user1 = new User();
		User user2 = user1;
		user1.setName("sss");
		System.out.println(user1 == user2);
		System.out.println(user2.getName());
	}
}
