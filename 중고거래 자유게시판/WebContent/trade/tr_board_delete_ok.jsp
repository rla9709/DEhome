<%@page import="trade.TradeBoardDTO"%>
<%@page import="trade.TradeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="tr_board.js" charset="utf-8"></script>
</head>
<body>
	<%	
		request.setCharacterEncoding("UTF-8");
	
		int tr_b_id =Integer.parseInt(request.getParameter("tr_board_id"));
		String tr_b_pw = request.getParameter("tr_b_pw");
		TradeBoardDAO dao = TradeBoardDAO.getInstance();
		
		TradeBoardDTO board = dao.getTradeBoard(tr_b_id, false);
		int re = dao.deleteTradeBoard(tr_b_id, tr_b_pw);
		
		if(re == 1){
			response.sendRedirect("tr_board_list.jsp");
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