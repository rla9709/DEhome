<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="trade.TradeBoardDTO"%>
<%@page import="trade.TradeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


request.setCharacterEncoding("UTF-8");

	String pageNum = request.getParameter("pageNum");
	String tr_user_nick = "";
	if (request.getParameter("tr_user_nick") != null) {
		tr_user_nick = request.getParameter("tr_user_nick");
	}
	int tr_b_id = Integer.parseInt(request.getParameter("tr_board_id"));
	
	TradeBoardDAO dao = TradeBoardDAO.getInstance();
	TradeBoardDTO dto = dao.getTradeBoard(tr_b_id,true);
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
	
%>
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
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/trade_board.css" />
</head>
<body>
<%@include file="../headerfooter/header.jsp" %>
    <!-- --------------------- 컨텐츠 시작 ---------------------- -->
     <center>
    <content>
      <form id="delete" method="post" name="delete_form"
      		action="tr_board_delete_ok.jsp?tr_user_nick=<%=tr_user_nick %>&tr_board_id=<%= tr_board_id %>&pageNum=<%=pageNum%>">
        <div class="delete_head">
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
              <td>
                  <label for="tr_b_pw">암호 :   </label>
                  <input type="password" name="tr_b_pw">
              </td>
            </tr>
            <tr>
              <td class="">
                <input type="button" value="목록으로"
                		onclick="location.href='tr_board_list.jsp?pageNum=<%= pageNum %>'" >
                <input type="button" value="삭제하기"
                		onclick="delete_ok()">
              </td>
            </tr>
          </table>
        </div>
      </form>
    </content>
  </center>
<%@include file="../headerfooter/footer.jsp" %>

</body>
</html>