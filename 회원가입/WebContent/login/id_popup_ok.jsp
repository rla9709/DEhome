<%@page import="myUtil.HanConv"%>
<%@page import="Register.RegisterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="rs" class="Register.RegisterDTO"></jsp:useBean>
<jsp:setProperty property="user_id" name="rs"/>
<%
	
	RegisterDAO rdb = RegisterDAO.getinstance();

	String input_id = request.getParameter("user_id");
	int idResult = rdb.searchId(input_id);
	
	String dont_id = null;
	
	if (idResult == 1) {
		System.out.println("중복아이디있음");
%>
		<script type="text/javascript">
			alert("중복되는 아이디가 존재합니다.");
			/* history.back(); */
			document.location.href = "id_popup.jsp?input_id=<%= dont_id %>";
		</script>		
<%
	} else if (idResult == -1) {
		System.out.println("-1값 : 중복아이디 없음");
%>

		<script type="text/javascript">
			alert("사용 가능한 아이디입니다.");
			document.location.href = "id_popup.jsp?input_id=<%= HanConv.toKorTwo(input_id) %>";
		</script>
<%
		
	} else {
		System.out.println(idResult + "값 : 쿼리문 안돌아간다");
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