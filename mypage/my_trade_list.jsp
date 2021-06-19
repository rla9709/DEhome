<%@page import="trade.TradeListDAO"%>
<%@page import="trade.TradeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" type="image⁄x-icon" href="../images/x-icon.png" />
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/my_page.css">
    <link rel="stylesheet" href="../css/my_usedtrade.css" />
    
    <script type="text/javascript" src="../js/trade.js" charset="utf-8" ></script>
</head>
<%
    	//utf8 인코딩
    	request.setCharacterEncoding("utf-8");
     
    	TradeListDAO tr_dao = TradeListDAO.getInstance();
%>
<body>
<%@include file="../headerfooter/header.jsp" %>
	<div class="contents_mypage"> 
          <h2 class="page_title">MY PAGE</h2>         
          <div class="mypage_header_box">
            <p class="my_page_label">${nick}님 안녕하세요</p>
          </div>
          <div class="mypage_sidebar_box">
            <ul class="mypage_ul1">
              <li class="mypage_side_label">회원정보</li>
              <li class="mypage_side_list" ><a href="edit_account.html">개인정보 수정</a></li>
              <li class="mypage_side_list"><a href="delete_account.html">회원탈퇴</a></li>
              <li class="mypage_side_list"><a href="account_system_link.html">간편로그인 연동</a></li>
              <li class="mypage_side_list"><a href="#">주제 목록4</a></li>
            </ul>
            <ul class="mypage_ul2">
              <li class="mypage_side_label">활동 및 문의</li>
              <li class="mypage_side_list" style="color: #1B7850"><a href="my_trade_list.jsp">나의 거래 ></a></li>
              <li class="mypage_side_list_1"><a href="#">내가 작성한 글</a>
              	<ul class="mypage_side_list_2">
              		<li><a href="#">자유게시판</a></li>
              		<li><a href="my_interior_tip.jsp">인테리어 팁</a></li>
              		<li><a href="#">시공리뷰</a></li>
              		<li><a href="my_qna.jsp">QNA</a></li>
              	</ul>
              </li>
              <li class="mypage_side_list"><a href="#">대화목록</a></li>
              <li class="mypage_side_list"><a href="my_bookmark.jsp">북마크</a></li>
            </ul>
            <ul class="mypage_ul3">
              <li class="mypage_side_label">사이드바 주제3</li>
              <li class="mypage_side_list"><a href="#">주제 목록1</a></li>
              <li class="mypage_side_list"><a href="#">주제 목록2</a></li>
              <li class="mypage_side_list"><a href="#">주제 목록3</a></li>
              <li class="mypage_side_list"><a href="#">주제 목록4</a></li>
            </ul>
          </div>
          <!-- 콘텐트 시작  -->
		<!-- 내가 올린 판매상품 목록 -->
	<div class="my_ut_mainForm">
		<span class="my_ut_popularity_used">내가 올린 판매상품</span>
		<div class="my_ut_used_post_box" id="my_ut_used_post_box">
<%
		ArrayList<TradeDTO> tr_list = tr_dao.myTradeList(nick);
		for(int i = 0; i < tr_list.size(); i++) {
			TradeDTO dto = tr_list.get(i);
			String title = dto.getTr_title();//글제목
			String price = dto.getTr_price();//가격
			String photo = dto.getTr_photo();
			String addr2 = dto.getUser_addr2();
			String writer = dto.getTr_user_nick();
			
			int num = dto.getTr_no(); //글번호
			
			int interest = tr_dao.sumInterest(num);
			
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("price", price);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("addr2", addr2);
			pageContext.setAttribute("writer", writer);
			pageContext.setAttribute("num", num);
			pageContext.setAttribute("interest", interest);
%>
				<div class="my_ut_used_post" onclick="location.href='../trade/tradeShow.jsp?tr_user_nick=${writer}&tr_no=${num}'">
					<div class="my_ut_post_image_div">
						<img class="my_ut_post_image" src="${photo}"/>
					</div>
					<div class="my_ut_post_content_div">
						<p class="my_ut_post_title">${title}</p>
						<p class="my_ut_post_address">${addr2}</p>
						<!-- 추천이 0일경우 <p class="post_price">30,000원</p>이거만 남기면됌 -->
<%
					if(interest != 0) {
%>
						<div class="my_ut_price_heart">
<%
						if(price.equals("0")) {
%>
							<p class="my_ut_post_price">무료나눔</p>							
<%
						} else {
%>
							<p class="my_ut_post_price">${price}</p>								
<%							
						}
%>					
							<div class="my_ut_heart_img_div">
								<img src="../images/heart.png" class="my_ut_heart" /> 
								<span class="my_ut_heart_cnt">${interest}</span>
							</div>
						</div>						
<%
					} else {
%>
						<div class="my_ut_price_heart">
<%
						if(price.equals("0")) {
%>
							<p class="my_ut_post_price">무료나눔</p>							
<%
						} else {
%>
							<p class="my_ut_post_price">${price}</p>								
<%							
						}
%>					
						</div>						
<%
					}
%>
					</div>
				</div>
<%
		}
%>
		</div>
      </div>
	<div class="my_ut_mainForm">
		<span class="my_ut_popularity_used">내가 구매한(중인) 상품</span>
		<div class="my_ut_used_post_box" id="my_ut_used_post_box">
<%
		ArrayList<TradeDTO> tr_list2 = tr_dao.myTradeList(nick);
		for(int i = 0; i < tr_list2.size(); i++) {
			TradeDTO dto = tr_list2.get(i);
			String title = dto.getTr_title();//글제목
			String price = dto.getTr_price();//가격
			String photo = dto.getTr_photo();
			String addr2 = dto.getUser_addr2();
			String writer = dto.getTr_user_nick();
			
			int num = dto.getTr_no(); //글번호
			
			int interest = tr_dao.sumInterest(num);
%>
				<div class="my_ut_used_post" onclick="location.href='../trade/tradeShow.jsp?tr_user_nick=${writer}&tr_no=${num}'">
					<div class="my_ut_post_image_div">
						<img class="my_ut_post_image" src="${photo}"/>
					</div>
					<div class="my_ut_post_content_div">
						<p class="my_ut_post_title">${title}</p>
						<p class="my_ut_post_address">${addr2}</p>
						<!-- 추천이 0일경우 <p class="post_price">30,000원</p>이거만 남기면됌 -->
<%
					if(interest != 0) {
%>
						<div class="my_ut_price_heart">
<%
						if(price.equals("0")) {
%>
							<p class="my_ut_post_price">무료나눔</p>							
<%
						} else {
%>
							<p class="my_ut_post_price">${price}</p>								
<%							
						}
%>					
							<div class="my_ut_heart_img_div">
								<img src="../images/heart.png" class="my_ut_heart" /> 
								<span class="my_ut_heart_cnt">${interest}</span>
							</div>
						</div>						
<%
					} else {
%>
						<div class="my_ut_price_heart">
<%
						if(price.equals("0")) {
%>
							<p class="my_ut_post_price">무료나눔</p>							
<%
						} else {
%>
							<p class="my_ut_post_price">${price}</p>								
<%							
						}
%>					
						</div>						
<%
					}
%>
					</div>
				</div>
<%
		}
%>
		</div>
      </div>
	</div>
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>