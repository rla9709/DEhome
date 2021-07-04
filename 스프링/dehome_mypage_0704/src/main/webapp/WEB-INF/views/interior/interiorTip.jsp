<%@page import="java.util.ArrayList"%>
<%@page import="com.green.dehome.dto.InteriorTipDTO"%>
<%@page import="com.green.dehome.dao.InteriorTipDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>인테리어 팁</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet"/>
    <link rel="shortcut icon" type="image⁄x-icon" href="${path }/resources/images/x-icon.png" />
    <link rel="stylesheet" href="${path }/resources/css/header_footer.css" />
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
    <link rel="stylesheet" href="${path }/resources/css/interior_tip.css" />
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../headerfooter/header.jsp" /> 
	<div id="interior_tip_list">
<!--시공 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input type="button" value="더보기" class="more" 
	          		onclick="location.href='interiorTipList?category=construct'" />
	          <p>인테리어 시공 TIP</p>
	          <p>인테리어 시공 꿀팁</p>
	        </div>
			<c:forEach var="dto" items="${tipListConstruct}" end="4" step="1">
           		<a href="<!-- 팁상세페이지 -->?tip_no=${dto.tip_no}&category=${dto.tip_category}">
	   	      	<div class="tipcon_box">
	              	<div id="tipcon_img">
	                  <img src="${dto.tip_file}" />
		            </div>
	                <input type="button" >
	                <p>${dto.tip_title}</p>
	                <p>
	                  조회수 <span class="font_green">${dto.tip_count}</span> 
	                  · 스크랩 <span class="font_green">${dto.tip_bookmark}</span>
	                </p>
              	</div>
           	    </a>
			</c:forEach>
		</div>
<!-- 꾸미기 TIP -->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input type="button" value="더보기" class="more" 
	          		onclick="location.href='interiorTipList?category=decorate'" />
	          <p>인테리어 꾸미기 TIP</p>
	          <p>꾸미기 꿀팁</p>
	        </div>
			<c:forEach var="dto" items="${tipListDecorate}" end="4" step="1">
           		<a href="<!-- 팁상세페이지 -->?tip_no=${dto.tip_no}&category=${dto.tip_category}">
	   	      	<div class="tipcon_box">
	              	<div id="tipcon_img">
	                  <img src="${dto.tip_file}" />
		            </div>
	                <input type="button" >
	                <p>${dto.tip_title}</p>
	                <p>
	                  조회수 <span class="font_green">${dto.tip_count}</span> 
	                  · 스크랩 <span class="font_green">${dto.tip_bookmark}</span>
	                </p>
              	</div>
           	    </a>
			</c:forEach>
		</div>
<!--DIY TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input type="button" value="더보기" class="more" 
		      		onclick="location.href='interiorTipList?category=diy'" />
	          <p>인테리어 DIY TIP</p>
	          <p>DIY 인테리어 꿀팁</p>
	        </div>
			<c:forEach var="dto" items="${tipListDiy}" end="4" step="1">
           		<a href="<!-- 팁상세페이지 -->?tip_no=${dto.tip_no}&category=${dto.tip_category}">
	   	      	<div class="tipcon_box">
	              	<div id="tipcon_img">
	                  <img src="${dto.tip_file}" />
		            </div>
	                <input type="button" >
	                <p>${dto.tip_title}</p>
	                <p>
	                  조회수 <span class="font_green">${dto.tip_count}</span> 
	                  · 스크랩 <span class="font_green">${dto.tip_bookmark}</span>
	                </p>
              	</div>
           	    </a>
			</c:forEach>
		</div>
<!--주방/욕실 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input type="button" value="더보기" class="more" 
	          		onclick="location.href='interiorTipList?category=kitchen'" />
	          <p>주방 및 욕실 TIP</p>
	          <p>주방/욕실 인테리어 꿀팁</p>
	        </div>
			<c:forEach var="dto" items="${tipListKitchen}" end="4" step="1">
           		<a href="<!-- 팁상세페이지 -->?tip_no=${dto.tip_no}&category=${dto.tip_category}">
	   	      	<div class="tipcon_box">
	              	<div id="tipcon_img">
	                  <img src="${dto.tip_file}" />
		            </div>
	                <input type="button" >
	                <p>${dto.tip_title}</p>
	                <p>
	                  조회수 <span class="font_green">${dto.tip_count}</span> 
	                  · 스크랩 <span class="font_green">${dto.tip_bookmark}</span>
	                </p>
              	</div>
           	    </a>
			</c:forEach> 
		</div>
