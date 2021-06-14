<%@page import="java.util.ArrayList"%>
<%@page import="trade.TradeBoardDTO"%>
<%@page import="trade.TradeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	int tr_board_id = 0;
	
	if(request.getParameter("tr_board_id") != null){
		tr_board_id = Integer.parseInt(request.getParameter("tr_board_id"));
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
        <div id="write">
            <form action="tr_board_write_ok.jsp?" method="post" name="form">
            <input type="hidden" name="tr_board_id" value="<%=tr_board_id%>">
              <p><span>자유게시판</span> 글쓰기</p>
              <table>
                <tr>
                  <td>
                    <input class="board_title" name="tr_b_title" type="text" placeholder="제목을 작성해주세요" />
                  </td>
                </tr>
                <tr>
                  <td>
                    <textarea name="tr_b_content" placeholder="내용을 작성헤주세요">
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
                    <input type="button" value="작성하기" onclick="write_ok()">
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