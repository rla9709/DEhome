<%@page import="trade.TradeShowDTO"%>
<%@page import="trade.TradeShowDAO"%>
<%@page import="trade.TradeListDAO"%>
<%@page import="trade.TradeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/tr_board.js" charset="utf-8"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"/>
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/my_page.css" />
    <link rel="stylesheet" href="../css/reset.css" />
</head>
<body>

<%
    	//utf8 인코딩
    	request.setCharacterEncoding("utf-8");
     
    	TradeListDAO tr_dao = TradeListDAO.getInstance();
    	TradeShowDAO tr_show_dao = TradeShowDAO.getInstance();
%>
<%@include file="../headerfooter/header.jsp" %>

    <content>
      <div class="contents_mypage">
        <a href="mypage.html"></a><h2 class="page_title">MY PAGE</h2></a>
        <div class="mypage_header_box">
          <p class="my_page_label">${nick }님 안녕하세요</p>
        </div>
       
          <div class="mypage_sidebar_box">
            <ul class="mypage_ul1">
              <li class="mypage_side_label">회원정보</li>
              <li class="mypage_side_list" ><a href="edit_account.jsp">개인정보 수정</a></li>
              <li class="mypage_side_list"><a href="delete_account.jsp">회원탈퇴</a></li>
              <li class="mypage_side_list"><a href="account_system_link.jsp">간편로그인 연동</a></li>
              <li class="mypage_side_list"><a href="#">주제 목록4</a></li>
            </ul>
            <ul class="mypage_ul2">
              <li class="mypage_side_label">활동 및 문의</li>
              <li class="mypage_side_list"><a href="my_trade_list.jsp">나의 거래 ></a></li>
              <li class="mypage_side_list_1" style="color: #1B7850"><a href="my_trade_board.jsp">내가 작성한 글 ></a>
              	<ul class="mypage_side_list_2">
              		<li><a href="my_trade_board.jsp">자유게시판</a></li>
              		<li><a href="my_interior_tip.jsp">인테리어 팁</a></li>
              		<li><a href="my_review.jsp">시공리뷰</a></li>
              		<li><a href="#">QNA</a></li>
              	</ul>
              </li>
              <li class="mypage_side_list"><a href="#">대화목록</a></li>
              <li class="mypage_side_list"><a href="#">북마크</a></li>
            </ul>
            <ul class="mypage_ul3">
              <li class="mypage_side_label">사이드바 주제3</li>
              <li class="mypage_side_list"><a href="#">주제 목록1</a></li>
              <li class="mypage_side_list"><a href="#">주제 목록2</a></li>
              <li class="mypage_side_list"><a href="#">주제 목록3</a></li>
              <li class="mypage_side_list"><a href="#">주제 목록4</a></li>
            </ul>
          </div>
          
<div id="mypage_main">
        <div class="mypage_content_box">
          <p class="mypage_label">진행중인 거래</p>
