<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna_list.jsp</title>
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
<content>
    <center> 	
        <div id="qna_board">
            <div id="board_title">
                Notice
                <input type="button" value="글쓰기" onclick="location.href='not_write'">
            </div>

            <table id="table" width="800" cellspacing="0" >
                <tr class="table_top">
                    <td width="40" align="center" >번호</td>
                    <td width="120" align="center" >공지사항종류</td>
                    <td width="450" align="center" >제목</td>
                    <td width="60" align="center" >관리자명</td>
                    <td width="170" align="center" >날짜</td>
                    <td width="60" align="center" >조회수</td>
                </tr>
                <c:forEach var="row" items="${not_list}">
                	<tr bgcolor="#f7f7f7" 
                		onmouseover="this.style.backgroundColor='#eeeeef'" 
						onmouseout="this.style.backgroundColor='#f7f7f7'">
						<td>
							${row.not_no}
						</td>
						<td>
							${row.not_menu }
						</td>
						<td>
							<a href="../customer/not_show?not_no=${row.not_no}">
								${row.not_title}
							</a>
						</td>
						<td>
							${row.user_nick }
						</td>
						<td align="center">
							${row.not_date}
						</td>
                		<td>
                			${row.not_count}
                		</td>
                	</tr>
                </c:forEach>
            </table>
        </div>
    </center>
</content>
<%@include file="../headerfooter/footer.jsp" %>


</body>
</html>