<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<% response.setContentType("text/html"); %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="com_name" value="${param.com_name }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DE:home</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="${path}/resources/css/reset.css" />
    <link rel="stylesheet" href="${path}/resources/css/interior_write.css" />
    
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>	
<script type="text/javascript" src="${path }/resources/js/review.js" charset="utf-8"></script>
</head>
<body>
	<%@include file ="../headerfooter/header.jsp" %>
	<div id="write_title">
	    <p>시공리뷰 작성</p>
	    <p>해당 업체에 대한 솔직한 시공 리뷰를 남겨주세요</p>
	</div>
	<form action="review_write?com_name=${com_name }" method="post" name="rw_form" enctype="multipart/form-data">
	<div id="write_content">
	  <div class="write_select">
	    <P>${com_name }</P>
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
	    <input type="file" id="ex_file" name="file"
			onchange="javascript:document.getElementById('fileName').value = this.value.split('\\')[this.value.split('\\').length-1]" accept="image/*" />
		<!--  <input type="text" id="fileName" readonly name="in_com_file" /> -->
	  </div>
	  <textarea name="re_content" placeholder="해당 업체에 대한 솔직한 시공 리뷰를 남겨주세요"></textarea>
	</div>
	<div id="write_btn">
	  <input type="button" value="작성완료" onclick="reWrite_ok()">
	   <input type="reset" value="새로고침">
	 </div>
	</form>
  
    <%@include file ="../headerfooter/footer.jsp" %>
    
</body>
</html>