<%@page import="interior.InteriorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="interior.InteriorTipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" type="image⁄x-icon" href="../images/x-icon.png" />
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/reset.css" />

    <link rel="stylesheet" href="../css/interior_tip.css" />
<title>Insert title here</title>
<%
    	//utf8 인코딩
    	request.setCharacterEncoding("utf-8");
     
    	InteriorTipDAO dao = InteriorTipDAO.getInstance();
    	
%>
</head>
<body>
<%@include file="../headerfooter/header.jsp" %> 
	<div id="interior_tip_list">
	      <!--시공 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input
	            type="button"
	            value="더보기"
	            class="more"
	            onclick="location.href='tip_list.jsp?category=construct'"
	          />
	          <p>인테리어 시공 TIP</p>
	          <p>인테리어 시공 꿀팁</p>
	        </div>
<%
		String category = "construct";
		ArrayList<InteriorDTO> list = dao.interiorTipCategoryList(category);
		
		for(int i = 0; i < list.size(); i++) {
			InteriorDTO dto = list.get(i);
			int tip_no = dto.getTip_no();
			String title = dto.getTip_title(); // 글제목
			String photo = dto.getTip_file(); 
			int count = dto.getTip_count(); // 조회수
			int bookmark = dto.getTip_bookmark();
			
			if(i == 4){
				break;
			}
			
			pageContext.setAttribute("tip_no", tip_no);
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("count", count);
			pageContext.setAttribute("bookmark", bookmark);
			pageContext.setAttribute("category", category);
%>
            <a href="tip_page.jsp?tip_no=${tip_no}&category=${category}">
	          <div class="tipcon_box">
              	<div id="tipcon_img">
                  <img src="${photo}" />
	            </div>
                  <input type="button" >
                  <p>${title}</p>
                  <p>
                                     조회수 
                    <span class="font_green">${count}</span> 
                    · 스크랩 
                    <span class="font_green">${bookmark}</span>
                  </p>
              </div>
            </a>
<%
		}
%>          
		</div>

 			<!-- 꾸미기 TIP -->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input
	            type="button"
	            value="더보기"
	            class="more"
	            onclick="location.href='tip_list.jsp?category=decorate'"
	          />
	          <p>인테리어 꾸미기 TIP</p>
	          <p>꾸미기 꿀팁</p>
	        </div>
<%
		category = "decorate";
		list = dao.interiorTipCategoryList(category);
		
		for(int i = 0; i < list.size(); i++) {
			InteriorDTO dto = list.get(i);
			int tip_no = dto.getTip_no();
			String title = dto.getTip_title(); // 글제목
			String photo = dto.getTip_file(); 
			int count = dto.getTip_count(); // 조회수
			int bookmark = dto.getTip_bookmark();
			
			if(i == 4){  // 화면에 4개까지만 노출
				break;
			}
			
			pageContext.setAttribute("tip_no", tip_no);
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("count", count);
			pageContext.setAttribute("bookmark", bookmark);
			pageContext.setAttribute("category", category);
%>
            <a href="tip_page.jsp?tip_no=${tip_no}&category=${category}">
	          <div class="tipcon_box">
              	<div id="tipcon_img">
                  <img src="${photo}" />
	            </div>
                  <input type="button" >
                  <p>${title}</p>
                  <p>
                                     조회수 
                    <span class="font_green">${count}</span> 
                    · 스크랩 
                    <span class="font_green">${bookmark}</span>
                  </p>
              </div>
            </a>
<%
		}
%>          
		</div>
		
    <!--DIY TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input
	            type="button"
	            value="더보기"
	            class="more"
	            onclick="location.href='tip_list.jsp?category=diy'"
	          />
	          <p>인테리어 DIY TIP</p>
	          <p>DIY 인테리어 꿀팁</p>
	        </div>
