<%@page import="interior.InteriorDAO"%>
<%@page import="interior.InteriorDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="interior.InteriorDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	request.setCharacterEncoding("UTF-8");
	dto.setTip_date(new Timestamp(System.currentTimeMillis()));
	InteriorDAO manager = InteriorDAO.getInstance();
	
	// 팁 작성후 어디로 보낼지 선택하기 위한 변수
	String cat = request.getParameter("tip_category");
	String nick = (String)session.getAttribute("nick");
	int re = manager.insertTip(dto, nick);
	
	if(re == 1) {
%>
	<script>
		alert("글을 등록 하셨습니다.");
		<%
			if(cat.equals("construct")) {
				response.sendRedirect("../interior/tip_list.jsp?category=construct");
			} else if(cat.equals("decorate")) {
				response.sendRedirect("../interior/tip_list.jsp?category=decorate");
			} else if(cat.equals("diy")) {
				response.sendRedirect("../interior/tip_list.jsp?category=diy");
			} else if(cat.equals("kitchen")) {
				response.sendRedirect("../interior/tip_list.jsp?category=kitchen");
			} else if(cat.equals("storage")) {
				response.sendRedirect("../interior/tip_list.jsp?category=storage");
			} else if(cat.equals("cleaning")) {
				response.sendRedirect("../interior/tip_list.jsp?category=cleaning");
			} else if(cat.equals("reform")) {
				response.sendRedirect("../interior/tip_list.jsp?category=reform");
			} else if(cat.equals("lighting")) {
				response.sendRedirect("../interior/tip_list.jsp?category=lighting");
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