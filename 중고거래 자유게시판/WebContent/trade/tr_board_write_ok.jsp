<%@page import="java.sql.Timestamp"%>
<%@page import="trade.TradeBoardDAO"%>
<%@page import="trade.TradeBoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tr_user_nick="";
	if (request.getParameter("tr_user_nick") != null) {
		tr_user_nick = request.getParameter("tr_user_nick");
	}
	String pageNum = request.getParameter("pageNum");
	int tr_board_id = Integer.parseInt(request.getParameter("tr_board_id"));
	int tr_board_count = 0;
	String tr_board_title, tr_board_content, tr_board_pw;
	Timestamp tr_board_date;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	TradeBoardDAO dao = TradeBoardDAO.getInstance();
	TradeBoardDTO dto = new TradeBoardDTO();
	
	dto.setTr_board_id(tr_board_id);
	dto.setTr_user_nick(tr_user_nick);
	dto.setTr_board_title(request.getParameter("tr_b_title"));
	dto.setTr_board_content(request.getParameter("tr_b_content"));
	dto.setTr_board_date(new Timestamp(System.currentTimeMillis()));
	dto.setTr_board_count(tr_board_count);
	dto.setTr_board_pw(request.getParameter("tr_b_pw"));
	
	int re = dao.insertTradeBoard(dto);
	
	if(re == 1){

		response.sendRedirect("tr_board_list.jsp");
	}else{

		response.sendRedirect("tr_board_write.jsp");
	}
%>
</body>
</html>