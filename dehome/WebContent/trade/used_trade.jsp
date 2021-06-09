<%@page import="trade.TradeListDAO"%>
<%@page import="trade.TradeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//utf8 인코딩
	request.setCharacterEncoding("utf-8");

	TradeListDAO dao = TradeListDAO.getInstance();
	String category = request.getParameter("category");
	String word = request.getParameter("search_area");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중고거래</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/usedTrade.css" />
    <script type="text/javascript" src="../js/trade.js" charset="utf-8" ></script>
</head>
<body>
<%@include file ="../headerfooter/header.jsp" %>
	<main>
		<div class="mainForm">
			<form action="../trade/used_trade.jsp" method="post" name="search_form">
				<div class="usedTrade_addressForm">
					<div class="input_form">
						<input type="text" placeholder="동네 이름을 검색해 보세요!" maxlength="40" name="search_area"/>
						<button type="button" class="goods_search_btn" onclick="search_check()">
							<img src="https://d1unjqcospf8gs.cloudfront.net/assets/home/base/header/search-icon-7008edd4f9aaa32188f55e65258f1c1905d7a9d1a3ca2a07ae809b5535380f14.svg" />
						</button>
						<a href="" class="chat_index">대화목록</a> 
						<a href="registerGoods.html" class="sell_btn">내 상품팔기</a>
					</div>
				</div>
			</form>
<% 
	if(category != null && word == null) { // 중고거래 카테고리별 화면
		if(category.equals("furniture")) {
%>
			<span class="popularity_used">가구</span>
<% 
		} else if(category.equals("fabric")) {
%>
			<span class="popularity_used">fabric</span>
<% 
		} else if(category.equals("interior_prop")) {
%>
			<span class="popularity_used">인테리어 소품</span>
<% 
		} else if(category.equals("light")) {
%>
			<span class="popularity_used">조명</span>
<% 
		} else if(category.equals("sotrage_furniture")) {
%>
			<span class="popularity_used">수납</span>
<% 
		} else if(category.equals("life_bath")) {
%>
			<span class="popularity_used">생활/욕실</span>
<% 
		} else if(category.equals("kitchen")) {
%>
			<span class="popularity_used">주방</span>
<% 
		} else if(category.equals("diy")) {
%>
			<span class="popularity_used">DIY</span>
<% 
		}
%>			
			<div class="used_post_box" id="used_post_box">
<%
		ArrayList<TradeDTO> list = dao.usedTradeCategoryList(category);
		for(int i = 0; i < list.size(); i++) {
			TradeDTO dto = list.get(i);
			String title = dto.getTr_title();//글제목
			String price = dto.getTr_price();//가격
			int count = dto.getTr_count();//좋아요 개수
			String photo = dto.getTr_photo();
			String addr2 = dto.getUser_addr2();
		
%>
				<div class="used_post" onclick="location.href='postDetail.html'">
					<div class="post_image_div">
						<img class="post_image" src="<%= photo%>"/>
					</div>
					<div class="post_content_div">
						<p class="post_title"><%= title%></p>
						<p class="post_address"><%= addr2 %></p>
						<!-- 추천이 0일경우 <p class="post_price">30,000원</p>이거만 남기면됌 -->
<%
					if(count != 0) {
%>
						<div class="price_heart">
							<p class="post_price"><%= price %></p>
							<div class="heart_img_div">
								<img src="../images/heart.png" class="heart" /> 
								<span class="heart_cnt"><%= count %></span>
							</div>
						</div>						
<%
					} else {
%>
						<div class="price_heart">
							<p class="post_price"><%= price %></p>
						</div>						
<%
					}
%>
					</div>
				</div>
<%
		}
	} else if(category == null && word == null) { // 중고거래 버튼 눌렀을때 인기순대로 나오는 중고거래 메인화면
%>
		<span class="popularity_used">인기중고</span>
		<div class="used_post_box" id="used_post_box">
<%
		ArrayList<TradeDTO> list = dao.usedTradeList();
		for(int i = 0; i < list.size(); i++) {
			TradeDTO dto = list.get(i);
			String title = dto.getTr_title();//글제목
			String price = dto.getTr_price();//가격
			int count = dto.getTr_count();//좋아요 개수
			String photo = dto.getTr_photo();
			String addr2 = dto.getUser_addr2();
	
%>
			<div class="used_post" onclick="location.href='postDetail.html'">
				<div class="post_image_div">
					<img class="post_image" src="<%= photo%>"/>
				</div>
				<div class="post_content_div">
					<p class="post_title"><%= title%></p>
					<p class="post_address"><%= addr2 %></p>
					<!-- 추천이 0일경우 <p class="post_price">30,000원</p>이거만 남기면됌 -->
<%
					if(count != 0) {
%>
						<div class="price_heart">
							<p class="post_price"><%= price %></p>
							<div class="heart_img_div">
								<img src="../images/heart.png" class="heart" /> 
								<span class="heart_cnt"><%= count %></span>
							</div>
						</div>						
<%
					} else {
%>
						<div class="price_heart">
							<p class="post_price"><%= price %></p>
						</div>						
<%
					}
%>
				</div>
			</div>
<%
		} 
		
	} else { // 지역검색시 뜨는 화면
%>
		<span class="popularity_used">'<%=word %>'이 포함된 지역의 물건</span>
		<div class="used_post_box" id="used_post_box">
<%
		ArrayList<TradeDTO> list = dao.usedTradeAreaList(word);
		for(int i = 0; i < list.size(); i++) {
			TradeDTO dto = list.get(i);
			String title = dto.getTr_title();//글제목
			String price = dto.getTr_price();//가격
			int count = dto.getTr_count();//좋아요 개수
			String photo = dto.getTr_photo();
			String addr2 = dto.getUser_addr2();
	
%>
			<div class="used_post" onclick="location.href='postDetail.html'">
				<div class="post_image_div">
					<img class="post_image" src="<%= photo%>"/>
				</div>
				<div class="post_content_div">
					<p class="post_title"><%= title%></p>
					<p class="post_address"><%= addr2 %></p>
					<!-- 추천이 0일경우 <p class="post_price">30,000원</p>이거만 남기면됌 -->
<%
					if(count != 0) {
%>
						<div class="price_heart">
							<p class="post_price"><%= price %></p>
							<div class="heart_img_div">
								<img src="../images/heart.png" class="heart" /> 
								<span class="heart_cnt"><%= count %></span>
							</div>
						</div>						
<%
					} else {
%>
						<div class="price_heart">
							<p class="post_price"><%= price %></p>
						</div>						
<%
					}
%>
				</div>
			</div>
<%
		} 
			
	}
%>
		
				</div>
				<!-- ajax로 스프링 넘어갈때 구현예정 -->
				<div class="more_btn">
					<button id="addBtn" onclick="moreList()" >더보기(MORE)</button>
				</div>
			</div>
		</div>
		</div>
	</main>
<%@include file ="../headerfooter/footer.jsp" %>
</body>
</html>