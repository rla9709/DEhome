<%@page import="mypage.MypageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="mypage.MypageDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	request.setCharacterEncoding("UTF-8");
	
	String real_pw = request.getParameter("real_pw");
	String pre_pw = request.getParameter("pre_pw");
	System.out.println("원래 비번 : "+real_pw);
	System.out.println("입력한 기존 비번 : "+ pre_pw);
	System.out.println("새 비번 : "+ dto.getUser_pw());
%>
<%
	
	if(pre_pw.equals(real_pw)== false){
		%>
		<script>
			alert("기존 비밀번호가 일치하지 않습니다.");
			response.sendRedirect("edit_account.jsp");
		</script>		
<%
	}else{
		MypageDAO dao = MypageDAO.getInstance();	
		int re = dao.editAccount(dto);
		if(re == 1){
	
			response.sendRedirect("mypage.jsp");
		}else{
	
			response.sendRedirect("edit_account.jsp");
		}
		
	}
%>


</body>
</html>