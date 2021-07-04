<%@page import="com.green.dehome.dto.InteriorTipDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.green.dehome.dao.InteriorTipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<%
	System.out.println(request.getParameter("category"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테리어 팁</title>
	<link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" type="image⁄x-icon" href="${path }/resources/images/x-icon.png" />
    <link rel="stylesheet" href="${path }/resources/css/header_footer.css" />
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
    <link rel="stylesheet" href="${path }/resources/css/interior_tip.css" />
</head>
<body>
<%@include file ="../headerfooter/header.jsp" %> 

	<%-- 콘텐트 헤더 --%> 
	<div id="part_tip_list">
      <div id="company_title">
      <c:choose>
      	<c:when test="${empty id}">
	        <input type="button" value="팁 작성하기"
    	      	   onclick="location.href='../login/login'" />
      	</c:when>
      	<c:otherwise>
	        <input type="button" value="팁 작성하기"
    	      	   onclick="location.href='../interior/interiorTipWrite'" />
      	</c:otherwise>
      </c:choose>
      <c:choose>

	      		<c:when test="${category eq 'construct'}">
					<p>
	        			<span class="font_green">인테리어 시공 TIP</span>
	        			인테리어 시공 꿀팁
	        		</p>
	      		</c:when>
	      		<c:when test="${category eq 'storage' }">
					<p>
	        			<span class="font_green">차곡차곡 수납 TIP</span>
	        			수납 인테리어 꿀팁
	        		</p>
	      		</c:when>
	      		<c:when test="${category eq 'decorate' }">
					<p>
	        			<span class="font_green">인테리어 꾸미기 TIP</span>
	        			꾸미기 꿀팁
	        		</p>
	      		</c:when>
	      		<c:when test="${category eq 'cleaning' }">
					<p>
	        			<span class="font_green">꼼꼼한 청소 TIP</span>
	        			청소 꿀팁
	        		</p>
	      		</c:when>
	      		<c:when test="${category eq 'diy' }">
					<p>
	        			<span class="font_green">인테리어 DIY TIP</span>
	        			DIY 인테리어 꿀팁
	        		</p>
	      		</c:when>
	      		<c:when test="${category eq 'reform' }">
					<p>
	        			<span class="font_green">새 것 같은 리폼 TIP</span>
	        			인테리어 리폼 꿀팁
	        		</p>
	      		</c:when>
	      		<c:when test="${category eq 'kitchen' }">
					<p>
	        			<span class="font_green">주방 및 욕실 TIP</span>
	        			주방/욕실 인테리어 꿀팁
	        		</p>
	      		</c:when>
	      		<c:when test="${category eq 'lighting' }">
					<p>
	        			<span class="font_green">전기 및 조명 TIP</span>
	        			전기/조명 인테리어 꿀팁
	        		</p>
	      		</c:when>
	      		<c:otherwise>
	      			<p>
	        			<span class="font_green">전기 및 조명 TIP</span>
	        			전기/조명 인테리어 꿀팁
	        		</p>
	      		</c:otherwise>
 
      </c:choose>
		</div>
      	<div id="tip_sub_title">
       		<span>
       			다양한 사람들과 공유하는, 누구나 할 수 있지만
       			알려주기 전엔 모르는 오직 나 만의 꿀팁
	        </span>
    	</div>
      <!-- 콘텐트 -->
      <table>
        <tr>
			<c:forEach var="dto" items="${tipListCategory}" end="4" step="1">
				<c:choose>
					<c:when test="${empty id}">
			            <a href="../login/login">
					</c:when>
					<c:otherwise>
		           		<a href="<!-- 팁상세페이지 -->?tip_no=${dto.tip_no}&category=${dto.tip_category}">
					</c:otherwise>
				</c:choose>
	   	      	<div id="shop">
                	<div class="shop_img">
                		<input type="button" />
                		<img src="${dto.tip_file}" />
		            </div>
	                <div class="shop_ex">
                  <div class="shop_name">${dto.tip_title}</div>
	                  <p>
	                    조회수 
	                    <span class="font_green">${dto.tip_count}</span> 
	                    · 스크랩 
	                    <span class="font_green">${dto.tip_bookmark}</span>
	                  </p>
	              </div>
                </div>
           	    </a>
			</c:forEach>
          <td>
        </tr>
      </table>
      <%-- 미구현 --%>
      <div id="move_btn">
        <input type="button" value="더보기" />
      </div>
    </div>
<%@include file ="../headerfooter/footer.jsp" %>
</body>
</html>