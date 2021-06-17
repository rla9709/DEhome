<%@page import="interior.InteriorReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*--세션 유저 받기--*/
	String id = (String)session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");
	
	/*--글 번호 받기--*/
	int re_no = 0;
	if (request.getParameter("re_no") != null) {
		re_no = Integer.parseInt(request.getParameter("re_no"));
	}
	
	/*--리뷰 좋아요 insert(성공 시 1)--*/
	InteriorReviewDAO dao = InteriorReviewDAO.getinstance();
	int re = 0;
	re = dao.insertInterest(re_no, nick);
	
	
	if (re == 1) {
%>
		<script type="text/javascript" charset="utf-8">
			alert("관심 등록을 완료하였습니다.");
			document.location.href = "review_show.jsp?re_no=<%= re_no %>";
		</script>
<%
	} else {
%>
		<script type="text/javascript" charset="utf-8">
			alert("관심 등록에 실패하였습니다.");
			history.go(-1);
		</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>