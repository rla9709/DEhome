<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	int qna_id = 0;
	
	if(request.getParameter("qna_id") != null){
		qna_id = Integer.parseInt(request.getParameter("qna_id"));
	}else{
		qna_id = 1;
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="../js/qna.js" charset="utf-8"></script>
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
            <form action="qna_write_ok.jsp?" method="post" name="form">
            <input type="hidden" name="qna_id" value="<%=qna_id%>">
            <input type="hidden" name="qna_process" value="processing">  
              <p><span>QnA</span> 글쓰기</p>
              <table>
                <tr>
                  <td>
                    <input class="board_title" name="qna_title" type="text" placeholder="제목을 작성해주세요" />
                  </td>
                  <tr>
	                <td>
	                	<select name="qna_type" class="qna_type">
			              <option value="usedtrade" selected>중고거래</option>
			              <option value="interrior">인테리어</option>
			              <option value="membership">회원관련</option>
			            </select>
	                </td>
                </tr>  
                <tr>
                  <td>
                    <textarea name="qna_content" placeholder="내용을 작성헤주세요">
                  </textarea>
                  </td>
                </tr>
                <tr>
                  <td>
                      <label for="tr_b_pw">암호 :   </label>
                      <input type="password" name="qna_pw">
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