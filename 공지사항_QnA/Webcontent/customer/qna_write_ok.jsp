<%@page import="customer.QnaBoardDTO"%>
<%@page import="customer.QnaBoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="trade.TradeBoardDAO"%>
<%@page import="trade.TradeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	String qna_user_nick="";
// 	if (request.getParameter("qna_user_nick") != null) {
// 		qna_user_nick = request.getParameter("qna_user_nick");
// 	}
	String pageNum = request.getParameter("pageNum");
	int qna_id = Integer.parseInt(request.getParameter("qna_id"));
	int qna_count = 0;
	String qna_title, qna_content, qna_pw;
	Timestamp qna_date;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	QnaBoardDAO dao = QnaBoardDAO.getInstance();
	String qna_user_nick = dao.getUsernick();
	QnaBoardDTO dto = new QnaBoardDTO();
	
	dto.setQna_id(qna_id);
	dto.setQna_user_nick(qna_user_nick);
	dto.setQna_title(request.getParameter("qna_title"));
	dto.setQna_content(request.getParameter("qna_content"));
	dto.setQna_date(new Timestamp(System.currentTimeMillis()));
	dto.setQna_count(qna_count);
	dto.setQna_type(request.getParameter("qna_type"));
	dto.setQna_pw(request.getParameter("qna_pw"));
	dto.setQna_process(request.getParameter("qna_process"));
	
// 	System.out.println(request.getParameter("qna_process"));
// 	System.out.println(request.getParameter("qna_type"));
	
	int re = dao.insertQnaBoard(dto);
	
	if(re == 1){

		response.sendRedirect("qna_list.jsp");
	}else{

		response.sendRedirect("qna_write.jsp");
	}
%>
</body>
</html>