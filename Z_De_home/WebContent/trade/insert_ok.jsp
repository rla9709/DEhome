<%@page import="trade.TradeInsertDAO"%>
<%@page import="trade.TradeDTO"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<jsp:useBean id="trade" class="trade.TradeDTO"/>
<jsp:setProperty property="*" name="trade"/>
<%	//�ӽü�����

	trade.setTr_user_nick("������");
	trade.setTr_count(1);
	trade.setTr_complete(1);
	trade.setTr_evalue(5);
	trade.setTr_photo("�������");

%>
<%
	//tr_date ������ �� ���
	Timestamp currentTime = new Timestamp(System.currentTimeMillis());
	trade.setTr_date(currentTime);
%>


<%
	//insertBoard()�� ���
	TradeInsertDAO trDAO = TradeInsertDAO.getInstance(); 
	int re = trDAO.insertGoods(trade); // insertBoard�޼ҵ忡 useBean�� property������(BoardBean board)�� �־ ����
	if (re == 1) { // db�� insert ������ ���
		System.err.println(1);
	} else { // DB�� insert �����Ұ��
		System.err.println(2);
	}
%>

