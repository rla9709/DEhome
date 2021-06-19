<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/mypage.js" charset="utf-8"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"/>
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/my_page.css" />
    <link rel="stylesheet" href="../css/delete_account.css" />
    <link rel="stylesheet" href="../css/reset.css" />
</head>
<body>
<%@include file="../headerfooter/header.jsp" %>


      <div class="contents_mypage">
        <a href="mypage.html"></a><h2 class="page_title">MY PAGE</h2></a>
        <div class="mypage_header_box">
          <p class="my_page_label">${nick }님 안녕하세요</p>
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
              <li class="mypage_side_list_1" style="color: #1B7850"><a href="my_trade_board.jsp">내가 작성한 글 ></a>
              	<ul class="mypage_side_list_2">
              		<li><a href="my_trade_board.jsp">자유게시판</a></li>
              		<li><a href="my_interior_tip.jsp">인테리어 팁</a></li>
              		<li><a href="my_trade_list.jsp">시공리뷰</a></li>
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
        
        
       <!-- -------회원탈퇴 ---------- -->
       
        <div class="contents_box_delete">
          <form action="delete_account_ok.jsp?user_id="<%=id %>" method="POST" name="delete_form">
            <div class="mypage_content_delete_box">
              <p class="mypage_label">회원탈퇴 사유</p>
              <label
                ><input
                  type="radio"
                  name="delete_reason"
                  value="re_sign_up"
                />  탈퇴 후 재가입</label
              >
              <label
                ><input
                  type="radio"
                  name="delete_reason"
                  value="long_absence"
                />  장기간 부재(군입대, 유학 등)</label
              >
              <label
                ><input
                  type="radio"
                  name="delete_reason"
                  value="privacy"
                />  개인정보 누출우려 </label
              ><br /><br /><br />
              <label
                ><input
                  type="radio"
                  name="delete_reason"
                  value="frequency_down"
                />  이용빈도 저하</label
              >
              <label>
              	<input
                  type="radio"
                  name="delete_reason"
                  value="follow_up"
                />  사후조치 불만</label>
              <label>
                <input 
                type="radio" 
                name="delete_reason" 
                value="etc" 
                />  기타 &nbsp;
                <input type="text" height="20px" name="etc_text"/>
              </label>
            </div>
            <div class="delete_account_tip">
              <p>
                - 회원 탈퇴 요청 후, 처리 기간이 일주일 정도 소요됩니다. 양해 부탁드립니다.
              </p>
            </div>
            <div class="delete_account_agree">
              <p>
                <label><input type="checkbox" name="delete" value="delete_agree" />
                회원탈퇴 안내를 모두 확인하였으며 회원 탈퇴에 동의합니다.</label>
              </p>
            </div>
           
            <div class="mypage_content_box_delete" style="border: 0">
              <div>
                <input
                  type="button"
                  value="회원탈퇴"
                  class="delete_account_button"
                  onclick="check_ok()"
                />
              </div>
              <div>
                <input
                  type="button"
                  value="탈퇴취소"
                  class="delete_cancel_button"
                  onclick="location.href='mypage.jsp'"
                />
              </div>
            </div>
          </form>
        </div>
      </div>
    </content>
    
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>