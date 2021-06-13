package myUtil;

import java.net.URLEncoder;
/*
 * 8859_1(영문 인코딩)
 * euc-kr(한글 인코딩)
 * *.form 입력태그에서 한글처리
 * request.setCharacterEncoding(“euc-kr")
 * 
 * *.JSP 에서 한글처리
 * jsp 에서 
 * 한글을 넘길때는 
 * URLEncoder.encode(str, "euc-kr")
 * 한글을 받을때는
 * new String(str.getBytes("8859_1"),"euc-kr")
 * request.setCharacterEncoding(“euc-kr")

 */
public class HanConv {
	public static String toKor(String str) { //한글을 받을때
		if ((str == null) || (str.equals("null"))) {
			return str;
		}
		try {
			return new String(str.getBytes("8859_1"), "euc-kr");
		} catch (Exception e) {
			e.printStackTrace();
			return str;
		}
	}

	public static String toKorTwo(String str) { //한글을 넘길때
		if ((str == null) || (str.equals("null"))) {
			return str;
		}
		try {
			String result = null;
			result = URLEncoder.encode(str, "euc-kr");
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return str;
		}
	}

}