<%
		category = "diy";
		list = dao.interiorTipCategoryList(category);
		
		for(int i = 0; i < list.size(); i++) {
			InteriorDTO dto = list.get(i);
			int tip_no = dto.getTip_no();
			String title = dto.getTip_title(); // 글제목
			String photo = dto.getTip_file(); 
			int count = dto.getTip_count(); // 조회수
			int bookmark = dto.getTip_bookmark();

			if(i == 4){  // 화면에 4개까지만 노출
				break;
			}
			
			pageContext.setAttribute("tip_no", tip_no);
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("count", count);
			pageContext.setAttribute("bookmark", bookmark);
			pageContext.setAttribute("category", category);
%>
            <a href="tip_page.jsp?tip_no=${tip_no}&category=${category}">
	          <div class="tipcon_box">
              	<div id="tipcon_img">
                  <img src="${photo}" />
	            </div>
                  <input type="button" >
                  <p>${title}</p>
                  <p>
                                     조회수 
                    <span class="font_green">${count}</span> 
                    · 스크랩 
                    <span class="font_green">${bookmark}</span>
                  </p>
              </div>
            </a>
<%
		}
%>          
		</div>
	      
	     <!--주방/욕실 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input
	            type="button"
	            value="더보기"
	            class="more"
	            onclick="location.href='tip_list.jsp?category=kitchen'"
	          />
	          <p>주방 및 욕실 TIP</p>
	          <p>주방/욕실 인테리어 꿀팁</p>
	        </div>
<%
		category = "kitchen";
		list = dao.interiorTipCategoryList(category);
		
		for(int i = 0; i < list.size(); i++) {
			InteriorDTO dto = list.get(i);
			int tip_no = dto.getTip_no();
			String title = dto.getTip_title(); // 글제목
			String photo = dto.getTip_file(); 
			int count = dto.getTip_count(); // 조회수
			int bookmark = dto.getTip_bookmark();

			if(i == 4){  // 화면에 4개까지만 노출
				break;
			}
			
			pageContext.setAttribute("tip_no", tip_no);
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("count", count);
			pageContext.setAttribute("bookmark", bookmark);
			pageContext.setAttribute("category", category);
%>
            <a href="tip_page.jsp?tip_no=${tip_no}&category=${category}">
	          <div class="tipcon_box">
              	<div id="tipcon_img">
                  <img src="${photo}" />
	            </div>
                  <input type="button" >
                  <p>${title}</p>
                  <p>
                                     조회수 
                    <span class="font_green">${count}</span> 
                    · 스크랩 
                    <span class="font_green">${bookmark}</span>
                  </p>
              </div>
            </a>
<%
		}
%>          
		</div>
		
	       <!--수납 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input
	            type="button"
	            value="더보기"
	            class="more"
	            onclick="location.href='tip_list.jsp?category=storage'"
	          />
	          <p>차곡차곡 수납 TIP</p>
	          <p>수납 인테리어 꿀팁</p>
	        </div>
<%
		category = "storage";
		list = dao.interiorTipCategoryList(category);
		
		for(int i = 0; i < list.size(); i++) {
			InteriorDTO dto = list.get(i);
			int tip_no = dto.getTip_no();
			String title = dto.getTip_title(); // 글제목
			String photo = dto.getTip_file(); 
			int count = dto.getTip_count(); // 조회수
			int bookmark = dto.getTip_bookmark();

			if(i == 4){  // 화면에 4개까지만 노출
				break;
			}
			
			pageContext.setAttribute("tip_no", tip_no);
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("count", count);
			pageContext.setAttribute("bookmark", bookmark);
			pageContext.setAttribute("category", category);
%>
            <a href="tip_page.jsp?tip_no=${tip_no}&category=${category}">
	          <div class="tipcon_box">
              	<div id="tipcon_img">
                  <img src="${photo}" />
	            </div>
                  <input type="button" >
                  <p>${title}</p>
                  <p>
                                     조회수 
                    <span class="font_green">${count}</span> 
                    · 스크랩 
                    <span class="font_green">${bookmark}</span>
                  </p>
              </div>
            </a>
<%
		}
%>          
		</div>
		
	        <!--청소 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input
	            type="button"
	            value="더보기"
	            class="more"
	            onclick="location.href='tip_list.jsp?category=cleaning'"
	          />
	          <p>꼼꼼한 청소 TIP</p>
	          <p>청소 꿀팁</p>
	        </div>
