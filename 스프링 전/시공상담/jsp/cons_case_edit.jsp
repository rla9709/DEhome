<%@page import="interior.InteriorDTO"%>
<%@page import="interior.InteriorConsCaseDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//utf8 인코딩
	request.setCharacterEncoding("utf-8");
	int ex_no = Integer.parseInt(request.getParameter("ex_no"));
	
	InteriorConsCaseDAO dao = InteriorConsCaseDAO.getinstance();
	InteriorDTO dto = new InteriorDTO();
	
	dto = dao.consDetail(ex_no);
	String name = dto.getIn_com_name();
	String title = dto.getIn_ex_title();
	String content = dto.getIn_ex_content();
	String photo = dto.getIn_ex_file();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사례작성</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" type="../image⁄x-icon" href="images/x-icon.png" />
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/interior_write.css" />
    <script type="text/javascript" src="../js/interior.js" charset="utf-8"></script>
</head>
<body>
	    <div id="write_title">
	      <p>시공사례 수정</p>
	      <p>작성한 시공 사례를 수정해주세요</p>
	    </div>
		<form action="../interior/cons_case_edit_ok.jsp?" method="get" name="cons_case_edit_frm" enctype="multipart/form-data">
		    <input type="hidden" name="name" value="<%= name%>">
		    <input type="hidden" name="ex_no" value="<%= ex_no%>">
		    <div id="write_content">
		      <div class="write_select">
		        <p><%=name %></p>
		        <input type="text" name="in_ex_title" value="<%= title %>" />
		      </div>
		      <div class="write_file">
		        <input multiple="multiple" type="file" name="in_ex_file" />
		      </div>
		      <textarea name="in_ex_content" placeholder="해당 업체에 대한 솔직한 시공 리뷰를 남겨주세요"><%= content.replace("<br>", "\n") %></textarea>
		    </div>
		    <div id="write_btn">
		      <input type="button" value="작성완료" onclick="caseEdit_check()" />
		      <input type="reset" value="새로고침" />
		    </div>
    	</form>
</body>
</html>



