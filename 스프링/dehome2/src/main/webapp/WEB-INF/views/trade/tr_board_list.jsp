<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder" %>
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
<body>
</head>
<%--
request.setCharacterEncoding("UTF-8");

	String tr_user_nick = "";
	if (request.getParameter("tr_user_nick") != null) {
		tr_user_nick = request.getParameter("tr_user_nick");
	}
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum= "1";
	}
	TBDAO_ dao = TBDAO_.getInstance();
	ArrayList<TradeBoardDTO> tradeBoardList = dao.tradeBoardList(pageNum);
	
	int tr_board_id,tr_board_count = 0;
	String tr_board_title, tr_board_content, tr_board_pw;
	Timestamp tr_board_date;
	SimpleDateFormat sdf=new SimpleDateFormat("yy/MM/dd hh:mm");
--%>
<%
	String num = request.getParameter("num");
	if(num == null){
		num= "1";
	}
%>
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
  
    

    <!-- --------------------- 컨텐츠 시작 ---------------------- -->

<center>
    <div id="trade_board">
         <div id="board_title">
                자유게시판
         <c:choose>

			<c:when test = "${nickname eq null}">
				<input type="button" value="글쓰기" onclick="no()">
			</c:when>
			
			<c:otherwise>
				<input type="button" value="글쓰기" onclick="location.href='tr_board_write&pageNum=${ pageNum }'">
			</c:otherwise>
		</c:choose>
      	</div>
           <table id="table" width="800" cellspacing="0" >
               <tr class="table_top">
                   <td width="40" align="center" >번호</td>
                   <td width="450" align="center" >제목</td>
                   <td width="120" align="center" >작성자</td>
                   <td width="170" align="center" >날짜</td>
                   <td width="60" align="center" >조회수</td>
               </tr>
               <c:forEach items="${list }" var="list" varStatus="status">
               	<tr bgcolor="#f7f7f7" 
               		onmouseover="this.style.backgroundColor='#eeeeef'" 
					onmouseout="this.style.backgroundColor='#f7f7f7'">
               		<td> ${list.board_id }</td>
               		
               		<td>
                		<a href="tr_board_show?user_nick=${list.user_nick }&board_id=${list.board_id }&board_pagenum=${list.board_pagenum }">
							${list.board_title }
							
						</a>
					</td>
               		<td>${list.user_nick }</td>
               		<td><fmt:formatDate value="${ list.board_date }" pattern="yy/MM/dd HH:mm" /></td>
               		<td>${list.board_count}</td>
               </c:forEach>
               
           </table>
        </div>
    </center>
  <div>
   <center id="pagenum">
	    <c:forEach begin="${start}" end="${end}" step="1" var="i">
	        <a href="/searchBoard?limit=${limit}&pageNum=${i}">${i}</a>
	    </c:forEach>
	</center>
<%-- 
<content>
    <center>
        <div id="trade_board">
            <div id="board_title">
                자유게시판
            <%
            	if(nick == null){
           	%>
                <input type="button" value="글쓰기" onclick="no()">
            <%
            	}else{
            %>
                <input type="button" value="글쓰기" onclick="location.href='tr_board_write.jsp?&pageNum=<%= pageNum %>'">
			<%
            	}
			%>            		
            </div>

            <table id="table" width="800" cellspacing="0" >
                <tr class="table_top">
                    <td width="40" align="center" >번호</td>
                    <td width="450" align="center" >제목</td>
                    <td width="120" align="center" >작성자</td>
                    <td width="170" align="center" >날짜</td>
                    <td width="60" align="center" >조회수</td>
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
                	
                	 //java.net.URLEncoder.encode(ch2, "utf-8"); 
                %>
                	<tr bgcolor="#f7f7f7" 
                		onmouseover="this.style.backgroundColor='#eeeeef'" 
						onmouseout="this.style.backgroundColor='#f7f7f7'">
						<td>
							<%=tr_board_id %>
						</td>
						<td>
							<a href="tr_board_show.jsp?tr_user_nick=<%= java.net.URLEncoder.encode(tr_user_nick, "utf-8") %>&tr_board_id=<%= tr_board_id%>&pageNum=<%=pageNum%>">
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
        </div>
    </center>
    <center id="pagenum">
	<%=TradeBoardDTO.pageNumber(4) %>
	</center>
</content>--%>
<%@include file="../headerfooter/footer.jsp" %>


</body>
</html>