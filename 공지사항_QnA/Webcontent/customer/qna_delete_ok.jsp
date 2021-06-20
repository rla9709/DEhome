<%@page import="customer.QnaBoardDTO"%>
<%@page import="customer.QnaBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="board.js" charset="utf-8"></script>
</head>
<body>
	<%	
		int qna_id =Integer.parseInt(request.getParameter("qna_id"));
		String qna_pw = request.getParameter("qna_pw");
		QnaBoardDAO dao = QnaBoardDAO.getInstance();
		
		QnaBoardDTO dto = dao.getQnaBoard(qna_id, false);
		int re = dao.deleteQnaBoard(qna_id, qna_pw);
		
		if(re == 1){
			response.sendRedirect("qna_list.jsp");
		}else if (re == 0){
	%>
		<script language="JavaScript">
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
	<%
		}else if(re == -1){
	%>
		<script language="JavaScript">
			alert("삭제에 실패하였습니다.");
			history.go(-1);
		</script>
	<%
			
		}
	%>
</body>
</html>