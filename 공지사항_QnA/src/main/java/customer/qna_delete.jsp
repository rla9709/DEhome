<%@page import="customer.QnaBoardDTO"%>
<%@page import="customer.QnaBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
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
	QnaBoardDTO dto = dao.getQnaBoard(qna_id,true);
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
    <link rel="stylesheet" href="../css/qna.css" />
</head>
<body>
<%@include file="../headerfooter/header.jsp" %>
    <!-- --------------------- 컨텐츠 시작 ---------------------- -->
     <center>
    <content>
      <form id="delete" method="post" name="delete_form"
      		action="qna_delete_ok.jsp?qna_user_nick=<%=qna_user_nick %>&qna_id=<%= qna_id %>&pageNum=<%=pageNum%>">
        <div class="delete_head">
          <p>QnA</p>
          <p><%= sdf.format(qna_date) %></p>
        </div>
        <div>
          <table>
            <tr>
              <td>
                <p><%=qna_title %></p>
                <p>조회수  <span><%=qna_count %></span></p>
                <p><%=qna_user_nick %></p>
              </td>
            </tr>
            <tr>
              <td>
                <%=qna_content %>
              </td>
            </tr>
            <tr>
              <td>
                  <label for="qna_pw">암호 :   </label>
                  <input type="password" name="qna_pw">
              </td>
            </tr>
            <tr>
              <td class="">
                <input type="button" value="목록으로"
                		onclick="location.href='qna_list.jsp?pageNum=<%= pageNum %>'" >
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