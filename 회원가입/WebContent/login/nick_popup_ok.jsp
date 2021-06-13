<%@page import="myUtil.HanConv"%>
<%@page import="Register.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rs" class="Register.RegisterDTO"></jsp:useBean>
<jsp:setProperty property="user_nick" name="rs"/>
<%
	
	RegisterDAO rdb = RegisterDAO.getinstance();

	String input_nick = request.getParameter("user_nick");
	int nickResult = rdb.searchNick(input_nick);
	
	String dont_nick = null;
	
	if (nickResult == 1) {
		System.out.println("중복닉네임있음");
%>
		<script type="text/javascript" charset="UTF-8">
			alert("중복되는 닉네임이 존재합니다.");
			/* history.back(); */
			document.location.href = "nick_popup.jsp?input_nick=<%= dont_nick %>";
		</script>		
<%
	} else if (nickResult == -1) {
		System.out.println("-1값 : 중복닉네임 없음");
%>

		<script type="text/javascript" charset="UTF-8">
			alert("사용 가능한 닉네임입니다.");
			document.location.href = "nick_popup.jsp?input_nick=<%= HanConv.toKorTwo(input_nick) %>";
		</script>
<%
		
	} else {
		System.out.println(nickResult + "값 : 쿼리문 안돌아간다");
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>