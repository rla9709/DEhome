<%@page import="myUtil.HanConv"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="interior.InteriorReviewDTO"%>
<%@page import="interior.InteriorReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*--세션 유저 받기--*/
	String id = (String)session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");
	
	

	/*--글 번호 받기--*/
	int re_no = 0;
	if (request.getParameter("re_no") != null) {
		re_no = Integer.parseInt(request.getParameter("re_no"));
	}
	
	/*--리뷰내용 받아오기--*/
	InteriorReviewDAO dao = InteriorReviewDAO.getinstance();
	InteriorReviewDTO board = dao.reviewShow(re_no);

	
	/*--날짜 셋팅--*/
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	
	/*--사진 셋팅--*/
	String real = "";
	real = "../images/room_06.jpg";
	//File viewFile = new File();
	
	
	/*--도움횟수 받아오기--*/
	int interestCount = 0;
	interestCount = dao.interestCount(re_no);
	
	/*--해당 유저 시공리뷰 좋아요 클릭 유무(1이면 이미 누른 것)--*/
	int session_user_like = 0;
	session_user_like = dao.searchInterest(re_no, nick);
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/interior.css" />
<script type="text/javascript" src="../js/review.js" charset="utf-8"></script>
<script type="text/javascript">
	function like_no() {
		var likeoff = confirm("관심 등록을 취소하시겠습니까?");
		if (likeoff) {
			document.location.href = "reviewLike_off.jsp?re_no=<%= re_no %>";
		}
	}
</script>
</head>
<body>

	<jsp:include page="../headerfooter/header.jsp"/>
	
	<div id="review_page">
    <div class="review_title">
      <p><%= sdf.format(board.getRe_date()) %></p>
      <p>시공리뷰</p>
      <p>
        이 리뷰가 도움이 된 횟수 <span class="font_green"><%= interestCount %></span>
      </p>
      <p><%= board.getRe_title() %></p>
<%

      if (nick.equals(board.getUser_nick())) { // 해당 글 작성자 == 로그인 닉네임 
 %>
      	<p><input type="button" value="리뷰 수정하기" onclick="location.href='review_edit.jsp?re_no=<%= re_no %>'" class="editBtn"></p>  
<%
      } else if (nick == null || id == null) { // 로그인 X
%>
        	<p><input type="button" value="도움되었습니다" onclick="login_no()"></p>  
<%
      } else if (session_user_like == 1) { // 이미 누른 전적이 있는 유저 
%>
			<p><input type="button" value="도움되었습니다" onclick="like_no()" class="like_on"></p>     	  
<%
      } else {
%>
    	<p><input type="button" value="도움되었습니다" onclick="location.href='reviewLike_ok.jsp?re_no=<%= re_no %>'"></p>  
<%
      }
%>
      <p><%= board.getUser_nick() %></p>
    </div>
    <div class="review_content">
      <p><%= board.getRe_content() %></p>
      <div class="review_img">
        <img src="<%= real %>">
      </div>
    </div>
    <div id="list_btn">
      <input type="button" value="목록으로 돌아가기" onclick="location.href='company_page.jsp?name=<%= HanConv.toKorTwo(board.getCom_name()) %>'">
    </div>
  </div>
  
  <jsp:include page="../headerfooter/footer.jsp"/>
</body>
</html>