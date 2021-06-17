<%@page import="myUtil.HanConv"%>
<%@page import="interior.InteriorComPageDAO"%>
<%@page import="interior.InteriorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//utf8 인코딩
	request.setCharacterEncoding("utf-8");
	
	/*--해당 업체 이름 받기--*/
	InteriorComPageDAO dao = InteriorComPageDAO.getinstance();
	String com_name = request.getParameter("name");
	
	/*--업체정보 가지고 오기--*/
	InteriorDTO companyBoard = dao.company(com_name);
	
	/*--업체리뷰 수 가지고 오기--*/
	int reviewCount = dao.reviewCount(com_name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" type="../image⁄x-icon" href="images/x-icon.png" />
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/interior.css" />
<script type="text/javascript" src="../js/review.js" charset="utf-8"></script>
</head>
<body>
	<%@include file="../headerfooter/header.jsp"%>
    <!--컨텐츠 시작부분-->

    <div id="company_page">
      <img src="images/room_04.jpg" />
      <div class="company_top_box"></div>
      <div class="company_top">
        <p><%= com_name %></p>
        <div class="company_star">
        <%
        	float rating = companyBoard.getIn_com_rating();
        	int fullStar = (int)rating;
        	int emptyStar = 5 - fullStar;
        	
        	for(int i = 0; i < fullStar; i++) { // 앞자리만큼 꽉찬별
        %>
        		<img src="../images/star_green.png" />
        <%
        	}
        	
        	for(int j = 0; j < emptyStar; j++) { // 남는자리만큼 빈별
        %>
        		<img src="../images/star_yellow.png" />
        <%
        	}
        
        %>
          <span><%= rating %></span>
        </div>
        <p><%= companyBoard.getIn_com_title() %></p>
        <p><%= companyBoard.getIn_com_content() %></p>
        <p>
          <span>
            업체 리뷰 <span class="font_green font_bolder"><%= reviewCount %>건</span>
          </span>
          <span>
            최근 계약 <span class="font_green font_bolder"><%= companyBoard.getIn_com_contract() %>건</span>
          </span>
        </p>
        <div class="company_btn">
        <%
        	if(id == null || nick == null || id.equals("") || nick.equals("")) { // 로그인 X
        %>
        	<input type="button" value="상담신청" onclick="login_no()" />
          	<input type="button" value="리뷰작성" onclick="login_no()" />	
        <%
        	} else { // 로그인 O
        		
        		if(user_com_name != null && user_com_name.equals(com_name)) { // 해당 업체가 로그인 했을 시
        %>
        			<input type="button" value="시공사례 작성" class="oneBtn" onclick="location.href='cons_case_write.jsp?com_name=<%= HanConv.toKorTwo(com_name) %>'" />
       	<%
        			
        		} else if (id.equals("admin1") || id.equals("admin2") || id.equals("admin3")) { // 매니저 로그인 시
        %>
        			<input type="button" value="업체정보 수정" class="oneBtn" onclick="location.href='edit_com.jsp?com_name=<%= HanConv.toKorTwo(com_name) %>'" />
       	<%
        		} else { // 일반 사용자 로그인
        %>
        			<input type="button" value="상담신청" />
					<input
					  type="button"
					  value="리뷰작성"
					  onclick="location.href='review_write.jsp?com_name=<%= HanConv.toKorTwo(com_name) %>'"
					/>
        <%
        		}
        	}
        %>
        </div>
      </div>
    </div>

    <div id="company_title">
      <!-- <input type="button" value="더보기"> -->
      <p>
        <span class="font_green">시공리뷰</span> 리뷰로 찾는 나만의 시공업체
      </p>
      <p>
        DE:home은 보다 객관적인 시공업체 판단을 위해 고객의 모든 리뷰를 투명하게
        공유합니다
      </p>
    </div>
    <div id="review_content">
    <table id="review_content">
    <tr>
    <%
    	// 업체이름 com_name
    	ArrayList<InteriorDTO> reviewList = dao.reviewList(com_name);
    	for (int i = 1; i <= reviewList.size(); i++) {
    		InteriorDTO reviewdto = reviewList.get(i - 1);
    		int re_no = reviewdto.getRe_no(); // 리뷰 번호
    		/*--해당 리뷰 좋아요 수--*/
    		int interestCount = dao.interestCount(re_no);
%>
		
			<td>
				<a href="review_show.jsp?re_no=<%= re_no %>">
					<div class="recon_01">
		          <p class="like">
		          	<input type="button" value="<%= interestCount %>번 도움됨">
		            <span><%= reviewdto.getUser_nick() %></span>
		          </p>
		          <p><%= reviewdto.getRe_content() %></p>
		          <img src="../images/room_02.jpg" />
		        </div>
		      </a>
        	</td>
      				
      <%
	      	if (i != 0 && i % 2 == 0) {
	      		%>
	      		</tr>
	      		<tr>
	      		<%	
	      	}
      
      	}
      %>
      	</tr>
    </table>
      <div id="move_btn2">
        <input type="button" value="더보기" />
      </div>
    </div>

    <div id="company_title">
      <!-- <input type="button" value="더보기"> -->
      <p><span class="font_green">시공사례</span> 해당 시공업체의 대표작업들</p>
      <p>
	        해당 시공업체의 대표적인 작업들을 확인하고 상담신청으로 시공업체와
	        컨텍까지 가능합니다
      </p>
    </div>
    <div id="company_work">
      <table>
        <tr>
<%
    	ArrayList<InteriorDTO> list = dao.consCaseList(com_name);
    	for(int i = 1; i <= list.size(); i++) {
    		InteriorDTO dto = list.get(i - 1);
    		int ex_no = dto.getIn_ex_no();
    		String photo = dto.getIn_ex_file(); //이미지 파일 경로
    		String title = dto.getIn_ex_title();
%>
          <td>
            <a href="../interior/cons_case.jsp?ex_no=<%=ex_no%>">
              <div>
                <img src="<%=photo %>" />
              </div>
              <p><%= title%></p>
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
    </div>
      <div id="move_btn2">
        <input type="button" value="더보기" />
      </div>
    </div>
	<%@include file="../headerfooter/footer.jsp"%>
</body>
</html>