<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String input_nick = null;
	input_nick = request.getParameter("input_nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DE:home 닉네임 중복확인</title>
<link rel="stylesheet" href="../css/popup.css" />
<script type="text/javascript" src="../js/register.js" charset="utf-8"></script>
</head>
<body>
	<p>닉네임 중복 검사</p>
    <form action="nick_popup_ok.jsp" method="post" name="nick_chk_form">
    	
    	<% if(input_nick == null || input_nick.isEmpty() || input_nick.equals("null")) {
    	%>
    		<input type="text" name="user_nick" id="user_nick" class="nick_input" />
    		<input type="button" onclick="nick_ok()" value="중복확인">
    	<%
    	} else {
    	%>
    		<input type="text" name="user_nick" id="user_nick" class="nick_input" value="<%= input_nick %>" />
    		<input type="button" onclick="nick_ok()" value="중복확인">	
    		<input type="button" onclick="nick_use()" value="위의 닉네임 사용하기">
    	<%
    	}
        %>
        
    </form>
</body>
</html>