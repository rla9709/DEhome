<%@page import="mypage.MypageDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%	
		request.setCharacterEncoding("UTF-8");
	
		String user_id = request.getParameter("user_id");
		String nick = (String)session.getAttribute("nick");
		MypageDAO dao = MypageDAO.getInstance();
		int re = dao.deleteAccount(nick);
		
		if(re == 1){
	%>
		<script language="JavaScript">
			alert("ȸ�� Ż��Ǿ����ϴ�");
		</script>
	<%
			response.sendRedirect("mypage.jsp");
		}else if(re == -1){
	%>
		<script language="JavaScript">
			alert("ȸ�� Ż�� �����Ͽ����ϴ�.");
			history.go(-1);
		</script>
	<%
			
		}
	%>
		
		


</body>
</html>