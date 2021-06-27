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
</head>
<body>
	<jsp:include page="../headerfooter/header.jsp"/>
<content>
    <center> 	
        <div id="qna_board">
            <div id="board_title">
                QnA
                <button value="글쓰기" onclick="location.href='qna_write.jsp?&pageNum=<%= pageNum %>'">
            </div>

            <table id="table" width="800" cellspacing="0" >
                <tr class="table_top">
                    <td width="40" align="center" >번호</td>
                    <td width="120" align="center" >QnA종류</td>
                    <td width="450" align="center" >제목</td>
                    <td width="60" align="center" >유저닉</td>
                    <td width="170" align="center" >날짜</td>
                    <td width="60" align="center" >조회수</td>
                    <td width="120" align="center" >처리상태</td>
                </tr>
                <c:forEach var="row" items="${list}">
                	<tr bgcolor="#f7f7f7" 
                		onmouseover="this.style.backgroundColor='#eeeeef'" 
						onmouseout="this.style.backgroundColor='#f7f7f7'">
						<td>
							<%=qna_id %>
						</td>
						<td>
							<%	
								String qnatype="";
								if(qna_type.equals("usedtrade")){
									qnatype = "중고거래";
								}else if(qna_type.equals("interrior")){
									qnatype = "인테리어";
								}else if(qna_type.equals("membership")){
									qnatype = "회원관련";
								}
							%>
							<%=qnatype %>
						</td>
						<td>
							<a href="qna_show.jsp?qna_user_nick=<%=qna_user_nick %>&qna_id=<%= qna_id %>&pageNum=<%=pageNum%>">
								<%=qna_title %>
							</a>
						</td>
						<td>
							<%=qna_user_nick %>
						</td>
						<td align="center">
							<fmt:formatDate value="${row.qna_date}" pattern="yy/MM/dd hh:mm"/>
						</td>
                		<td>
                			<%=qna_count %>
                		</td>
                		<td>
                			<%	
                				String qnaprocess = "";
                				if(qna_process.equals("processing")){
                					qnaprocess = "처리중";
                				}else if(qna_process.equals("compelete")){
                					qnaprocess = "답변완료";
                				}
                			%>
                			<%=qnaprocess %>
                		</td>
                	</tr>
                <%	
                }
                %>
                </c:forEach>
            </table>
        </div>
    </center>
    <center id="pagenum">
	<%=QnaBoardDTO.pageNumber(4) %>
	</center>
</content>
<%@include file="../headerfooter/footer.jsp" %>


</body>
</html>