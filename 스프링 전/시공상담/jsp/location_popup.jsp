<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String input_nick = null;
	input_nick = request.getParameter("input_nick");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위치 정보 설정</title>
<link rel="stylesheet" href="../css/popup.css" />
<script type="text/javascript" src="../js/interior.js" charset="utf-8"></script>
</head>
<body>
	<p>업체리스트 주소 변경</p>
    <form method="post" name="loc_form">
    	<p>시/도</p>
		<select name="popup_addr1">
			<option value="seoul">서울특별시</option>
			<option value="incheon">인천광역시</option>
			<option value="busan">부산광역시</option>
			<option value="ulsan">울산광역시</option>
			<option value="gwangju">광주광역시</option>
			<option value="daegu">대구광역시</option>
			<option value="daejeon">대전광역시</option>
			<option value="gyeonggi">경기도</option>
			<option value="gangwon">강원도</option>
			<option value="gyeongsangnamdo">경상남도</option>
			<option value="gyeongsangbukdo">경상북도</option>
			<option value="jeollanamdo">전라남도</option>
			<option value="jeollabukdo">전라북도</option>
			<option value="chungcheongnamdo">충청남도</option>
			<option value="chungcheongbukdo">충청북도</option>
			<option value="sejong">세종특별자치시</option>
			<option value="jeju">제주특별자치도</option>
		</select>
		
		<p>구/군</p>
		<select name="popup_addr2">
			<option value="busan1">강서구</option>
			<option value="busan2">금정구</option>
			<option value="busan3">기장군</option>
			<option value="busan4">남구</option>
			<option value="busan5">동구</option>
			<option value="busan6">동래구</option>
			<option value="busan7">부산진구</option>
			<option value="busan8">북구</option>
			<option value="busan9">사상구</option>
			<option value="busan10">사하구</option>
			<option value="busan11">서구</option>
			<option value="busan12">수영구</option>
			<option value="busan13">연제구</option>
			<option value="busan14">영도구</option>
			<option value="busan15">중구</option>
			<option value="busan16">해운대구</option>
		</select>
		
		<input type="button" value="주소보내기" onclick="location_ok()">
    </form>
</body>
</html>