<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="trade.TradeBoardDTO"%>
<%@page import="trade.TradeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="../css/login.css" />
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/trade_board.css" />

</head>
<body>
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
	ArrayList<TradeBoardDTO> tradeBoardList = dao.tradeBoardList(pageNum);
	
	int tr_board_id,tr_board_count = 0;
	String tr_board_title, tr_board_content, tr_board_pw;
	Timestamp tr_board_date;
	SimpleDateFormat sdf=new SimpleDateFormat("yy/MM/dd hh:mm");
	
%>
<%@include file="../headerfooter/header.jsp" %>
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
                	
                %>
                	<tr bgcolor="#f7f7f7" 
                		onmouseover="this.style.backgroundColor='#eeeeef'" 
						onmouseout="this.style.backgroundColor='#f7f7f7'">
						<td>
							<%=tr_board_id %>
						</td>
						<td>
							<a href="tr_board_show.jsp?tr_user_nick=<%=tr_user_nick %>&tr_board_id=<%= tr_board_id%>&pageNum=<%=pageNum%>">
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
</content>
<%@include file="../headerfooter/footer.jsp" %>


</body>
</html>