<%@page import="myUtil.HanConv"%>
<%@page import="interior.InteriorConsCaseDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//utf8 인코딩
	request.setCharacterEncoding("utf-8");
	int ex_no = Integer.parseInt(request.getParameter("ex_no"));
	String com_name =request.getParameter("name");
	
	//제목,내용,파일 들고오기
	String title = request.getParameter("in_ex_title");
	String content = request.getParameter("in_ex_content");
	String file = "";
		if(request.getParameter("file") != null) {
			file = request.getParameter("file");
		}

	InteriorConsCaseDAO dao = InteriorConsCaseDAO.getinstance();
	int re = dao.updateCase(title, content, file, ex_no);
	
	if(re == 1) {
%>
		<script type="text/javascript">
			alert("작성글이 수정되었습니다.");	
			location.href= "../interior/company_page.jsp?name=<%= HanConv.toKorTwo(com_name)%>";
		</script>
<%
	} else {
%>
		<script type="text/javascript">
			alert("수정에 실패했습니다.");
			history.go(-1);
		</script>
<%
		
	}
%>