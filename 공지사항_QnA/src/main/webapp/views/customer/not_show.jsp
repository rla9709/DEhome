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
</head>
<body>
	<jsp:include page="../headerfooter/header.jsp"/>
    <!-- --------------------- 컨텐츠 시작 ---------------------- -->
     <center>
    <content>
      <div id="show">
        <div class="show_head">
          <p>Notice</p>
        </div>
        <div>
          <table>
            <tr>
              <td>
                <p>${not_title}</p>
                <p>조회수  <span>${not_count}</span></p>
                <p>${not_date}</p>
              </td>
            </tr>
            <tr>
              <td>
                ${not_content}
              </td>
            </tr>
            <tr>
              <td class="">
                <input type="button" value="목록으로"
                		onclick="location.href='not_list'" >
                <input type="button" value="수정하기" 
                		onclick="location.href='not_modify'">
                <input type="button" value="삭제하기"
                		onclick="location.href='not_delete'">
              </td>
            </tr>
          </table>
        </div>
      </div>
    </content>
  </center>
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>