<%@page import="interior.InteriorReviewDTO"%>
<%@page import="interior.InteriorReviewDAO"%>
<%@page import="myUtil.HanConv"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	/*--글 번호 받기--*/
	int re_no = 0;
	if (request.getParameter("re_no") != null) {
		re_no = Integer.parseInt(request.getParameter("re_no"));
	}
	
	/*--리뷰내용 받아오기--*/
	InteriorReviewDAO dao = InteriorReviewDAO.getinstance();
	InteriorReviewDTO board = dao.reviewShow(re_no);
	
	String com_name = board.getCom_name();
	
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
    <p>시공리뷰 수정</p>
    <p>작성한 시공 리뷰를 수정해주세요</p>
  </div>
  <form action="review_edit_ok.jsp?re_no=<%= re_no %>&com_name=<%= HanConv.toKorTwo(com_name) %>" method="post" name="re_form">
	  <div id="write_content">
	    <div class="write_select">
	      <P><%= com_name %></P>
	      <input type="text" name="re_title" placeholder="제목을 작성해주세요" value="<%= board.getRe_title() %>">
	    </div>
	    <div class="write_select2">
	    	<select name="com_rating">
                <option value="0" style="color: white">평점은 변경할 수 없습니다</option>
             </select>
        </div>
	    <div class="write_file">
	      <input multiple="multiple" type="file" name="re_file">
	    </div>
	    <textarea name="re_content" placeholder="해당 업체에 대한 솔직한 시공 리뷰를 남겨주세요"><%= board.getRe_content().replace("<br>", "\n") %></textarea>
	  </div>
	  <div id="write_btn">
	    <input type="button" value="수정완료" onclick="reEdit_ok()">
	    <input type="reset" value="새로고침">
	  </div>
  </form>
  
  
  <jsp:include page="../headerfooter/footer.jsp"/>
  
</body>
</html>