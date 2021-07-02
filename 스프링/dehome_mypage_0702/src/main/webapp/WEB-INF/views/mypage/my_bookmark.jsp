<%@page import="interior.InteriorTipDAO"%>
<%@page import="interior.InteriorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
    <link rel="stylesheet" href="../css/my_interior_tip.css" />
<title>Insert title here</title>
<%
    	//utf8 인코딩
    	request.setCharacterEncoding("utf-8");
     
    	InteriorTipDAO in_dao = InteriorTipDAO.getInstance();
%>
</head>
<body>
<%@include file ="../headerfooter/header.jsp" %>
	<div class="contents_mypage"> 
          <h2 class="page_title">MY PAGE</h2>         
          <div class="mypage_header_box">
            <p class="my_page_label">${ nick }님 안녕하세요</p>
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
              		<li><a href="my_qna.jsp">QNA</a></li>
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
          <!-- 콘텐트 시작  -->
	  		<!--인테리어 TIP-->
      <div id="my_interior_tip_list">
	      <div class="my_tip_content">
	        <div class="my_tip_title">
	          <p>내가 북마크한 인테리어 TIP</p>
	        </div>
<%
		ArrayList<InteriorDTO> in_list = in_dao.myBookmarkTipList(nick);
		
		for(int i = 0; i < in_list.size(); i++) {
			InteriorDTO dto = in_list.get(i);
			int tip_no = dto.getTip_no();
			String title = dto.getTip_title(); // 글제목
			String photo = dto.getTip_file(); 
			int count = dto.getTip_count(); // 조회수
			int bookmark = dto.getTip_bookmark();
			String writer = dto.getTip_user_nick();
			String category = dto.getTip_category();
			
			pageContext.setAttribute("tip_no", tip_no);
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("count", count);
			pageContext.setAttribute("bookmark", bookmark);
			pageContext.setAttribute("writer", writer);
			pageContext.setAttribute("category", category);
%>
            <a href="../interior/tip_page.jsp?tip_no=${tip_no}&category=${category}">
	          <div class="my_tipcon_box">
              	<div id="my_tipcon_img">
                  <img src="${photo}" />
	            </div>
                  <input type="button" >
                  <p>${title}</p>
                  <p>
                                     조회수 
                    <span class="my_font_green">${count}</span> 
                    · 스크랩 
                    <span class="my_font_green">${bookmark}</span>
                  </p>
              </div>
            </a>
<%
		}
%>          
		</div>
	</div>
 </div>
<%@include file ="../headerfooter/footer.jsp" %>
</body>
</html>