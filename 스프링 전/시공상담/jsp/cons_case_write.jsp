<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String com_name = request.getParameter("com_name");
	System.out.println(com_name);
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
	      <p>시공사례 작성</p>
	      <p>업체의 다양한 시공 사례를 남겨주세요</p>
	    </div>
		<form action="../interior/cons_case_write_ok.jsp" method="get" name="cons_case_write_frm" enctype="multipart/form-data">
		    <input type="hidden" name="name" value="<%= com_name%>">
		    <div id="write_content">
		      <div class="write_select">
		        <p><%=com_name %></p>
		        <input type="text" name="in_ex_title" placeholder="제목을 작성해주세요" />
		      </div>
		      <div class="write_file">
		        <input multiple="multiple" type="file" name="in_ex_file" />
		      </div>
		      <textarea name="in_ex_content" placeholder="해당 업체에 대한 솔직한 시공 리뷰를 남겨주세요"></textarea>
		    </div>
		    <div id="write_btn">
		      <input type="button" value="작성완료" onclick="caseWrite_check()" />
		      <input type="reset" value="새로고침" />
		    </div>
    	</form>
</body>
</html>



