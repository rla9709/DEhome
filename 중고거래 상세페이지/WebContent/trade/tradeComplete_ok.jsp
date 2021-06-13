<%@page import="myUtil.HanConv"%>
<%@page import="trade.TradeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	/*--글번호 받아오기--*/
	int tr_no = 0;
	if (request.getParameter("tr_no") != null) {
		tr_no = Integer.parseInt(request.getParameter("tr_no"));
	}
	
	
	/*--글작성자 받아오기--*/
	String tr_user_nick = "";
	if (request.getParameter("tr_user_nick") != null) {
		tr_user_nick = request.getParameter("tr_user_nick");
	}
	
	TradeDAO trade = TradeDAO.getInstance();
	
	/*--중고거래 판매완료 처리(trade_complete : 1)--*/
	int re = 0;
	re = trade.tradeComplete(tr_no);
	
	if (re == 1) {
%>
		<script type="text/javascript" charset="utf-8">
			alert("판매 완료 상품으로 전환하였습니다.");
			document.location.href = "used_trade.jsp?tr_user_nick=<%= HanConv.toKorTwo(tr_user_nick) %>"; 
			// 나중에 중고거래 리스트 페이지로 이동하게 설정하기(pageNum 받아서 가야한다)
			<%-- document.location.href = "중고거래 리스트 페이지.jsp?페이지넘버받기&tr_user_nick=<%= HanConv.toKorTwo(tr_user_nick) %>"; --%>
		</script>
<%
	} else if (re == -1) {
%>
		<script type="text/javascript" charset="utf-8">
			alert("판매 완료 전환에 실패하였습니다.");
			history.go(-1);
		</script>
<%	
	}
%>
	
%>
</body>
</html>