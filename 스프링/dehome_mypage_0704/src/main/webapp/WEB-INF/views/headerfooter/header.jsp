<%@page import="com.green.dehome.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/*  System.out.println("헤더 닉네임세션 -->" + session.getAttribute("nickname"));
  	System.out.println("헤더에서 일반로그인세션확인 -->" + session.getAttribute("login"));
	System.out.println("헤더에서 카카오 아이디로 회원가입여부 -->" + session.getAttribute("kakaoaddcheck"));  
	System.out.println("헤더에서 네이버 아이디로 회원가입여부 -->" + session.getAttribute("naveraddcheck")); */
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="kakaoaddcheck" value="${kakaoaddcheck}"/>
<c:set var="naveraddcheck" value="${naveraddcheck}"/>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="${path }/resources/css/header_footer.css" />
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
</head>
<body>
	<header id="header_body">
      <div id="header_top">
        <div class="header_top_left">
          <img src="${path}/resources/images/dh_logo.png" />
          <a href="../main/mainpage">DE:home</a>
        </div>
        <c:choose>
			<c:when test="${login != null}">		 
				<div class="header_top_right">
					<a href="../logout.do">로그아웃</a> &nbsp;&nbsp;&nbsp;
					<a href="../mypage/mypage">마이페이지</a>&nbsp;&nbsp;&nbsp;
					<input type="text"placeholder="search" />
					<button>검색</button>
				</div>
			</c:when>
			<c:when test="${(login == null && kakaoaddcheck != null) || (login == null && naveraddcheck != null)}">
				<div class="header_top_right">
				<c:choose>
					<c:when test="${kakaoaddcheck == 'Y'}">
						<a href="../logoutKakao">로그아웃</a> &nbsp;&nbsp;&nbsp;
					</c:when> 
					<c:when test="${kakaoaddcheck == 'N'}">
						<a href="../logoutKakao">로그아웃</a> &nbsp;&nbsp;&nbsp;
						<a href="../user/register_kakao">추가정보 등록</a>&nbsp;&nbsp;&nbsp;
					</c:when>
					<c:when test="${naveraddcheck == 'Y'}">
						<a href="../logoutNaver">로그아웃</a> &nbsp;&nbsp;&nbsp;
					</c:when> 
					<c:when test="${naveraddcheck == 'N'}">
						<a href="../logoutNaver">로그아웃</a> &nbsp;&nbsp;&nbsp;
						<a href="../user/register_naver">추가정보 등록</a>&nbsp;&nbsp;&nbsp;
					</c:when>
				</c:choose>
					<a href="#">마이페이지</a>&nbsp;&nbsp;&nbsp;
					<input type="text"placeholder="search" />
					<button>검색</button>
				</div>
			</c:when>
			<c:when test="${login == null && kakaoaddcheck == null && naveraddcheck == null}">
				<div class="header_top_right">
					<a href="../user/login">로그인</a> &nbsp;&nbsp;&nbsp; 
					<a href="../user/register">회원가입</a>&nbsp;&nbsp;&nbsp; 
					<input type="text"placeholder="search" />
					<button>검색</button>
				</div>		
			</c:when>
		</c:choose>	
      </div>
      <div id="menu_bar">
        <div class="menu_bar_property1">
          <div class="trade"><a href="../trade/used_trade.do?category=none">중고거래</a></div>
          <div class="category1">
            <div class="category1_word">
              <div class="category1_1"><a href="#">카테고리</a></div>
              <div class="category2">
                <table class="category2_table1">
                  <tr>
                    <td><a href="../trade/used_trade.do?category=furniture">가구</a></td>
                    <td><a href="../trade/used_trade.do?category=fabric">fabric</a></td>
                  </tr>
                  <tr>
                    <td><a href="../trade/used_trade.do?category=interior_prop">인테리어 소품</a></td>
                    <td><a href="../trade/used_trade.do?category=light">조명</a></td>
                  </tr>
                  <tr>
                    <td><a href="../trade/used_trade.do?category=storage_furniture">수납</a></td>
                    <td><a href="../trade/used_trade.do?category=life_bath">생활/욕실</a></td>
                  </tr>
                  <tr>
                    <td><a href="../trade/used_trade.do?category=kitchen">주방</a></td>
                    <td><a href="../trade/used_trade.do?category=diy">DIY</a></td>
                  </tr>
                </table>
              </div>
            </div>
            <div><a href="../trade/tr_board_list">자유 게시판</a></div>
          </div>
        </div>
        <div class="menu_bar_property2">
          <div class="interior">
          	<a href="#">인테리어</a>
          </div>
          <div class="category1">
            <div class="category1_word">
              <div class="category1_1">
                <a href="../interior/interior_tip.jsp">인테리어 팁</a>
              </div>
              <div class="category2">
                <table class="category2_table2">
                  <tr>
                    <td><a href="../interior/tip_list.jsp?category=construct">시공</a></td>
                    <td><a href="../interior/tip_list.jsp?category=storage">수납</a></td>
                  </tr>
                  <tr>
                    <td><a href="../interior/tip_list.jsp?category=decorate">꾸미기 팁</a></td>
                    <td><a href="../interior/tip_list.jsp?category=cleaning">청소</a></td>
                  </tr>
                  <tr>
                    <td><a href="../interior/tip_list.jsp?category=diy">DIY</a></td>
                    <td><a href="../interior/tip_list.jsp?category=reform">리폼</a></td>
                  </tr>
                  <tr>
                    <td><a href="../interior/tip_list.jsp?category=kitchen">주방/욕실</a></td>
                    <td><a href="../interior/tip_list.jsp?category=lighting">전기/조명</a></td>
                  </tr>
                </table>
              </div>
            </div>
            <div><a href="../interior/interiorList">시공상담</a></div>
          </div>
        </div>
        <div class="menu_bar_property3">
          <div class="customer"><a href="#">고객센터</a></div>
          <div class="category1">
            <div><a href="#">서비스 소개</a></div>
            <div><a href="#">QNA</a></div>
            <div><a href="#">공지사항</a></div>
          </div>
        </div>
      </div>
    </header>
</body>
</html>