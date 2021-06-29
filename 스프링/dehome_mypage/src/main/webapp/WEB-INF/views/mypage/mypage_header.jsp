<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"/>
  	<link rel="stylesheet" href="${path }/resources/css/header_footer.css" />
    <link rel="stylesheet" href="${path }/resources/css/my_page.css" />
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
    
</head>
<body>
<div class="contents_mypage">
        <a href="mypage"></a><h2 class="page_title">MY PAGE</h2></a>
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
		</div>          
</body>
</html>