<!--수납 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input type="button" value="더보기" class="more" 
	          		onclick="location.href='interiorTipList?category=storage'" />
	          <p>차곡차곡 수납 TIP</p>
	          <p>수납 인테리어 꿀팁</p>
	        </div>
			<c:forEach var="dto" items="${tipListStorage}" end="4" step="1">
           		<a href="<!-- 팁상세페이지 -->?tip_no=${dto.tip_no}&category=${dto.tip_category}">
	   	      	<div class="tipcon_box">
	              	<div id="tipcon_img">
	                  <img src="${dto.tip_file}" />
		            </div>
	                <input type="button" >
	                <p>${dto.tip_title}</p>
	                <p>
	                  조회수 <span class="font_green">${dto.tip_count}</span> 
	                  · 스크랩 <span class="font_green">${dto.tip_bookmark}</span>
	                </p>
              	</div>
           	    </a>
			</c:forEach>
		</div>
<!--청소 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input type="button" value="더보기" class="more"
	          		onclick="location.href='interiorTipList?category=cleaning'"/>
	          <p>꼼꼼한 청소 TIP</p>
	          <p>청소 꿀팁</p>
	        </div>
			<c:forEach var="dto" items="${tipListCleaning}" end="4" step="1">
           		<a href="<!-- 팁상세페이지 -->?tip_no=${dto.tip_no}&category=${dto.tip_category}">
	   	      	<div class="tipcon_box">
	              	<div id="tipcon_img">
	                  <img src="${dto.tip_file}" />
		            </div>
	                <input type="button" >
	                <p>${dto.tip_title}</p>
	                <p>
	                  조회수 <span class="font_green">${dto.tip_count}</span> 
	                  · 스크랩 <span class="font_green">${dto.tip_bookmark}</span>
	                </p>
              	</div>
           	    </a>
			</c:forEach>
		</div>
<!--리폼 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input type="button" value="더보기" class="more"
	            	onclick="location.href='interiorTipList?category=reform'"/>
	          <p>새 것 같은 리폼 TIP</p>
	          <p>인테리어 리폼 꿀팁</p>
	        </div>
			<c:forEach var="dto" items="${tipListReform}" end="4" step="1">
           		<a href="<!-- 팁상세페이지 -->?tip_no=${dto.tip_no}&category=${dto.tip_category}">
	   	      	<div class="tipcon_box">
	              	<div id="tipcon_img">
	                  <img src="${dto.tip_file}" />
		            </div>
	                <input type="button" >
	                <p>${dto.tip_title}</p>
	                <p>
	                  조회수 <span class="font_green">${dto.tip_count}</span> 
	                  · 스크랩 <span class="font_green">${dto.tip_bookmark}</span>
	                </p>
              	</div>
           	    </a>
			</c:forEach>
		</div>
<!--전기/조명 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input type="button" value="더보기" class="more"
	            	onclick="location.href='interiorTipList?category=lighting'" />
	          <p>전기 및 조명 TIP</p>
	          <p>전기/조명 인테리어 꿀팁</p>
	        </div>
			<c:forEach var="dto" items="${tipListLighting}" end="4" step="1">
           		<a href="<!-- 팁상세페이지 -->?tip_no=${dto.tip_no}&category=${dto.tip_category}">
	   	      	<div class="tipcon_box">
	              	<div id="tipcon_img">
	                  <img src="${dto.tip_file}" />
		            </div>
	                <input type="button" >
	                <p>${dto.tip_title}</p>
	                <p>
	                  조회수 <span class="font_green">${dto.tip_count}</span> 
	                  · 스크랩 <span class="font_green">${dto.tip_bookmark}</span>
	                </p>
              	</div>
           	    </a>
			</c:forEach>
		</div>
	</div>
<jsp:include page="../headerfooter/footer.jsp" />
</body>
</html>