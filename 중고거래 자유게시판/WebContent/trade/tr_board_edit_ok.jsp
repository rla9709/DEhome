<%@page import="trade.TradeBoardDTO"%>
<%@page import="trade.TradeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="trade.TradeBoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<%
request.setCharacterEncoding("UTF-8");

	TradeBoardDAO dao = TradeBoardDAO.getInstance();
	dto.setTr_board_id(Integer.parseInt(request.getParameter("tr_board_id")));
	dto.setTr_board_pw(request.getParameter("tr_b_pw"));
	dto.setTr_board_title(request.getParameter("tr_b_title"));
	dto.setTr_board_content(request.getParameter("tr_b_content"));
	int re = dao.editTradeBoard(dto);
	
	if(re == 1){
		response.sendRedirect("tr_board_list.jsp");
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