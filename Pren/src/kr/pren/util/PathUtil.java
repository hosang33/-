package kr.pren.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.StringJoiner;

public class PathUtil {

	public static String encodeUrlPath(String path) throws UnsupportedEncodingException {
		String encodedUrlPath = "";
		if (path != null) {
			if (path.indexOf("?") != -1) {
				String uri = path.substring(0, path.indexOf("?"));
				String queryString = path.substring(path.indexOf('?') + 1);
				
				String[] items = queryString.split("&");
				StringJoiner joiner = new StringJoiner("&");
				for (String item : items) {
					String name = item.substring(0, item.indexOf("="));
					String value = item.substring(item.indexOf("=") + 1);
					
					String pair = name + "=" + URLEncoder.encode(value,  "utf-8");
					
					joiner.add(pair);
				}
				
				queryString = joiner.toString();
				
				encodedUrlPath = uri + "?" + queryString;
			} else {
				encodedUrlPath = path;
			}
		} 
		return encodedUrlPath;
	}
}
