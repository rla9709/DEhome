<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String nick = (String)session.getAttribute("nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DE:home</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/login.css" />
    <link rel="stylesheet" href="../css/reset.css" />
</head>
<body>
	<header id="header_body">
		<div id="header_top">
			<div class="header_top_left">
				<img src="../images/dh_logo.png" /> 
				<a href="mainpage.html">DE:home</a>
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
				<div class="trade">
					<a href="usedTrade.html">중고거래</a>
				</div>
				<div class="category1">
					<div class="category1_word">
						<div class="category1_1">
							<a href="#">카테고리</a>
						</div>
						<div class="category2">
							<table class="category2_table1">
								<tr>
									<td><a href="#">가구</a></td>
									<td><a href="#">fabric</a></td>
								</tr>
								<tr>
									<td><a href="#">인테리어 소품</a></td>
									<td><a href="#">조명</a></td>
								</tr>
								<tr>
									<td><a href="#">수납</a></td>
									<td><a href="#">생활/욕실</a></td>
								</tr>
								<tr>
									<td><a href="#">주방</a></td>
									<td><a href="#">DIY</a></td>
								</tr>
							</table>
						</div>
					</div>
					<div>
						<a href="#">자유 게시판</a>
					</div>
				</div>
			</div>
			<div class="menu_bar_property2">
				<div class="interior">
					<a href="#">인테리어</a>
				</div>
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
					<div>
						<a href="company_list.html">시공상담</a>
					</div>
				</div>
			</div>
			<div class="menu_bar_property3">
				<div class="customer">
					<a href="#">고객센터</a>
				</div>
				<div class="category1">
					<div>
						<a href="#">서비스 소개</a>
					</div>
					<div>
						<a href="#">QNA</a>
					</div>
					<div>
						<a href="#">FAQ</a>
					</div>
					<div>
						<a href="#">공지사항</a>
					</div>
				</div>
			</div>
		</div>
	</header>
	<content>
	<div
		style="height: 500px; font-size: 100px; text-align: center; margin-top: 50px;">
		메인페이지 구현 예정</div>
	</content>
	<footer>
		<hr />
		<div class="footer_menu_list">
			<ul>
				<li><a href="#">DE:home 소개</a></li>
				<li><a href="#">이용약관</a></li>
				<li><a href="#"> 개인정보보호취급방침 </a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">광고문의</a></li>
				<li><a href="https://twitter.com/?lang=ko" target="_blank">Twitter</a>
				</li>
				<li><a href="https://m.facebook.com/?locale2=ko_KR"
					target="_blank">Facebook</a></li>
				<li><a href="https://github.com/" target="_blank">Github</a></li>
				<li><a href="#">고객센터</a> : Tel. 0000-0000, 평일 09:00~12:00, 주말
					휴무, 공휴일 휴무</li>
			</ul>
		</div>
		<div class="footer_info">
			<ul>
				<li>DE:home</li>
				<li>대표이사 : 000</li>
				<li>문의 : dehome@home.com</li>
				<li>주소 : 부산광역시 부산남구 수영로 299, 루미너스 빌딩 10층 1004호</li>
				<li>사업자등록번호 : 000-000-0000-00</li>
				<li>통신판매업 신고번호 : 0000-부산남-00000 호</li>
			</ul>
		</div>
		<div class="footer_copyright">
			<ul>
				<li>copyright ⓒ 2021 etah. All rights reserved.</li>
			</ul>
		</div>
	</footer>
</body>
</html>