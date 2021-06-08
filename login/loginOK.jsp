<%@page import="login.LoginDTO"%>
<%@page import="login.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	LoginDAO dao = LoginDAO.getInstance();
	
	int check = dao.userCheck(id, pw);
	LoginDTO dto = dao.getUser(id);
	
	if(dto == null) {
%>
		<script>
			alert("존재하지 않는 회원입니다.");
			history.go(-1);
		</script>		
<%
	} else {
		String nick = dto.getUser_nick();
		String name = dto.getUser_name();
		
		if(check == 1) {
			session.setAttribute("id", id);
			session.setAttribute("nick", nick);
			session.setAttribute("name", name);
			session.setAttribute("Member", "yes");
			session.setMaxInactiveInterval(60*60*24);
			response.sendRedirect("../main/mainpage.jsp");
		} else if(check == 0) {
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
		} else {
%>
		<script>
			alert("오류가 발생했습니다.");
			history.go(-1);
		</script>
<%	
		}
	}
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