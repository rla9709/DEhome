<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="interior.InteriorDTO"%>
<%@page import="interior.InteriorConsCaseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//utf8 인코딩
	request.setCharacterEncoding("utf-8");
	int ex_no = Integer.parseInt(request.getParameter("ex_no"));
	
	/*--날짜 셋팅--*/
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	
	
	InteriorConsCaseDAO dao = InteriorConsCaseDAO.getinstance();
	InteriorDTO dto = new InteriorDTO();
	
	dto = dao.consDetail(ex_no);
	String name = dto.getIn_com_name();
	String title = dto.getIn_ex_title();
	String content = dto.getIn_ex_content();
	String photo = dto.getIn_ex_file();
	Timestamp reg_date = dto.getIn_reg_date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시공 사례</title>
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" type="../image⁄x-icon" href="images/x-icon.png" />
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/interior.css" />
</head>
<body>
	<%@include file="../headerfooter/header.jsp"%>
	<div id="case_page">
		<div class="case_title">
			<p><%=sdf.format(reg_date) %></p>
			<p>시공사례</p>
	<%
		if(user_com_name != null && user_com_name.equals(name)) { // 해당 업체가 로그인 했을 시
	%>
			<p><input type="button" value="사례 수정하기" onclick="location.href='cons_case_edit.jsp?ex_no=<%= ex_no %>'" class="editBtn"></p>
	<%
		} else {
	%>
			<p><%=name %></p>
	<%
		}
	%>
			<p><%=title %></p>
		</div>
		<div class="case_content">
			<p><%=content %></p>
			<div class="case_img">
				<img src="<%=photo %>" />
			</div>
		</div>
		<div id="list_btn">
			<input type="button" value="목록으로 돌아가기"
				onclick="history.go(-1)" />
		</div>
	</div>
	<%@include file="../headerfooter/footer.jsp"%>
</body>
</html>