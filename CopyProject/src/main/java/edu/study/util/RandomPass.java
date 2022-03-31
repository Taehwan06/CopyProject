package edu.study.util;

import java.util.Random;

public class RandomPass {

	private static int size = 10;
	
	//이메일 난수 만드는 메서드
	public static String random() {
		Random ran = new Random();
		StringBuffer buf = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75)+48;
			if((num>=48 && num<=57) || (num>=97 && num<=122)) {
				buf.append((char)num);//숫자, 영문 소문자만
			}
			else {
				continue;
			}
		} while(buf.length() < size); //10글자
		
		return buf.toString();
	}
    
}
