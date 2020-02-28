package kr.pren.util;

import java.util.Date;

public class ParameterUtils {
	private ParameterUtils() {}
	private static Date today = new Date();
	
	
	public static String isParameterNull (String parameter, String defaultData) {
		if (parameter==null) {
			return defaultData;
	}
		return parameter;
	}
	
	public static String isStartDateNull (String parameter, int day) {
		String result =   DateUtils.GetMinusDay(day);
		if (parameter==null) {
			return	result;
		}
		return parameter;
	}
	
	public static String isEndDateNull (String parameter) {
		String result =   DateUtils.dateToString(today);
		if (parameter==null) {
			return	result;
		}
		return parameter;
	}
	
	public static String isDisplayNumNull (String parameter, String num) {
		if (parameter==null) {
			return num;
		}
		return parameter;
	}
}
