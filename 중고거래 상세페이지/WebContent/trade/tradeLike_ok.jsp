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
	
	/*--세션아이디 받아오기--*/
	String session_nick = "";
	if (request.getParameter("session_nick") != null) {
		session_nick = request.getParameter("session_nick");
	}
	
	TradeDAO trade = TradeDAO.getInstance();
	
	/*--중고거래 거래글 좋아요 누르기(중고거래 좋아요 테이블_관심도 : 1)--*/
	int re = 0;
	re = trade.interestOn(tr_no, session_nick);
	
	if (re == 1) {
%>
		<script type="text/javascript" charset="utf-8">
			alert("관심 등록을 완료하였습니다.");
			document.location.href = "tradeShow.jsp?tr_no=<%= tr_no %>&tr_user_nick=<%= HanConv.toKorTwo(tr_user_nick) %>";
		</script>
<%
	} else if (re == -1) {
%>
		<script type="text/javascript" charset="utf-8">
			alert("관심 등록에 실패하였습니다.");
			history.go(-1);
		</script>
<%	
	}
%>
</body>
</html>