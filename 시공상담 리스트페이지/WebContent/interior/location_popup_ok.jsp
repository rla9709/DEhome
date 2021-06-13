<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String select_addr1 = null;
	if (request.getParameter("popup_addr1") != null) {
		select_addr1 = request.getParameter("popup_addr1");
	}
	String select_addr2 = null;
	if (request.getParameter("popup_addr2") != null) {
		select_addr2 = request.getParameter("popup_addr2");
	}
	
	out.println("###@@@popup_addr1 " + HanConv.toKorTwo(select_addr1));
	out.println("###@@@popup_addr2 " + HanConv.toKorTwo(select_addr2));
	
	out.println("###@@@popup_addr1 " + select_addr1);
	
	response.sendRedirect("interiorList.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>