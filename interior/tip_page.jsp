<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="interior.InteriorDTO"%>
<%@page import="interior.InteriorTipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" type="image⁄x-icon" href="../images/x-icon.png" />
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/reset.css" />

    <link rel="stylesheet" href="../css/interior_tip.css" />
<title>팁 페이지</title> 
<%
 	//utf8 인코딩
 	request.setCharacterEncoding("utf-8");

 	String category = request.getParameter("category");
 	int tip_no = Integer.parseInt(request.getParameter("tip_no"));
 	
 	InteriorTipDAO dao = InteriorTipDAO.getInstance();
 	InteriorDTO dto = dao.getTip(tip_no);
 	
	String title = dto.getTip_title(); // 글제목
	String photo = dto.getTip_file(); 
	int count = dto.getTip_count(); // 조회수
	int bookmark = dto.getTip_bookmark();
	String user_nick = dto.getTip_user_nick();
	
	pageContext.setAttribute("tip_no", tip_no);
	pageContext.setAttribute("title", title);
	pageContext.setAttribute("photo", photo);
	pageContext.setAttribute("count", count);
	pageContext.setAttribute("bookmark", bookmark);
	pageContext.setAttribute("user_nick", user_nick);
	pageContext.setAttribute("category", category);
 	
 	// 작성 일자 처리
 	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
 	String date = sdf.format(dto.getTip_date());
 	
	pageContext.setAttribute("date", date);
 	
 	// textarea 엔터시 줄바꿈적용
 	String content = dao.getTip(tip_no).getTip_content();
 	content = content.replace("\n", "<br/>");
	pageContext.setAttribute("content", content);
 	
 	// 게시글 작성자는 본인 글 조회수 증가 막기위해 로그인한 사람과 작성자를 비교
 	String writer = dao.getTip(tip_no).getTip_user_nick();
 	String logon_nick = (String)session.getAttribute("nick");
 	
 	// 조회수 중복 쿠키
 	Cookie[] cookies = request.getCookies();
 	
 	// 비교하기 위해 새로운 쿠키
 	Cookie viewCookie = null;
 	String sessionNick = (String)session.getAttribute("nick");
 	String tno = request.getParameter("tip_no");
 	
 	// 쿠키가 있을 경우 
 	if (cookies != null && cookies.length > 0) {
 	    for (int i = 0; i < cookies.length; i++){
 	        if (cookies[i].getName().equals("|" + tno + "|") ){ 
 	            viewCookie = cookies[i];
 	        }
 	    }
 	}
 	    // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
 	if (viewCookie == null) {    
 	     // 쿠키 생성(이름, 값) = 해당 번호의 글마다 닉네임을 저장시켜 해당 번호에 닉네임이 없으면 쿠키 추가후 조회수 1증가 아니면 증가안시킴
 	    Cookie newCookie = new Cookie("|" + tno + "|", URLEncoder.encode(sessionNick, "UTF-8"));
 	    
 	    // 본인이 쓴글이 아닐경우 추가시킴 
 	    if(!writer.equals(logon_nick)) {
 		    newCookie.setMaxAge(1*24*60*60);
 		    response.addCookie(newCookie);
 	  	  	dao.updateTipCount(tip_no);
 	    }
 	} else {
 	    // 쿠키 값 받아옴.
 	    String value = viewCookie.getValue();
 	}
 %>
</head>
<body>
<%@include file="../headerfooter/header.jsp" %>
	<div id="tip_page">
      <div class="tip_title">
        <p>${date}</p>
<% 
	if(category != null) { // 인테리어 팁 카테고리별 화면
		if(category.equals("construct")) {
%>
			<p>시공TIP</p>
<% 
		} else if(category.equals("storage")) {
%>
			<p>수납TIP</p>
<% 
		} else if(category.equals("decorate")) {
%>
			<p>꾸미기 TIP</p>
<% 
		} else if(category.equals("cleaning")) {
%>
			<p>청소 TIP</p>
<% 
		} else if(category.equals("diy")) {
%>
			<p>DIY TIP</p>
<% 
		} else if(category.equals("reform")) {
%>
			<p>리폼 TIP</p>
<% 
		} else if(category.equals("kitchen")) {
%>
			<p>주방/욕실 TIP</p>
<% 
		} else if(category.equals("lighting")) {
%>
			<p>전기/조명 TIP</p>
<%
		}
	}
%>
        <p>
                   조회수 
          <span class="font_green">${count}</span> 
          · 스크랩
          <span class="font_green">${bookmark}</span>
        </p>
        <p>${title}</p>
        <p><input type="button" /></p>
        <p>${user_nick}</p>
      </div>
      <div class="tip_content">
        <p>
    		${content}
        </p>
      </div>
      <div id="list_btn">
        <input
          type="button"
          value="목록으로 돌아가기"
          onclick="location.href='tip_list.jsp?category=${category}'"
        />
      </div>
    </div>
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>