<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="myUtil.HanConv"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="trade.TradeShowDTO"%>
<%@page import="trade.TradeDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String id = "";
	if(session.getAttribute("id") != null) {
		id = (String)session.getAttribute("id");
	}
	
	String nick = "";
	if(session.getAttribute("nick") != null) {
		nick = (String)session.getAttribute("nick");
	}
	
	/*--글번호 받아오기--*/
	int tr_no = 0;
	if (request.getParameter("tr_no") != null) {
		tr_no = Integer.parseInt(request.getParameter("tr_no"));
	}
	
	
	/*--글작성자 받아오기--*/
	String tr_user_nick = "";
	if (request.getParameter("tr_user_nick") != null) {
		tr_user_nick = request.getParameter("tr_user_nick");
	}
	
	/*---------------받아온 값 확인하는 부분(삭제예정)---------------------*/
	System.out.println("세션받은 id : " + id);
	System.out.println("세션받은 nick : " + nick);
	System.out.println("받아온 글번호 : " + tr_no);
	System.out.println("받아온 글작성자닉네임 : " + tr_user_nick);
	/*-----------------------------------------------------------*/
	
	/*--조회수 쿠키 부분--*/
	Cookie[] cookies = request.getCookies();
	boolean visitor = false;
	
	for (Cookie cookie : cookies) {
		String cookieName =  URLDecoder.decode(cookie.getName(), "UTF-8");
		String cookieValue =  URLDecoder.decode(cookie.getValue(), "UTF-8");
		System.out.println("쿠키이름 : " + cookieName);
		System.out.println("쿠키값 : " + cookieValue);
		
		// 쿠키 유무 확인 부분
		if (cookieName.equals(nick)) {
			visitor = true;
		}
	}
	
	// 쿠키 없을때 세팅하는 부분
	if (visitor == false) {
		Cookie cookieNew = new Cookie(URLEncoder.encode(nick, "UTF-8"), URLEncoder.encode(Integer.toString(tr_no), "UTF-8"));
		cookieNew.setMaxAge(60*60*24*7);
		response.addCookie(cookieNew);
	}
	
	
	/*--글정보 받아오기--*/
	TradeDAO trade = TradeDAO.getInstance();
	TradeShowDTO board = new TradeShowDTO();
	
	boolean notSameNick = true;
	
	if (tr_user_nick.equals(nick) || visitor == true) {
		notSameNick = false;
	}
	
	board = trade.usedTradeBoard(tr_no, notSameNick);
	
	
	/*--좋아요(관심도) 셋팅--*/
	int like = 0;
	like = trade.tradeInterest(tr_no);
	
	/*--세션유저가 해당 글 좋아요 누른 전적 확인--*/
	int likeCheck = 0;
	likeCheck = trade.interestCheck(tr_no, nick); // 전적이 있으면 1, 없으면 0
	
	
	/*--글 기본정보 셋팅--*/
	String tr_category = "";
	String tr_title = "";
	String tr_content = "";
	Timestamp tr_date = null;
	int tr_count = 0;
	int tr_price = 0;
	String tr_photo = "";
	int tr_complete = 0; //거래완료시 1값
	
	if (board != null) {
		
		tr_category = board.getTr_category();
		tr_title = board.getTr_title();
		tr_content = board.getTr_content();
		tr_date = board.getTr_date();
		tr_count = board.getTr_count();
		tr_price = board.getTr_price();
		tr_photo = board.getTr_photo();
		tr_complete = board.getTr_complete();
	}
	
	/*--거래 위치 셋팅--*/
	String addr = "";
	addr = trade.tradeAddr(tr_user_nick);
	
	
	/*--날짜 차이 셋팅(오늘로부터~)--*/
	Calendar cal = Calendar.getInstance();
	int nowyear = cal.get(Calendar.YEAR);
	int nowmonth = cal.get(Calendar.MONTH) + 1;
	int nowdate = cal.get(Calendar.DATE);
	int nowhour = cal.get(Calendar.HOUR_OF_DAY);
	int nowminute = cal.get(Calendar.MINUTE);
	int nowsecond = cal.get(Calendar.SECOND);
	
	SimpleDateFormat sdf_year = new SimpleDateFormat("yyyy");
	SimpleDateFormat sdf_month = new SimpleDateFormat("MM");
	SimpleDateFormat sdf_date = new SimpleDateFormat("dd");
	SimpleDateFormat sdf_hour = new SimpleDateFormat("HH");
	SimpleDateFormat sdf_minute = new SimpleDateFormat("mm");
	SimpleDateFormat sdf_second = new SimpleDateFormat("ss");
	
	int dbyear = Integer.parseInt(sdf_year.format(tr_date));
	int dbmonth = Integer.parseInt(sdf_month.format(tr_date));
	int dbdate = Integer.parseInt(sdf_date.format(tr_date));
	int dbhour = Integer.parseInt(sdf_hour.format(tr_date));
	int dbminute = Integer.parseInt(sdf_minute.format(tr_date));
	int dbsecond = Integer.parseInt(sdf_second.format(tr_date));
	
	int year = nowyear - dbyear;
	int month = nowmonth - dbmonth;
	int date = nowdate - dbdate;
	int hour = nowhour - dbhour;
	int minute = nowminute - dbminute;
	int second = nowsecond - dbsecond;
	
	String resultDate = "";
	
	if (year > 0) {
		resultDate = year + "년 전";
	} else if (month > 0) {
		resultDate = month + "달 전";
	} else if (date > 0) {
		resultDate = date + "일 전";
	} else if (hour > 0) {
		resultDate = hour + "시간 전";
	} else if (minute > 0) {
		resultDate = minute + "분 전";
	} else if (second > 0) {
		resultDate = second + "초 전";
	}
	

	
	/*--카테고리 셋팅(영문->한글)--*/
	System.out.println(tr_category);
	String category = "";
	
	if (tr_category.equals("furniture")) {
		category = "가구";
	} else if(tr_category.equals("fabric")) {
		category = "fabric";
	} else if(tr_category.equals("interior_prop")) {
		category = "인테리어 소품";
	} else if(tr_category.equals("light")) {
		category = "조명";
	} else if(tr_category.equals("storage_furniture")) {
		category = "수납";
	} else if(tr_category.equals("life_bath")) {
		category = "생활/욕실";
	} else if(tr_category.equals("kitchen")) {
		category = "주방";
	} else if(tr_category.equals("diy")) {
		category = "DIY";
	}
	
	
	/*--가격 셋팅--*/
	DecimalFormat formatter = new DecimalFormat("###,###");
	
	String price = "";
	
	if (tr_price == 0) {
		price = "무료 나눔 상품입니다.";
	} else {
		price = formatter.format(tr_price) + "원";
	}
	
	
	

	
	/*--사진 셋팅--*/
	String real = "../images/clock.jpg";
	//File viewFile = new File();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet"/>
    
	<link rel="stylesheet" href="../css/reset.css" />
	<link rel="stylesheet" href="../css/postDetail.css" />
	<script type="text/javascript" charset="utf-8">
		function like_off() {
			alert("이미 관심 등록을 한 상품입니다.");
		}
		function complete_ok() {
			var okCheck = confirm("거래 완료 상품으로 전환하시겠습니까?")
			if(okCheck == true) {
				document.location.href = "tradeComplete_ok.jsp?tr_no=<%= tr_no %>&tr_user_nick=<%= HanConv.toKorTwo(tr_user_nick) %>";
			}
		}
	</script>
