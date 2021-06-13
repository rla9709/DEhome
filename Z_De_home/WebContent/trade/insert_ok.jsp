<%@page import="trade.TradeInsertDAO"%>
<%@page import="trade.TradeDTO"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<jsp:useBean id="trade" class="trade.TradeDTO"/>
<jsp:setProperty property="*" name="trade"/>
<%	//임시설저용

	trade.setTr_user_nick("이유나");
	trade.setTr_count(1);
	trade.setTr_complete(1);
	trade.setTr_evalue(5);
	trade.setTr_photo("사진경로");

%>
<%
	//tr_date 설정할 때 사용
	Timestamp currentTime = new Timestamp(System.currentTimeMillis());
	trade.setTr_date(currentTime);
%>


<%
	//insertBoard()를 사용
	TradeInsertDAO trDAO = TradeInsertDAO.getInstance(); 
	int re = trDAO.insertGoods(trade); // insertBoard메소드에 useBean의 property데이터(BoardBean board)를 넣어서 실행
	if (re == 1) { // db에 insert 성공한 경우
		System.err.println(1);
	} else { // DB에 insert 실패할경우
		System.err.println(2);
	}
%>

