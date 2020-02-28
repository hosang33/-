package kr.pren.util;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class NumberUtils {

	private NumberUtils() {}
	
	private static DecimalFormat  numberFormat = new DecimalFormat("#,###");
	
	/**
	 * 첫번쨰 숫자를 두번쨰 숫자로 나눈 값에 대한 ceil값을 반환한다
	 * @param num1 첫번쨰 숫자
	 * @param num2 두번쨰 숫자 (나누는 수)
	 * @return ceil 값
	 */
	public static int ceil(double num1, double num2) {
		return (int)Math.ceil(num1/num2);
	}
	
	/*
	 * 문자를 숫자로 변환한다
	 * @param str 숫자로 변환할 문자열
	 * @return 정수값이 반환된다 변환실패시 0이 반환된다*/
	
	public static int stringToNumber(String str) {
		return stringToNumber(str,0);
	}
	
	/*
	 * 문자를 숫자로 변환한다
	 * @param str 숫자로 변환할 문자열
	 * @param defaultNumber 변환실패시 사용될 기본값
	 * @return 정수값이 반환된다. 변환실패시 기본값으로 지정된 값이 반환된다.*/
	public static int stringToNumber(String str,int defaultNumber) {
		if (str == null) {
			return defaultNumber;
		}
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException e) {
			return defaultNumber;
		}
	}
	
	/*
	 * 숫자를,가 포함된 문자열로 반환된다
	 * 세자리마다 ,가 포함된 문자열을 반환한다. null이면 빈문자열 반환*/
	// 숫자를 ,가 포함된 문자열로 변환하는 메소드
	public static String numberWithComma(Integer number) {
		if(number == null) {
			return "0";
		}
		return numberFormat.format(number);
	}
	
}