</head>
<body>

	<jsp:include page="../headerfooter/header.jsp"/>
	
	<main>
      <div class="detail_container">
        <div class="img_div">
          <img src="<%= real %>" class="detail_img" />
        </div>
        <div class="content_div">
          <div class="content_div_wirter_div">
            <div>
              <p class="nick"><%= tr_user_nick %></p>
              <p class="address"><%= addr %></p>
            </div>
            <!--(ajax로 비동기 구현) 관심 누르기 전 ->beforeheart.png/ 누른 후 -> afterheart.png -->
            <div class="heart_btn">
            <%
            	if (likeCheck == 0) {
            %>
            		<img onclick="location.href='tradeLike_ok.jsp?tr_no=<%= tr_no %>&tr_user_nick=<%= HanConv.toKorTwo(tr_user_nick) %>&session_nick=<%= HanConv.toKorTwo(nick) %>'" src="../images/beforeheart.png" alt="관심버튼off" />	
            <%
            	} else {
             %>
             		<img onclick="like_off()" src="../images/afterheart.png" alt="관심버튼on" />		
            <%
            	}
            %>
            </div>
          </div>
          <div class="content_div_content_div">
            <p class="content_div_title"><%= tr_title %></p>
            <p class="content_div_category"><%= category %>·<%= resultDate %></p>
            <p class="content_div_price"><%= price %></p>
            <p class="content_div_content"><%= tr_content %></p>
            <p class="content_div_like">관심<%= like %>·조회<%= tr_count %></p>
            <div class="btn_div">
            <%
            	if(tr_user_nick.equals(nick) && tr_complete != 1) {

            %>
            		<input type="button" value="거래 완료" onclick="complete_ok()" />&nbsp;&nbsp;&nbsp;
            <%
            	}
            
            	if(tr_complete == 1) {
            %>
            		<input type="button" value="판매 완료 상품" disabled="disabled" style="background-color: #ccc; color: #333" />		
            <%
            		
            	} else {
            %>
            		<input type="button" value="채팅으로 거래하기" />	
            <%
            	}
            %>
            </div>
          </div>
        </div>
      </div>
    </main>
    
    <jsp:include page="../headerfooter/footer.jsp"/>
    
</body>
</html>