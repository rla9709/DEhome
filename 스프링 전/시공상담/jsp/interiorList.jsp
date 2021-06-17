<%@page import="myUtil.HanConv"%>
<%@page import="java.util.ArrayList"%>
<%@page import="interior.InteriorDTO"%>
<%@page import="interior.InteriorConsDAO"%>
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

	
	InteriorConsDAO interior = InteriorConsDAO.getinstance();
	
	
	/*--업체 리시트용 위치 받아오기(설정전엔 세션 유저의 위치로 기본설정)--*/
	
	String company_location = "위치 설정 요망"; // body 위치부분에 출력될 설정한 위치
	
	// 세션 유저의 위치정보 받아오기
	String userAddr = null;
	if (interior.userAddr(nick) != null) {
		userAddr = interior.userAddr(nick);
	}
	
	// 팝업 select 2개 받아오기
	String select_addr1 = "seoul";
	if (request.getParameter("popup_addr1") != null) { // 첫번째 select 값
		select_addr1 = request.getParameter("popup_addr1");
	}
	String select_addr2 = "";
	if (request.getParameter("popup_addr2") != null) { // 두번째 select 값
		select_addr2 = request.getParameter("popup_addr2");
	}
	
	ArrayList<InteriorDTO> comList = new ArrayList<InteriorDTO>(); // 업체 리스트 받을 객체 생성
	
	// 설정한 위치 값 셋팅
	if (request.getParameter("popup_addr1") != null || request.getParameter("popup_addr2") != null) {
		company_location = interior.locToKor(select_addr1) + " " + interior.locToKor(select_addr2);
	} else {
		if (userAddr != null) {
			company_location = userAddr;
		} else {
		}
	}
	
	comList = interior.locList(company_location); // 업체 리스트 받아오기
	
	
	/*--받아온 업체 리스트 셋팅하기--*/
	String com_name = null;
	String com_title = null;
	String com_addr = null;
	String com_content = null;
	String com_file = null;
	float com_rating = 0;
	int com_contract = 0;
	int com_review_count = 0;
	
	/*--사진 경로 셋팅--*/
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/interior.css" />
<script type="text/javascript" src="../js/interior.js" charset="utf-8"></script>
</head>
<body>

	<jsp:include page="../headerfooter/header.jsp"/>

	<div id="interior_company">
      <div id="company_title">
      <%
        if (id.equals("admin1") || id.equals("admin2") || id.equals("admin3") || nick.equals("admin1") || nick.equals("admin2") || nick.equals("admin3")) {
      %>
        	<input type="button" value="업체등록" onclick="location.href='register_com.jsp'" />
      <%
        } else if (id == null || nick == null || id.equals("") || nick.equals("")) {
      %>
      		<input type="button" value="대화목록" onclick="login_no()" >
      <%
        } else {
      %>
      		<input type="button" value="대화목록" /> 	
      <%	
        }
       %>
        <p><span class="font_green">시공상담</span> 나에게 딱 맞는 업체 찾기</p>
        <p>
          원하는 업체와 쉽고 빠르게 컨텍하여 시공을 상담받아볼 수 있는
          DE:home만의 서비스입니다
        </p>
      </div>
      <div id="company_location_search">
        <span style="font-size:15px;" class="font_bolder"><%= company_location %></span>
        <span>위치 설정을 원하시면 우측의 주소변경을 클릭해주세요</span>
        <input type="button" value="주소변경" onclick="location_popup()" />
      </div>
      <table>
      	<tr>
	      <%
	      	for (int i = 1; i <= comList.size(); i++) {
	      		InteriorDTO board = comList.get(i - 1);
	      		
	      		com_name = board.getIn_com_name();
	      		com_title = board.getIn_com_title();
	      		com_addr = board.getIn_com_addr();
	      		com_content = board.getIn_com_content();
	      		com_file = board.getIn_com_file();
	      		// 해당업체 평점 불러오기
	      		com_rating = interior.comRating(com_name);
	      		com_contract = board.getIn_com_contract();
	      		
	      		
	      		/*--해당업체 리뷰 건수 불러오기--*/
	      		com_review_count = interior.comReviewCount(com_name);
	      		
	      %>
   			<td>
            	<a href="company_page.jsp?name=<%= HanConv.toKorTwo(com_name) %>">
              	<div id="shop">
                	<div class="shop_img">
                  		<img src="<%= com_file %>" />
                	</div>
	                <div class="shop_ex">
	                  <div class="star">
	                    <img src="../images/star_green.png" />
	                    <span><%= com_rating %></span>
	                  </div>
	                  <div class="shop_name"><%= com_name %></div>
	                  <p><%= com_addr %></p>
	                  <p>
	                    <span>
	                    	업체 리뷰
	                    	<span class="shop_count font_green font_bolder"><%= com_review_count %>건</span>
	                    </span>
	                    <span>
							최근 계약
							<span class="shop_count font_green font_bolder"><%= com_contract %>건</span>
	                    </span>
	                  </p>
	                </div>
              	</div>
            	</a>
        	</td>
      				
      <%
	      	if (i != 0 && i % 3 == 0) {
	      		%>
	      		</tr>
	      		<tr>
	      		<%	
	      	}
      
      	}
      %>
      	</tr>
      </table>
      <div id="move_btn">
        <input type="button" value="더보기" />
      </div>
    </div>
    
    <jsp:include page="../headerfooter/footer.jsp"/>
    
</body>
</html>