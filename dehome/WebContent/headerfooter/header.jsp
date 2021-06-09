<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/reset.css" />
</head>
<body>
	<header id="header_body">
      <div id="header_top">
        <div class="header_top_left">
          <img src="../images/dh_logo.png" />
          <a href="../main/mainpage.jsp">DE:home</a>
        </div>
<%
			if(id == null) {
%>
			<div class="header_top_right">
				<a href="../login/login.jsp">로그인</a> &nbsp;&nbsp;&nbsp; 
				<a href="#">회원가입</a>&nbsp;&nbsp;&nbsp; 
				<input type="text"placeholder="search" />
				<button>검색</button>
			</div>				
<%
			} else {
%>
				<div class="header_top_right">
					<a href="../login/logout.jsp">로그아웃</a> &nbsp;&nbsp;&nbsp; 
					<a href="#">마이페이지</a>&nbsp;&nbsp;&nbsp; 
					<input type="text"placeholder="search" />
					<button>검색</button>
				</div>				
<%			
			}
%>
      </div>
      <div id="menu_bar">
        <div class="menu_bar_property1">
          <div class="trade"><a href="../trade/used_trade.jsp">중고거래</a></div>
          <div class="category1">
            <div class="category1_word">
              <div class="category1_1"><a href="#">카테고리</a></div>
              <div class="category2">
                <table class="category2_table1">
                  <tr>
                    <td><a href="../trade/used_trade.jsp?category=furniture">가구</a></td>
                    <td><a href="../trade/used_trade.jsp?category=fabric">fabric</a></td>
                  </tr>
                  <tr>
                    <td><a href="../trade/used_trade.jsp?category=interior_prop">인테리어 소품</a></td>
                    <td><a href="../trade/used_trade.jsp?category=light">조명</a></td>
                  </tr>
                  <tr>
                    <td><a href="../trade/used_trade.jsp?category=storage_furniture">수납</a></td>
                    <td><a href="../trade/used_trade.jsp?category=life_bath">생활/욕실</a></td>
                  </tr>
                  <tr>
                    <td><a href="../trade/used_trade.jsp?category=kitchen">주방</a></td>
                    <td><a href="../trade/used_trade.jsp?category=diy">DIY</a></td>
                  </tr>
                </table>
              </div>
            </div>
            <div><a href="#">자유 게시판</a></div>
          </div>
        </div>
        <div class="menu_bar_property2">
          <div class="interior"><a href="#">인테리어</a></div>
          <div class="category1">
            <div class="category1_word">
              <div class="category1_1">
                <a href="interior_ tip.html">인테리어 팁</a>
              </div>
              <div class="category2">
                <table class="category2_table2">
                  <tr>
                    <td><a href="#">시공</a></td>
                    <td><a href="#">수납</a></td>
                  </tr>
                  <tr>
                    <td><a href="#">꾸미기 팁</a></td>
                    <td><a href="#">청소</a></td>
                  </tr>
                  <tr>
                    <td><a href="#">DIY</a></td>
                    <td><a href="#">리폼</a></td>
                  </tr>
                  <tr>
                    <td><a href="#">주방/욕실</a></td>
                    <td><a href="#">전기/조명</a></td>
                  </tr>
                </table>
              </div>
            </div>
            <div><a href="company_list.html">시공상담</a></div>
          </div>
        </div>
        <div class="menu_bar_property3">
          <div class="customer"><a href="#">고객센터</a></div>
          <div class="category1">
            <div><a href="#">서비스 소개</a></div>
            <div><a href="#">QNA</a></div>
            <div><a href="#">FAQ</a></div>
            <div><a href="#">공지사항</a></div>
          </div>
        </div>
      </div>
    </header>
</body>
</html>