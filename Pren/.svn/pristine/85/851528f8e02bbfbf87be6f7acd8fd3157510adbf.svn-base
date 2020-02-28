package kr.pren.util;

import java.util.StringJoiner;

public class StringUtils {
	
	public static boolean isExistInArray(String[] arr, String text) {
		if (arr == null) {
			return false;
		}
		
		for (String item : arr) {
			if (item.equals(text)) {
				return true;
			}
		}
		return false;		
	}

	public static String arrayToStringWithDelim(String[] arr, String delim) {
		if (arr == null) {
			return "";
		}
		
		StringJoiner joiner = new StringJoiner(delim);
		for (String item : arr) {
			joiner.add(item);
		}
		return joiner.toString();
	}
}
