<%@page import="myUtil.HanConv"%>
<%@page import="interior.InteriorConsCaseDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String com_name =request.getParameter("name");

%>
<jsp:useBean id="dto" class="interior.InteriorDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	dto.setIn_reg_date(new Timestamp(System.currentTimeMillis()));
	dto.setIn_com_name(com_name);
	InteriorConsCaseDAO dao = InteriorConsCaseDAO.getinstance();
	int re = dao.insertCase(dto);
	
	if(re == 1) {
%>
		<script type="text/javascript">
			alert("시공 사례 작성글이 등록되었습니다.");	
			location.href= "../interior/company_page.jsp?name=<%= HanConv.toKorTwo(com_name)%>";
		</script>
<%
	} else {
%>
		<script type="text/javascript">
			alert("등록에 실패했습니다.");
			history.go(-1);
		</script>
<%
		
	}
%>