<%
		ArrayList<TradeDTO> tr_sell_list = tr_dao.myTradeList(nick);
		for(int i = 0; i < tr_sell_list.size(); i++) {
			TradeDTO dto = tr_sell_list.get(i);
			String title = dto.getTr_title();//글제목
			String price = dto.getTr_price();//가격
			String photo = dto.getTr_photo();
			String addr2 = dto.getUser_addr2();
			String writer = dto.getTr_user_nick();
			
			int num = dto.getTr_no(); //글번호
			
			int interest = tr_dao.sumInterest(num);
			
			TradeShowDTO tr_show_dto = tr_show_dao.usedTradeBoard(num, false);
			int tr_complete = tr_show_dto.getTr_complete();
			
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("price", price);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("addr2", addr2);
			pageContext.setAttribute("writer", writer);
			pageContext.setAttribute("num", num);
			pageContext.setAttribute("interest", interest);
%>
<%
		if(tr_complete == 0){
%>          
          <div class="mypage_content_list_main" onclick="location.href='../trade/tradeShow.jsp?tr_user_nick=${writer}&tr_no=${num}'">
          		<div>
				<img class="my_sell_image" src="${photo}"/>
          		</div>
				<div class="my_sell_text">
						<p class="my_sell_title">${title}</p>
						<p class="my_sell_addr">${addr2}</p>
						<!-- 추천이 0일경우 <p class="post_price">30,000원</p>이거만 남기면됌 -->
<%
					if(interest != 0) {
%>
						<div class="my_ut_price_heart">
<%
						if(price.equals("0")) {
%>
							<p class="my_sell_price">무료나눔</p>							
<%
						} else {
%>
							<p class="my_sell_price">${price} 원</p>								
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
							<p class="my_sell_price">무료나눔</p>							
<%
						} else {
%>
							<p class="my_sell_price">${price} 원</p>								
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
<%
		}
%>
		</div>
        <div class="mypage_content_box">
          <p class="mypage_label">판매 내역</p>
<%
		
		for(int i = 0; i < tr_sell_list.size(); i++) {
			TradeDTO dto = tr_sell_list.get(i);
			String title = dto.getTr_title();//글제목
			String price = dto.getTr_price();//가격
			String photo = dto.getTr_photo();
			String addr2 = dto.getUser_addr2();
			String writer = dto.getTr_user_nick();
			
			int num = dto.getTr_no(); //글번호
			
			int interest = tr_dao.sumInterest(num);
			
			TradeShowDTO tr_show_dto = tr_show_dao.usedTradeBoard(num, false);
			int tr_complete = tr_show_dto.getTr_complete();
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("price", price);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("addr2", addr2);
			pageContext.setAttribute("writer", writer);
			pageContext.setAttribute("num", num);
			pageContext.setAttribute("interest", interest);
%>
          
          <div class="mypage_content_list_main" onclick="location.href='../trade/tradeShow.jsp?tr_user_nick=${writer}&tr_no=${num}'">
          		<div>
				<img class="my_sell_image" src="${photo}"/>
          		</div>
				<div class="my_sell_text">
						<p class="my_sell_title">${title}</p>
						<p class="my_sell_addr">${addr2}</p>
						<!-- 추천이 0일경우 <p class="post_price">30,000원</p>이거만 남기면됌 -->
<%
					if(interest != 0) {
%>
						<div class="my_ut_price_heart">
<%
						if(price.equals("0")) {
%>
							<p class="my_sell_price">무료나눔</p>							
<%
						} else {
%>
							<p class="my_sell_price">${price} 원</p>								
<%							
						}
%>					
							<div class="my_ut_heart_img_div">
								<img src="../images/heart.png" class="my_ut_heart" /> 
								<span class="my_ut_heart_cnt">${interest}</span>
							</div>
						</div>
<%
						if(tr_complete == 1){
%>					
							<div class="my_sell_complete">
								<span>거래완료</span>
							</div>
					
<%
						}
					} else {
%>
						<div class="my_ut_price_heart">
<%
						if(price.equals("0")) {
%>
							<p class="my_sell_price">무료나눔</p>							
<%
						} else {
%>
							<p class="my_sell_price">${price} 원</p>								
<%							
						}
%>					
						</div>	
<%
						if(tr_complete == 1){
%>					
							<div class="my_sell_complete">
								<span>거래완료</span>
							</div>
					
<%
						}					

					}
%>
					</div>
				</div>
<%
		}
%>
		</div>
        <div class="mypage_content_box">
          <p class="mypage_label">구매한 상품</p>
<%
		for(int i = 0; i < tr_sell_list.size(); i++) {
			TradeDTO dto = tr_sell_list.get(i);
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
          
          <div class="mypage_content_list_main" onclick="location.href='../trade/tradeShow.jsp?tr_user_nick=${writer}&tr_no=${num}'">
          		<div>
				<img class="my_sell_image" src="${photo}"/>
          		</div>
				<div class="my_sell_text">
						<p class="my_sell_title">${title}</p>
						<p class="my_sell_addr">${addr2}</p>
						<!-- 추천이 0일경우 <p class="post_price">30,000원</p>이거만 남기면됌 -->
<%
					if(interest != 0) {
%>
						<div class="my_ut_price_heart">
<%
						if(price.equals("0")) {
%>
							<p class="my_sell_price">무료나눔</p>							
<%
						} else {
%>
							<p class="my_sell_price">${price} 원</p>								
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
							<p class="my_sell_price">무료나눔</p>							
<%
						} else {
%>
							<p class="my_sell_price">${price} 원</p>								
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
    <%--</div>
        <div class="mypage_content_box">
          <p class="mypage_label">판매상품 목록</p>
          <div class="mypage_content_list_main">사진1</div>
          <div class="mypage_content_list_main">사진2</div>
          <div class="mypage_content_list_main">사진3</div>
          <div class="mypage_content_list_main">사진4</div>
        </div>
        <div class="mypage_content_box">
          <p class="mypage_label">구매상품 목록</p>
          <div class="mypage_content_list_main">사진1</div>
          <div class="mypage_content_list_main">사진2</div>
          <div class="mypage_content_list_main">사진3</div>
          <div class="mypage_content_list_main">사진4</div>
        </div>
      </div>
       --%>  
</div>
    </content>

<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>