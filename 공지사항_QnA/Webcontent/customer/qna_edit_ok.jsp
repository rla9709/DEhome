<%@page import="customer.QnaBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="customer.QnaBoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%	
	QnaBoardDAO dao = QnaBoardDAO.getInstance();
	dto.setQna_id(Integer.parseInt(request.getParameter("qna_id")));
	dto.setQna_pw(request.getParameter("qna_pw"));
	dto.setQna_title(request.getParameter("qna_title"));
	dto.setQna_content(request.getParameter("qna_content"));
	int re = dao.editQnaBoard(dto);
	
	if(re == 1){
		response.sendRedirect("qna_list.jsp");
	}else if(re == 0){
%>
	<script language="JavaScript">
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
<%
	}else if(re == -1){
%>
	<script language="JavaScript">
		alert("수정에 실패하였습니다.");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>