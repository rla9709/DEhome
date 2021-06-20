<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="customer.QnaBoardDTO"%>
<%@page import="customer.QnaBoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String qna_user_nick = "";
	if (request.getParameter("qna_user_nick") != null) {
		qna_user_nick = request.getParameter("qna_user_nick");
	}
	int qna_id = Integer.parseInt(request.getParameter("qna_id"));
	String pageNum = request.getParameter("pageNum");
	
	QnaBoardDAO dao = QnaBoardDAO.getInstance();
	QnaBoardDTO dto = dao.getQnaBoard(qna_id,false);
	int qna_count=0;
	String qna_title="", qna_content="", qna_pw="", qna_type ="", qna_process="";
	Timestamp qna_date=null;
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd hh:mm");
	if(dto != null){
		qna_id = dto.getQna_id();
    	qna_user_nick = dto.getQna_user_nick();
    	qna_title = dto.getQna_title();
    	qna_content = dto.getQna_content();
    	qna_count = dto.getQna_count();
    	qna_date = dto.getQna_date();
    	qna_type = dto.getQna_type();
    	qna_pw = dto.getQna_pw();
    	qna_process = dto.getQna_process();
	}
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <link rel="stylesheet" href="../css/qna_board.css" />
</head>
<body>

<%@include file="../headerfooter/header.jsp" %>
    <!-- --------------------- 컨텐츠 시작 ---------------------- -->
      <center>
      <content>
        <div id="edit">
            <form action="qna_edit_ok.jsp?qna_user_nick=<%=qna_user_nick %>&qna_id=<%=qna_id %>" method="post" name="form">
              <input type="hidden" name="qna_process" value="processing">
              <p><span>QnA</span> 글수정하기</p>
              <table>
                <tr>
                  <td>
                    <input class="board_title" name="qna_title" type="text" value="<%=qna_title %>" />
                  </td>
                </tr>
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
                    <textarea name="qna_content" ><%=qna_content %>
                  </textarea>
                  </td>
                </tr>
                <tr>
                  <td>
                      <label for="qna_pw">암호 :   </label>
                      <input type="password" name="qna_pw">
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