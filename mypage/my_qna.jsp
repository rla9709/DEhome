<%@page import="java.sql.Timestamp"%>
<%@page import="mypage.MypageDTO"%>
<%@page import="mypage.MypageActiveDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	MypageActiveDAO dao = MypageActiveDAO.getInstance();
	MypageDTO dto = new MypageDTO();
	request.setAttribute("dto", dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/my_qna.css">
    <link rel="stylesheet" href="../css/my_page.css">
    <link rel="stylesheet" href="../css/reset.css">
<title>Insert title here</title>
</head>
<body>
<%@include file ="../headerfooter/header.jsp" %>
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
              <li class="mypage_side_list"><a href="my_trade_list.jsp">나의 거래</a></li>
              <li class="mypage_side_list_1" style="color: #1B7850"><a href="#">내가 작성한 글 ></a>
              	<ul class="mypage_side_list_2">
              		<li><a href="#">자유게시판</a></li>
              		<li><a href="my_interior_tip.jsp">인테리어 팁</a></li>
              		<li><a href="#">시공리뷰</a></li>
              		<li><a href="#">QNA</a></li>
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
          <div class="contents_box_my_qna">
            <form action="#" method="POST">
              <div class="ask_table_box">
                <p class="mypage_label">
                  <!-- 추후 qna 페이지 경로 추가예정 -->
                  1:1 문의 <input type="button" value="문의하기" class="ask_button"> 
                </p>
              </div>
              <div class="ask_table_box">
                <form name="search_date" action="#" method="post" >
                  <input type='date' name='start_search_date' class="search_date"> -
                  <input type='date' name='end_search_date' class="search_date">
                  <input type="button" value="조회하기" onclick="" class="refer_button">
                </form>
              </div>
              <div class="ask_box">
                <table>
                  <tr class="ask_table_header">
                    <td style="width: 100px">번호</td>
                    <td style="width: 200px">구분</td>
                    <td style="width: 300px">제목</td>
                    <td style="width: 200px">문의일</td>
                    <td style="width: 200px">처리상태</td>
                  </tr>
                  <%
                  	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
                  	String pageNum = request.getParameter("pageNum");
                  	
                  	if(pageNum == null) {
                  		pageNum = "1";
                  	}
                  	
                  	ArrayList<MypageDTO> list = dao.myqna_list(pageNum, nick);
                  	
                  	for(int i=0; i < list.size(); i++){
                  		dto = list.get(i);
                  		int qna_no = dto.getQna_no();
                  		String qna_type = dto.getQna_type();
                  		String qna_title = dto.getQna_title();
                  		Timestamp qna_date = dto.getQna_date();
                  		String qna_process = dto.getQna_process();
                  		
                  		pageContext.setAttribute("qna_no", qna_no);
            			pageContext.setAttribute("qna_type", qna_type);
            			pageContext.setAttribute("qna_title", qna_title);
            			pageContext.setAttribute("qna_date", qna_date);
            			pageContext.setAttribute("qna_process", qna_process);
                  %>
	                  <tr class="ask_table_content">
	                    <td style="width: 100px"><a href="#">${qna_no}</a></td>
	                    <td style="width: 200px"><a href="#">${qna_type}</a></td>
	                    <td style="width: 300px"><a href="#">${qna_title}</a></td>
	                    <td style="width: 200px"><a href="#">${sdf.format(qna_date)}</a></td>
	                    <td style="width: 200px"><a href="#">${qna_process}</a></td>
	                  </tr>
	             <%
                 	 }
	             %>
                </table>  
                <div class="myqna_paging">${dto.myqna_pageNumber(4)}</div>
              </div>
          	  </form>
             </div>
          </div>
<%@include file ="../headerfooter/footer.jsp" %>
</body>
</html>