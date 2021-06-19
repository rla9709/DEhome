<%@page import="interior.InteriorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="interior.InteriorTipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테리어 팁</title>
	<link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" type="image⁄x-icon" href="../images/x-icon.png" />
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/reset.css" />

    <link rel="stylesheet" href="../css/interior_tip.css" />
    
<%
    	//utf8 인코딩
    	request.setCharacterEncoding("utf-8");
     
    	InteriorTipDAO dao = InteriorTipDAO.getInstance();
    	String category = request.getParameter("category");
    %>
</head>
<body>
<%@include file="../headerfooter/header.jsp" %>  

	<%-- 콘텐트 헤더 --%> 
	<div id="part_tip_list">
      <div id="company_title">
<%
		if(id == null) {
%>
        <input type="button" value="팁 작성하기"
          	   onclick="location.href='../login/login.jsp'" />
<%
		} else {
%>
        <input type="button" value="팁 작성하기"
          	   onclick="location.href='../interior/tip_write.jsp'" />
<%
		}

		if(category != null) { // 인테리어 팁 카테고리별 화면
			if(category.equals("construct")) {
%>
					<p>
	        			<span class="font_green">인테리어 시공 TIP</span>
	        			인테리어 시공 꿀팁
	        		</p>
<% 
			} else if(category.equals("storage")) {
%>
					<p>
	        			<span class="font_green">차곡차곡 수납 TIP</span>
	        			수납 인테리어 꿀팁
	        		</p>
<% 
			} else if(category.equals("decorate")) {
%>
					<p>
	        			<span class="font_green">인테리어 꾸미기 TIP</span>
	        			꾸미기 꿀팁
	        		</p>
<% 
			} else if(category.equals("cleaning")) {
%>
				<p>
        			<span class="font_green">꼼꼼한 청소 TIP</span>
        			청소 꿀팁
        		</p>
<% 
			} else if(category.equals("diy")) {
%>
				<p>
        			<span class="font_green">인테리어 DIY TIP</span>
        			DIY 인테리어 꿀팁
        		</p>
<% 
			} else if(category.equals("reform")) {
%>
				<p>
        			<span class="font_green">새 것 같은 리폼 TIP</span>
        			인테리어 리폼 꿀팁
        		</p>
<% 
			} else if(category.equals("kitchen")) {
%>
				<p>
        			<span class="font_green">주방 및 욕실 TIP</span>
        			주방/욕실 인테리어 꿀팁
        		</p>
<% 
			} else if(category.equals("lighting")) {
%>
				<p>
        			<span class="font_green">전기 및 조명 TIP</span>
        			전기/조명 인테리어 꿀팁
        		</p>
<%
			}
		}
%>
				</div>
	      		<div id="tip_sub_title">
	        		<span>
	        			다양한 사람들과 공유하는, 누구나 할 수 있지만
	        			알려주기 전엔 모르는 오직 나 만의 꿀팁
			        </span>
	      		</div>
      <%-- 콘텐트 --%>
      <table>
        <tr>
<%
		ArrayList<InteriorDTO> list = dao.interiorTipCategoryList(category);
		int sum = 0;
		
		for(int i = 0; i < list.size(); i++) {
			InteriorDTO dto = list.get(i);
			int tip_no = dto.getTip_no();
			String title = dto.getTip_title();// 글제목
			String photo = dto.getTip_file(); 
			int count = dto.getTip_count();// 조회수
			int bookmark = dto.getTip_bookmark();
			sum++;
			
			pageContext.setAttribute("tip_no", tip_no);
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("count", count);
			pageContext.setAttribute("bookmark", bookmark);
			pageContext.setAttribute("category", category);
%>
          <td>
<%
		if(id == null) {
%>
            <a href="../login/login.jsp">
<%
		} else {
%>
            <a href="tip_page.jsp?tip_no=${tip_no}&category=${category}">
<%
		}
%>
              <div id="shop">
                <div class="shop_img">
                  <input type="button" />
                  <img src="${photo}" />
                </div>
                <div class="shop_ex">
                  <div class="shop_name">${title}</div>
                  <p>
                                     조회수 
                    <span class="font_green">${count}</span> 
                    · 스크랩 
                    <span class="font_green">${bookmark}</span>
                  </p>
                </div>
              </div>
            </a>
          </td>
         
<%		
			// 3번 반복시마다 개행
			if(sum != 0 && sum % 3 == 0){
%>
				</tr>
				<tr>
<%
			}
		}
%>
        </tr>
      </table>
      <%-- 미구현 --%>
      <div id="move_btn">
        <input type="button" value="더보기" />
      </div>
    </div>
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>