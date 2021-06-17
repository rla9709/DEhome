<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	/*--업체명 받기--*/
	String com_name = "업체명";
	if (request.getParameter("com_name") != null) {
		com_name = request.getParameter("com_name");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/interior_write.css" />
<script type="text/javascript" src="../js/review.js" charset="utf-8"></script>
</head>
<body>

	<jsp:include page="../headerfooter/header.jsp"/>

	<div id="write_title">
    <p>시공리뷰 작성</p>
    <p>해당 업체에 대한 솔직한 시공 리뷰를 남겨주세요</p>
  </div>
  <form action="review_write_ok.jsp?com_name=<%= HanConv.toKorTwo(com_name) %>" method="post" name="rw_form">
	  <div id="write_content">
	    <div class="write_select">
	      <P><%= com_name %></P>
	      <input type="text" name="re_title" placeholder="제목을 작성해주세요">
	    </div>
	    <div class="write_select2">
	    	<select name="com_rating">
                <option value="5">완전 만족해요</option>
                <option value="4">만족해요</option>
                <option value="3">보통이에요</option>
                <option value="2">불만족해요</option>
                <option value="1">최악이에요</option>
             </select>
        </div>
	    <div class="write_file">
	      <input multiple="multiple" type="file" name="re_file">
	    </div>
	    <textarea name="re_content" placeholder="해당 업체에 대한 솔직한 시공 리뷰를 남겨주세요"></textarea>
	  </div>
	  <div id="write_btn">
	    <input type="button" value="작성완료" onclick="reWrite_ok()">
	    <input type="reset" value="새로고침">
	  </div>
  </form>
  
  
  <jsp:include page="../headerfooter/footer.jsp"/>
  
</body>
</html>