package org.guess.test;

import org.junit.Test;

public class ArrayTest {

	int[] a = { 1, 2, 3, 4, 5, 6, 9 };
	int[] b = { 3, 3, 3, 4, 5, 6, 9 };
	int n = 0;
	int m = 0;
	
	@Test
	public void test4(){
		String str1="abc";
		String str2="abc";
		System.out.println(str1==str2);//false
		str1="bcd";
		System.out.println(str1+","+str2);//bcd,abc
		System.out.println(str1==str2);//false
	}
	
	public void test3(){
		int[] x = {1,2,3,1,4,5,6,1};
		int[] y = new int[x.length];
 		int temp;
		for (int i = 0; i < x.length; i++) {
			
		}
	}

	@Test
	public void test() {
		for (int i = 0; i < a.length; i++) {
			for (int j = 0; j < b.length; j++) {
				nextEq(i, j);
			}
		}
		System.out.println(m);
	}

	@Test
	public void test02() {
		int n = 40;
		for (int i = 0; i < n; i--) {
			System.out.print("*");
		}
	}

	private void nextEq(int ai, int bi) {
		if ((ai < a.length || bi < b.length) && a[ai] == b[bi]) {
			n++;
			nextEq(ai + 1, bi + 1);
		} else {
			if (n > m) {
				m = n;
			}
			n = 0;
		}
	}

	@Test
	public void test1() {
		for (int i = 0; i < a.length; i++) {
			for (int j = 0; j < b.length; j++) {
				for (int x = 0;; x++) {
					if ((x + i < a.length || x + j < b.length)
							&& a[x + i] == b[x + j]) {
						n++;
					} else {
						if (n > m) {
							m = n;
						}
						n = 0;
						break;
					}
				}
			}
		}
		System.out.println(m);
	}
}
