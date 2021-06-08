<%@page import="interior.InteriorDAO"%>
<%@page import="interior.InteriorDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dto" class="interior.InteriorDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	dto.setTip_date(new Timestamp(System.currentTimeMillis()));
	InteriorDAO manager = InteriorDAO.getInstance();
	
	// �� �ۼ��� ���� ������ �����ϱ� ���� ����
	String cat = dto.getTip_cat();
	String nick = (String)session.getAttribute("nick");
	
	int re = manager.insertTip(dto, nick);
	if(re == 1) {
%>
	<script>
		alert("���� ��� �ϼ̽��ϴ�.");
		<%
			if(cat.equals("construct")) {
				response.sendRedirect("tip_construct.jsp");
			} else if(cat.equals("decorate")) {
				response.sendRedirect("tip_decorate.jsp");
			} else if(cat.equals("DIY")) {
				response.sendRedirect("tip_diy.jsp");
			} else if(cat.equals("kitchen")) {
				response.sendRedirect("tip_kitchen.jsp");
			} else if(cat.equals("storage")) {
				response.sendRedirect("tip_storage.jsp");
			} else if(cat.equals("cleaning")) {
				response.sendRedirect("tip_cleaning.jsp");
			} else if(cat.equals("reform")) {
				response.sendRedirect("tip_reform.jsp");
			} else if(cat.equals("lighting")) {
				response.sendRedirect("tip_lighting.jsp");
			} 
		%>
	</script>
<%
	}else {
%>
	<script>
		alert("�� ��Ͽ� �����߽��ϴ�.");
	</script>
<%
		response.sendRedirect("tip_write.jsp");		
	}
%>