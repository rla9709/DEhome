<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String input_id = null;
	input_id = request.getParameter("input_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DE:home 아이디 중복확인</title>
<link rel="stylesheet" href="../css/popup.css" />
<script type="text/javascript" src="../js/register.js" charset="utf-8"></script>
</head>
<body>
	<p>아이디 중복 검사</p>
    <form action="id_popup_ok.jsp" method="post" name="id_chk_form">
    	
    	<% if(input_id == null || input_id.isEmpty() || input_id.equals("null")) {
    	%>
    		<input type="text" name="user_id" id="user_id" class="id_input" />
    		<input type="button" onclick="id_ok()" value="중복확인">
    	<%
    	} else {
    	%>
    		<input type="text" name="user_id" id="user_id" class="id_input" value="<%= input_id %>" />
    		<input type="button" onclick="id_ok()" value="중복확인">	
    		<input type="button" onclick="id_use()" value="위의 아이디 사용하기">
    	<%
    	}
        %>
        
    </form>
</body>
</html>