<%
		category = "cleaning";
		list = dao.interiorTipCategoryList(category);
		
		for(int i = 0; i < list.size(); i++) {
			InteriorDTO dto = list.get(i);
			int tip_no = dto.getTip_no();
			String title = dto.getTip_title(); // 글제목
			String photo = dto.getTip_file(); 
			int count = dto.getTip_count(); // 조회수
			int bookmark = dto.getTip_bookmark();

			if(i == 4){  // 화면에 4개까지만 노출
				break;
			}
			
			pageContext.setAttribute("tip_no", tip_no);
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("count", count);
			pageContext.setAttribute("bookmark", bookmark);
			pageContext.setAttribute("category", category);
%>
            <a href="tip_page.jsp?tip_no=${tip_no}&category=${category}">
	          <div class="tipcon_box">
              	<div id="tipcon_img">
                  <img src="${photo}" />
	            </div>
                  <input type="button" >
                  <p>${title}</p>
                  <p>
                                     조회수 
                    <span class="font_green">${count}</span> 
                    · 스크랩 
                    <span class="font_green">${bookmark}</span>
                  </p>
              </div>
            </a>
<%
		}
%>          
		</div>
		
	       <!--리폼 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input
	            type="button"
	            value="더보기"
	            class="more"
	            onclick="location.href='tip_list.jsp?category=reform'"
	          />
	          <p>새 것 같은 리폼 TIP</p>
	          <p>인테리어 리폼 꿀팁</p>
	        </div>
<%
		category = "reform";
		list = dao.interiorTipCategoryList(category);
		
		for(int i = 0; i < list.size(); i++) {
			InteriorDTO dto = list.get(i);
			int tip_no = dto.getTip_no();
			String title = dto.getTip_title(); // 글제목
			String photo = dto.getTip_file(); 
			int count = dto.getTip_count(); // 조회수
			int bookmark = dto.getTip_bookmark();

			if(i == 4){  // 화면에 4개까지만 노출
				break;
			}
			
			pageContext.setAttribute("tip_no", tip_no);
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("count", count);
			pageContext.setAttribute("bookmark", bookmark);
			pageContext.setAttribute("category", category);
%>
            <a href="tip_page.jsp?tip_no=${tip_no}&category=${category}">
	          <div class="tipcon_box">
              	<div id="tipcon_img">
                  <img src="${photo}" />
	            </div>
                  <input type="button" >
                  <p>${title}</p>
                  <p>
                                     조회수 
                    <span class="font_green">${count}</span> 
                    · 스크랩 
                    <span class="font_green">${bookmark}</span>
                  </p>
              </div>
            </a>
<%
		}
%>          
		</div>
		
	      <!--전기/조명 TIP-->
	      <div class="tip_content">
	        <div class="tip_title">
	          <input
	            type="button"
	            value="더보기"
	            class="more"
	            onclick="location.href='tip_list.jsp?category=lighting'"
	          />
	          <p>전기 및 조명 TIP</p>
	          <p>전기/조명 인테리어 꿀팁</p>
	        </div>
<%
		category = "lighting";
		list = dao.interiorTipCategoryList(category);
		
		for(int i = 0; i < list.size(); i++) {
			InteriorDTO dto = list.get(i);
			int tip_no = dto.getTip_no();
			String title = dto.getTip_title(); // 글제목
			String photo = dto.getTip_file(); 
			int count = dto.getTip_count(); // 조회수
			int bookmark = dto.getTip_bookmark();

			if(i == 4){  // 화면에 4개까지만 노출
				break;
			}
			
			pageContext.setAttribute("tip_no", tip_no);
			pageContext.setAttribute("title", title);
			pageContext.setAttribute("photo", photo);
			pageContext.setAttribute("count", count);
			pageContext.setAttribute("bookmark", bookmark);
			pageContext.setAttribute("category", category);
%>
            <a href="tip_page.jsp?tip_no=${tip_no}&category=${category}">
	          <div class="tipcon_box">
              	<div id="tipcon_img">
                  <img src="${photo}" />
	            </div>
                  <input type="button" >
                  <p>${title}</p>
                  <p>
                                     조회수 
                    <span class="font_green">${count}</span> 
                    · 스크랩 
                    <span class="font_green">${bookmark}</span>
                  </p>
              </div>
            </a>
<%
		}
%>          
		</div>
	</div>
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>