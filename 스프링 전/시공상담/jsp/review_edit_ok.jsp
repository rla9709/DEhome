<%@page import="myUtil.HanConv"%>
<%@page import="interior.InteriorReviewDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	/*--글 번호 받기--*/
	int re_no = 0;
	if (request.getParameter("re_no") != null) {
		re_no = Integer.parseInt(request.getParameter("re_no"));
	}
	/*--회사 이름 받기--*/
	String com_name = "";
	if (request.getParameter("com_name") != null) {
		com_name = request.getParameter("com_name");
	}
	
	/*--글 제목/내용/파일 받기--*/
	String re_title = request.getParameter("re_title");
	String re_content = request.getParameter("re_content");
	String re_file = request.getParameter("re_file");

	
	/*--리뷰수정 update--*/
	InteriorReviewDAO dao = InteriorReviewDAO.getinstance();
	int re = 0;
	re = dao.editReview(re_no, re_title, re_content, re_file);
	
	if(re != 1) {
%>
		<script type="text/javascript">
			alert("글 수정에 실패하였습니다.");
			history.back();
		</script>
<%
	} else {
%>
		<script type="text/javascript">
		location.href= "../interior/company_page.jsp?name=<%= HanConv.toKorTwo(com_name)%>";
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