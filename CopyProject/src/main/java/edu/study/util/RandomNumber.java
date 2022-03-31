package edu.study.util;

import java.util.Random;

public class RandomNumber {

	private static int size = 6;
	
	//이메일 난수 만드는 메서드
	public static String random() {
		Random ran = new Random();
		StringBuffer buf = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75)+48;
			if((num>=48 && num<=57)) {
				buf.append((char)num);//숫자만
			}
			else {
				continue;
			}
		} while(buf.length() < size); //6글자
		
		return buf.toString();
	}
    
}
