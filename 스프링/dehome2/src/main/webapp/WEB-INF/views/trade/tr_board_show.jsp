<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.HttpCookie"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@include file="../headerfooter/header.jsp" %>

<script type="text/javascript" src="${path }/resources/js/tr_board.js" charset="utf-8"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
  	<link rel="stylesheet" href="${path }/resources/css/header_footer.css" />
    <link rel="stylesheet" href="${path }/resources/css/login.css" />
    <link rel="stylesheet" href="${path }/resources/css/reset.css" />
    <link rel="stylesheet" href="${path }/resources/css/trade_board.css" />

<%--
	request.setCharacterEncoding("UTF-8");

	String pageNum = request.getParameter("pageNum");

	String tr_user_nick = "";
	if (request.getParameter("tr_user_nick") != null) {
		tr_user_nick = request.getParameter("tr_user_nick");
	}
	
	int tr_b_id = Integer.parseInt(request.getParameter("tr_board_id"));

	
	TradeBoardDAO dao = TradeBoardDAO.getInstance();
	
	//dao.hitTradeBoard(tr_b_id, hitUp);
	
	
	boolean hitUp= false;
	if(tr_user_nick.equals(nick)){
		hitUp = true;
	}else{
		hitUp  = false;
	}
	System.out.println("내 닉 : "+nick);
	System.out.println("작성자 : "+tr_user_nick);
	System.out.println("t/f : "+tr_user_nick.equals(nick));
	System.out.println("hitUp : "+hitUp);
	--%>
	

	<%--
	Cookie[] cookies = request.getCookies();
	Cookie viewCookie = null;
	
	if (cookies != null && cookies.length > 0) {
 	    for (int i = 0; i < cookies.length; i++){
 	    	System.out.println("쿠키이름 : "+cookies[i].getName());
            if (cookies[i].getName().equals("|"+tr_b_id+"|")){ 
                //int limitTime = 60*60*24;
               viewCookie = cookies[i];
               //viewCookie.setMaxAge(limitTime);
            }
 	    }
 	}
	
	if (viewCookie == null) {
		System.out.println("쿠키 없음");
		Cookie cookieNew = new Cookie("|"+tr_b_id+"|", tr_b_id+"");
		if(!tr_user_nick.equals(nick)){
			cookieNew.setMaxAge(60*60*24);
			response.addCookie(cookieNew);
			dao.hitTradeBoard(tr_b_id);
			
		}
	}
	
	
	 --%>
	 <%--

out.println("현재 쿠키 갯수 "+cookies.length);
out.println("<br><hr>");


if(cookies != null){
	for(int i = 0; i<cookies.length; i++){
		out.println(i + "번째 쿠키" + cookies[i].getName()+ "삭제 <br>");
		cookies[i].setMaxAge(0);
		response.addCookie(cookies[i]);
	}
}
--%>
	<%--
	
	TradeBoardDTO dto = dao.getTradeBoard(tr_b_id, hitUp);
	
	int tr_board_id=0, tr_board_count=0;
	String tr_board_title="", tr_board_content="", tr_board_pw="";
	Timestamp tr_board_date=null;
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd hh:mm");
	
	
	if(dto != null){
		tr_board_id = dto.getTr_board_id();
		tr_user_nick = dto.getTr_user_nick();
		tr_board_title = dto.getTr_board_title();
		tr_board_content = dto.getTr_board_content();
		tr_board_content = tr_board_content.replace("\r\n", "<br>");
		tr_board_date = dto.getTr_board_date();
		tr_board_count = dto.getTr_board_count();
	}
	--%>
	
    <fmt:formatDate  var="board_date" value="${ show.board_date }" pattern="yy/MM/dd HH:mm" />

    <!-- --------------------- 컨텐츠 시작 ---------------------- -->
     <center>
    <content>
      <div id="show">
        <div class="show_head">
          <p>자유게시판</p>
          <p>${board_date }</p>
        </div>
        <div>
          <table>
            <tr>
              <td>
                <p>${show.board_title }</p>
                <p>조회수  <span>${show.board_count }</span></p>
                <p>${show.user_nick }</p>
              </td>
            </tr>
            <tr>
              <td>
                ${show.board_content }
              </td>
            </tr>
            <tr>
              <td class="">
		         <input type="button" value="목록으로"
			                		onclick="location.href='tr_board_list?board_pagenum=${show.board_pagenum }'" >
			                <input type="button" value="수정하기" 
			                		onclick="location.href='tr_board_edit?board_id=${show.board_id }&board_pagenum=${show.board_pagenum }'">
			                <input type="button" value="삭제하기"
			                		onclick="location.href='tr_board_delete?board_id=${show.board_id }&board_pagenum=${show.board_pagenum }'">
              </td>
            </tr>
          </table>
        </div>
      </div>
    </content>
  </center>
  
  
  <%--
  //나중에 추가하기!!!!!!!--
  <c:choose>
		
					<c:when test = "${nickname eq null}">
						    <input type="button" value="목록으로"
			                		onclick="location.href='tr_board_list.jsp?board_pagenum=${show.board_pagenum }'" >
					</c:when>
					<c:when test = "${nickname eq show.user_nick}">
			                <input type="button" value="목록으로"
			                		onclick="location.href='tr_board_list?board_pagenum=${show.board_pagenum }'" >
			                <input type="button" value="수정하기" 
			                		onclick="location.href='tr_board_edit?board_id=${show.board_id }&board_pagenum=${show.board_pagenum }'">
			                <input type="button" value="삭제하기"
			                		onclick="location.href='tr_board_delete?board_id=${show.board_id }&board_pagenum=${show.board_pagenum }'">
					</c:when>
					
					<c:otherwise>
						    <input type="button" value="목록으로"
			                		onclick="location.href='tr_board_list?board_pagenum=${show.board_pagenum }'" >
					</c:otherwise>
				</c:choose>
     <center>
    <content>
      <div id="show">
        <div class="show_head">
          <p>자유게시판</p>
          <p><%= sdf.format(tr_board_date) %></p>
        </div>
        <div>
          <table>
            <tr>
              <td>
                <p><%=tr_board_title %></p>
                <p>조회수  <span><%=tr_board_count %></span></p>
                <p><%=tr_user_nick %></p>
              </td>
            </tr>
            <tr>
              <td>
                <%=tr_board_content %>
              </td>
            </tr>
            <tr>
              <td class="">
              <%
              	if(nick.equals(tr_user_nick)){
              %>
	                <input type="button" value="목록으로"
	                		onclick="location.href='tr_board_list.jsp?pageNum=<%= pageNum %>'" >
	                <input type="button" value="수정하기" 
	                		onclick="location.href='tr_board_edit.jsp?tr_board_id=<%= tr_board_id %>&pageNum=<%=pageNum%>'">
	                <input type="button" value="삭제하기"
	                		onclick="location.href='tr_board_delete.jsp?tr_board_id=<%= tr_board_id %>&pageNum=<%=pageNum%>'">
              <%		
              	}else{
              %>
	                <input type="button" value="목록으로"
	                		onclick="location.href='tr_board_list.jsp?pageNum=<%= pageNum %>'" >
              <%
              	}
              %>
              
              </td>
            </tr>
          </table>
        </div>
      </div>
    </content>
  </center>--%>
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>