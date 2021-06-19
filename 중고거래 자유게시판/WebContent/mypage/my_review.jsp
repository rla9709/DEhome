<%@page import="interior.InteriorReviewDTO"%>
<%@page import="interior.InteriorReviewDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="trade.TradeBoardDTO"%>
<%@page import="trade.TradeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/mypage.js" charset="utf-8"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/my_page.css" />
    <link rel="stylesheet" href="../css/login.css" />

</head>
<body>
<%@include file="../headerfooter/header.jsp" %>
<%
request.setCharacterEncoding("UTF-8");

	String tr_user_nick = "";
	if (request.getParameter("tr_user_nick") != null) {
		tr_user_nick = request.getParameter("tr_user_nick");
	}
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum= "1";
	}
	
	InteriorReviewDAO dao = InteriorReviewDAO.getinstance();
	ArrayList<InteriorReviewDTO> myReviewList = dao.myReview(nick);
	
	int re_no,com_rating = 0;
	String com_name=null,  re_title=null, re_content=null;
	
	
	
%>
 <div class="contents_mypage">
        <a href="mypage.html"></a><h2 class="page_title">MY PAGE</h2></a>
        <div class="mypage_header_box">
          <p class="my_page_label">${id }님 안녕하세요</p>
        </div>
        <div class="mypage_sidebar_box">
          <ul>
            <li class="mypage_side_label">회원정보</li>
            <li class="mypage_side_list">
              <a href="edit_account.jsp">개인정보 수정</a>
            </li>
            <li class="mypage_side_list">
              <a href="delete_account.jsp">회원탈퇴</a>
            </li>
            <li class="mypage_side_list">
              <a href="account_system_link.jsp">간편로그인 연동</a>
            </li>
            <li class="mypage_side_list"><a href="#">주제 목록4</a></li>
          </ul>
       <ul class="mypage_ul2">
              <li class="mypage_side_label">활동 및 문의</li>
              <li class="mypage_side_list"><a href="my_trade_list.jsp">나의 거래 ></a></li>
              <li class="mypage_side_list_1" style="color: #1B7850"><a href="#">내가 작성한 글 ></a>
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
          <ul>
            <li class="mypage_side_label">사이드바 주제3</li>
            <li class="mypage_side_list"><a href="#">주제 목록1</a></li>
            <li class="mypage_side_list"><a href="#">주제 목록2</a></li>
            <li class="mypage_side_list"><a href="#">주제 목록3</a></li>
            <li class="mypage_side_list"><a href="#">주제 목록4</a></li>
          </ul>
      </div>
      
      

      <div id="company_title">
        <!-- <input type="button" value="더보기"> -->
        <p>
          <span class="font_green">시공리뷰</span> 
      </div>
      <div id="review_content">

	<%
		for(int i = 0; i<myReviewList.size(); i++  ){
			InteriorReviewDTO dto = myReviewList.get(i);
			
			re_no = dto.getRe_no();
			com_name = dto.getCom_name();
			re_title = dto.getRe_title();
			re_content = dto.getRe_content();
			com_rating = dto.getCom_rating();
			
	%>
			<a href="review_page.html">
	          <div class="recon_01">
	            <p>
	              <span><%=re_title %></span>
	              <span><%=com_name  %></span>
	              <img src="../images/star_yellow_15.png" />
	              <span><%=com_rating %></span>
	            </p>
	            <p><%=re_content %>
	            </p>
	            
	          </div>
	        </a>
			
	<%		
		}
	%>
        
      <%--<a href="review_page.html">
          <div class="recon_01">
            <p>
              <span>집꾸집꾸</span>
              <span>(주)제이디자인</span>
              <img src="../images/star_yellow_15.png" />
              <span>3.5</span>
            </p>
            <p>
              전문가선생님께서 저희가 원했던 인테리어보다 훨씬 더 만족스러운
              인테리어를 해주시고자 노력해주셔서 감사했습니다 ! 그리고 저희 집을
              담당하시면서 고생도 많으셨을텐데 끝까지 책임지시고 열정을 많이
              쏟아주셔서 너무 좋았습니다! 공사가 끝나고 한달반의 시간이 지난 지금
              저희 가족들은 보면볼수록 화장실, 거실, 주방 등등! 어느 한곳빠진데
              없이 다 너무 이뻐서 매우 만족하고있습니다! 공사작업해주신 모든
              분들께 감사드립니다
            </p>
            
          </div>
        </a>  --%>  
        
        <div id="move_btn2">
          <input type="button" value="더보기" />
        </div>
      </div>
    <!-- </div> -->

      
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>