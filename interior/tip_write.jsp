<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 파일업로드 위한 라이브러리 임포트 -->
<%@ page import="interior.InteriorTipDAO" %>
<%@ page import="java.io.File" %>

<!-- 파일 이름이 동일한게 나오면 자동으로 다른걸로 바꿔 주는것 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<!-- 실제로 파일 업로드 하기 위한 클래스 -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<% 
	//utf8 인코딩
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>팁 작성</title>
	<link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" type="image⁄x-icon" href="../images/x-icon.png" />
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/interior_write.css" />
    
    <script type="text/javascript" src="../js/tip.js" charset="utf-8"></script>
</head>
<body>
<%@include file="../headerfooter/header.jsp" %>  
	<div id="write_title">
      <p>인테리어 팁 작성</p>
      <p>나만의 인테리어 팁을 모두에게 공유해보세요</p>
    </div>
    <form name="tip_write_frm" action="tip_write_ok.jsp" method="get" enctype="multipart/form-data">
	    <div id="write_content">
	      <div class="write_select">
	        <select name="tip_category">
	          <option value="construct">시공</option>
	          <option value="decorate">꾸미기 팁</option>
	          <option value="diy">DIY</option>
	          <option value="kitchen">주방/욕실</option>
	          <option value="storage">수납</option>
	          <option value="cleaning">청소</option>
	          <option value="reform">리폼</option>
	          <option value="lighting">전기/조명</option>
	        </select>
	        <input type="text" name="tip_title" placeholder="제목을 작성해주세요" />
	      </div>
	      <div class="write_file">
	        <input multiple="multiple" type="file" name="tip_file" />
	      </div>
	      <textarea name="tip_content" placeholder="나만의 인테리어 팁을 작성해주세요"></textarea>
	    </div>
	    <div id="write_btn" >
	      <input type="button" value="작성완료" onclick="tip_write_check()" />
	      <input type="reset" value="다시작성" />
	    </div>
    </form>
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>