<%@page import="java.util.ArrayList"%>
<%@page import="trade.TradeBoardDTO"%>
<%@page import="trade.TradeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String tr_user_nick = "";
	if (request.getParameter("tr_user_nick") != null) {
		tr_user_nick = request.getParameter("tr_user_nick");
	}
	String pageNum = request.getParameter("pageNum");
	int tr_b_id = Integer.parseInt(request.getParameter("tr_board_id"));
	
	TradeBoardDAO dao = TradeBoardDAO.getInstance();
	TradeBoardDTO dto = dao.getTradeBoard(tr_b_id,false);
	int tr_board_id=0, tr_board_count=0;
	String tr_board_title="", tr_board_content="", tr_board_pw="";
	if(dto != null){
		tr_board_id = dto.getTr_board_id();
		tr_user_nick = dto.getTr_user_nick();
		tr_board_title = dto.getTr_board_title();
		tr_board_content = dto.getTr_board_content();
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
        <div id="edit">
            <form action="tr_board_edit_ok.jsp?tr_user_nick=<%=tr_user_nick %>&tr_board_id=<%=tr_board_id %>" method="post" name="form">
              <p><span>자유게시판</span> 글수정하기</p>
              <table>
                <tr>
                  <td>
                    <input class="board_title" name="tr_b_title" type="text" value="<%=tr_board_title %>" />
                  </td>
                </tr>
                <tr>
                  <td>
                    <textarea name="tr_b_content" ><%=tr_board_content %>
                  </textarea>
                  </td>
                </tr>
                <tr>
                  <td>
                      <label for="tr_b_pw">암호 :   </label>
                      <input type="password" name="tr_b_pw">
                  </td>
                </tr>
                <tr>
                  <td>
                    <input type="button" value="수정하기" onclick="write_ok()">
                    <input type="reset" value="다시작성">
                  </td>
                </tr>
              </table>
            </form>
        </div>
      </content>
    </center>
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>