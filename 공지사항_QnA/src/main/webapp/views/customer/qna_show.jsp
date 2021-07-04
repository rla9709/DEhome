<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna_show.jsp</title>
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
          <p>QnA</p>
        </div>
        <div>
          <table>
            <tr>
              <td>
                <p>${qna_title}</p>
                <p>조회수  <span>${qna_count}</span></p>
                <p><fmt:formatDate value="${row.qna_date}" pattern="yyyy-MM-dd"/></p>
              </td>
            </tr>
            <tr>
              <td>
                ${qna_content}
              </td>
            </tr>
            <tr>
              <td class="">
                <input type="button" value="목록으로"
                		onclick="location.href='qna_list'" >
                <input type="button" value="수정하기" 
                		onclick="location.href='qna_modify'">
                <input type="button" value="삭제하기"
                		onclick="location.href='qna_delete'">
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