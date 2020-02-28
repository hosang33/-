package kr.pren.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {
	private static SimpleDateFormat normalFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static Calendar cal = Calendar.getInstance();


	
	/**
	 * 날짜를 yyyy-MM-dd 패턴으로 형식화한 문자열을 반환한다.
	 * @param date 날짜
	 * @return 형식화된 문자(예/; 2018-10-14)
	 */
	public static String dateToString(Date date) {
		if (date==null) {
			return "";
		}
		return normalFormat.format(date);
	}
	
	public static String dateToStringPlusTime(Date date) {
		if (date==null) {
			return "";
		}
		SimpleDateFormat normalFormat = new SimpleDateFormat("yyyy-MM-dd / HH:mm");
		return normalFormat.format(date);
	}
	
	public static String GetMinusDay(int day) {
		cal.add(Calendar.DATE, -day);
		return normalFormat.format(cal.getTime());
	}
	
}
