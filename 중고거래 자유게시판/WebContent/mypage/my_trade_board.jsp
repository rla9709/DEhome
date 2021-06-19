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
<script type="text/javascript" src="../js/tr_board.js" charset="utf-8"></script>
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
	TradeBoardDAO dao = TradeBoardDAO.getInstance();
	ArrayList<TradeBoardDTO> tradeBoardList = dao.myTradeBoardList(nick, pageNum);
	
	int tr_board_id,tr_board_count = 0;
	String tr_board_title, tr_board_content, tr_board_pw;
	Timestamp tr_board_date;
	SimpleDateFormat sdf=new SimpleDateFormat("yy/MM/dd hh:mm");
	
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
        <div id="trade_board">
            <div id="board_title">
                자유게시판 </div>
            <%
            	if(nick == null){
           	%>
                <input type="button" value="글쓰기" onclick="no()">
            <%
            	}else{
            %>
                <input type="button" value="글쓰기" onclick="location.href='../trade/tr_board_write.jsp?&pageNum=<%=pageNum%>'">
			<%
            	}
			%>            		
           

            <table id="table" width="650" cellspacing="0" >
                <tr class="table_top">
                    <td width="40" align="center" >번호</td>
                    <td width="360" align="center" >제목</td>
                    <td width="100" align="center" >작성자</td>
                    <td width="110" align="center" >날짜</td>
                    <td width="40" align="center" >조회수</td>
                </tr>
                <%
                for(int i = 0; i< tradeBoardList.size(); i++){
                	TradeBoardDTO dto = tradeBoardList.get(i);
                	tr_board_id = dto.getTr_board_id();
                	tr_user_nick = dto.getTr_user_nick();
                	tr_board_title = dto.getTr_board_title();
                	tr_board_content = dto.getTr_board_content();
                	tr_board_date = dto.getTr_board_date();
                	tr_board_count = dto.getTr_board_count();
                	
                %>
                	<tr bgcolor="#f7f7f7" 
                		onmouseover="this.style.backgroundColor='#eeeeef'" 
						onmouseout="this.style.backgroundColor='#f7f7f7'">
						<td>
							<%=tr_board_id %>
						</td>
						<td>
							<a href="../trade/tr_board_show.jsp?tr_user_nick=<%=tr_user_nick %>&tr_board_id=<%= tr_board_id%>&pageNum=<%=pageNum%>">
								<%=tr_board_title %>
							</a>
						</td>
						<td>
							<%=tr_user_nick %>
						</td>
						<td align="center">
							<%= sdf.format(tr_board_date) %>
						</td>
                		<td>
                			<%=tr_board_count %>
                		</td>
                	</tr>
                <%	
                }
                %>
                
            </table>  
            <div id="pagenum">
			<%=TradeBoardDTO.pageNumber(4) %>
			</div>
        </div>

<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>