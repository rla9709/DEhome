<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet"/>
	<link rel="stylesheet" href="${path }/resources/css/header_footer.css" />
	<link rel="stylesheet" href="${path }/resources/css/my_page.css" />
	<link rel="stylesheet" href="${path }/resources/css/sign_up.css" />
	<link rel="stylesheet" href="${path }/resources/css/reset.css" />
	<link rel="stylesheet" href="${path }/resources/css/qna_board.css" />
	<script type="text/javascript" src="${path }/resources/js/qna_board.js" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="../headerfooter/header.jsp"/>
    <!-- --------------------- 컨텐츠 시작 ---------------------- -->
     <center>
    <content>
      <form id="delete" method="post" name="delete_form"
      		action="qna_delete">
        <div class="delete_head">
          <p>QnA</p>
          <p>${qna_date}</p>
        </div>
        <div>
          <table>
            <tr>
              <td>
                <p>${qna_title}</p>
                <p>조회수  <span>${qna_count}</span></p>
                <p>${qna_user_nick }</p>
              </td>
            </tr>
            <tr>
              <td>
                ${qna_content}
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
                		onclick="location.href='qna_list" >
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