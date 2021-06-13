<%@page import="Register.RegisterDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="register" class="Register.RegisterDTO"></jsp:useBean>
<jsp:setProperty property="*" name="register"/>
<%
	/*--REG_DATE 설정--*/
	register.setReg_date(new Timestamp(System.currentTimeMillis()));

	/*--USER_PNUM 설정--*/
	int user_pnum = Integer.parseInt(request.getParameter("user_pnum"));
	register.setUser_pnum(user_pnum);

	/*--이메일 직접입력이 아닐때 user_email2 값 셋팅--*/
	if (request.getParameter("user_email2") == null) {
		register.setUser_email2(request.getParameter("email"));
	}

	RegisterDAO rdb = RegisterDAO.getinstance();
	
	
	/*--회원가입 성공유무--*/
	int rgResult = rdb.insertUser(register);
	
	if (rgResult == -1) {
%>
		<script>
			alert("회원가입에 실패하였습니다.");
			history.back();
		</script>		
<%
	} else {
%>
		<script>
			alert("회원가입을 축하드립니다.");
		</script>		
<%
		response.sendRedirect("../main.jsp"); // 메인페이지로 돌아가기
	}
%>
<html>
<head>
<body>

</body>
</html>