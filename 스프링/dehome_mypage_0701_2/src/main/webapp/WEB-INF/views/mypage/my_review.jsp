<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 작성한 글 - 시공리뷰</title>
<%@include file="../headerfooter/header.jsp" %>
<script type="text/javascript" src="${path }/resources/js/mypage.js" charset="utf-8"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
  	<link rel="stylesheet" href="${path }/resources/css/header_footer.css" />
    <link rel="stylesheet" href="${path }/resources/css/my_page.css" />
    <link rel="stylesheet" href="${path }/resources/css/login.css" />

</head>
<body>
<%--
request.setCharacterEncoding("UTF-8");

	String tr_user_nick = "";
	if (request.getParameter("tr_user_nick") != null) {
		tr_user_nick = request.getParameter("tr_user_nick");
	}
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum= "1";
	}
	
	MyInteriorReviewDAO dao = MyInteriorReviewDAO.getinstance();
	ArrayList<InteriorReviewDTO> myReviewList = dao.myReview(nick);
	
	int re_no,com_rating = 0;
	String com_name=null,  re_title=null, re_content=null;
	
	
	
--%>
 <div class="contents_mypage">
        <a href="mypage.html"></a><h2 class="page_title">MY PAGE</h2></a>
        <div class="mypage_header_box">
          <p class="my_page_label">${nickname }님 안녕하세요</p>
        </div>
       
          <div class="mypage_sidebar_box">
            <ul class="mypage_ul1">
              <li class="mypage_side_label">회원정보</li>
              <li class="mypage_side_list" ><a href="edit_account">개인정보 수정</a></li>
              <li class="mypage_side_list"><a href="delete_account">회원탈퇴</a></li>
              <li class="mypage_side_list"><a href="account_system_link">간편로그인 연동</a></li>
            </ul>
            <ul class="mypage_ul2">
              <li class="mypage_side_label">활동 및 문의</li>
              <li class="mypage_side_list"><a href="my_trade_list">나의 거래 ></a></li>
              <li class="mypage_side_list_1" style="color: #1B7850"><a href="my_trade_board">내가 작성한 글 ></a>
              	<ul class="mypage_side_list_2">
              		<li><a href="my_trade_board">자유게시판</a></li>
              		<li><a href="my_interior_tip">인테리어 팁</a></li>
              		<li><a href="my_review">시공리뷰</a></li>
              		<li><a href="my_qna">QNA</a></li>
              	</ul>
              </li>
              <li class="mypage_side_list"><a href="#">대화목록</a></li>
              <li class="mypage_side_list"><a href="#">북마크</a></li>
            </ul>
          </div>
      
      
<%--나중에,,,,,,,,,,,,,,,,,,,, --%>
      <div id="company_title">
        <!-- <input type="button" value="더보기"> -->
        <p>
          <span class="font_green">시공리뷰</span> 
      </div>
      <div id="review_content">
		 <c:forEach items="${myReview }" var="myReview" varStatus="status">
			<a href="../interior/review_show?re_no=${myReview.re_no }">
	          <div class="recon_01">
	            <p>
	              <span>${myReview.re_title}</span>
	              <span>${myReview.com_name}</span>
	          <img src="${path }/resources/images/star_yellow_15.png" /> 
	              <span>${myReview.com_rating }</span>
	            </p>
	            <p>${myReview.re_content}
	            </p>
	            
	          </div>
	        </a>
		 </c:forEach>
			
        <div id="move_btn2">
          <input type="button" value="더보기" />
        </div>
      </div>
</div>
      
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>