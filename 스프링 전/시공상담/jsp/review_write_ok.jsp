<%@page import="myUtil.HanConv"%>
<%@page import="interior.InteriorReviewDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto" class="interior.InteriorReviewDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	/*--COM_NAME(업체명) 설정--*/
	String com_name = "업체명";
	if (request.getParameter("com_name") != null) {
		com_name = request.getParameter("com_name");
	}
	dto.setCom_name(com_name);
	
	/*--USER_NICK(회원 닉네임) 설정--*/
	String session_nick = (String)session.getAttribute("nick");
	dto.setUser_nick(session_nick);

	/*--RE_DATE(작성일자) 설정--*/
	dto.setRe_date(new Timestamp(System.currentTimeMillis()));
	
	/*--리뷰작성 insert--*/
	InteriorReviewDAO dao = InteriorReviewDAO.getinstance();
	int re = 0;
	re = dao.insertReiview(dto);
	
	if(re == -1) {
%>
		<script type="text/javascript">
			alert("글 등록에 실패하였습니다.");
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