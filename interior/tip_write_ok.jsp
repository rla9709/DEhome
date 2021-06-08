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
	
	// 팁 작성후 어디로 보낼지 선택하기 위한 변수
	String cat = dto.getTip_cat();
	String nick = (String)session.getAttribute("nick");
	
	int re = manager.insertTip(dto, nick);
	if(re == 1) {
%>
	<script>
		alert("글을 등록 하셨습니다.");
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
		alert("글 등록에 실패했습니다.");
	</script>
<%
		response.sendRedirect("tip_write.jsp");		
	}
%>