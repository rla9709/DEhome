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
          	   onclick="location.href='tip_write.jsp'" />
<%
		}
%>

<%-- =============== 6월 8일 여기까지 작업함 =============== --%>
        <p>
        	<span class="font_green">시공TIP</span>
        	인테리어 시공 꿀팁
        </p>
      </div>
      <div id="tip_sub_title">
        <span>
        	혼자서도 척척, 시공까지 셀프로하고 싶은 여러분을 위한 
         	다양한 사람들의 시공 꿀팁
        </span>
      </div>
      <%-- 콘텐트 --%>
      <table>
        <tr>
          <td>
            <a href="tip_page.html">
              <div id="shop">
                <div class="shop_img">
                  <input type="button" />
                  <img src="../images/paint.jpg" />
                </div>
                <div class="shop_ex">
                  <div class="shop_name">방문 페인트칠로 리폼하기</div>
                  <p>
                    조회수 <span class="font_green">280,755</span> · 스크랩
                    <span class="font_green">4,621</span>
                  </p>
                </div>
              </div>
            </a>
          </td>
          <td>
            <a href="tip_page.html">
              <div id="shop">
                <div class="shop_img">
                  <input type="button" />
                  <img src="images/tile.jpg" />
                </div>
                <div class="shop_ex">
                  <div class="shop_name">타일깔기도 이젠 셀프로 척척</div>
                  <p>
                    조회수 <span class="font_green">280,755</span> · 스크랩
                    <span class="font_green">4,621</span>
                  </p>
                </div>
              </div>
            </a>
          </td>
          <td>
            <a href="tip_page.html">
              <div id="shop">
                <div class="shop_img">
                  <input type="button" />
                  <img src="images/wall.jpg" />
                </div>
                <div class="shop_ex">
                  <div class="shop_name">내가 원하는 스타일로 벽지 꾸미기</div>
                  <p>
                    조회수 <span class="font_green">280,755</span> · 스크랩
                    <span class="font_green">4,621</span>
                  </p>
                </div>
              </div>
            </a>
          </td>
        </tr>
        <tr>
          <td>
            <a href="tip_page.html">
              <div id="shop">
                <div class="shop_img">
                  <input type="button" />
                  <img src="images/room_09.jpg" />
                </div>
                <div class="shop_ex">
                  <div class="shop_name">방문 페인트칠로 리폼하기</div>
                  <p>
                    조회수 <span class="font_green">280,755</span> · 스크랩
                    <span class="font_green">4,621</span>
                  </p>
                </div>
              </div>
            </a>
          </td>
          <td>
            <a href="tip_page.html">
              <div id="shop">
                <div class="shop_img">
                  <input type="button" />
                  <img src="images/room_08.jpg" />
                </div>
                <div class="shop_ex">
                  <div class="shop_name">타일깔기도 이젠 셀프로 척척</div>
                  <p>
                    조회수 <span class="font_green">280,755</span> · 스크랩
                    <span class="font_green">4,621</span>
                  </p>
                </div>
              </div>
            </a>
          </td>
          <td>
            <a href="tip_page.html">
              <div id="shop">
                <div class="shop_img">
                  <input type="button" />
                  <img src="images/room_07.jpg" />
                </div>
                <div class="shop_ex">
                  <div class="shop_name">내가 원하는 스타일로 벽지 꾸미기</div>
                  <p>
                    조회수 <span class="font_green">280,755</span> · 스크랩
                    <span class="font_green">4,621</span>
                  </p>
                </div>
              </div>
            </a>
          </td>
        </tr>
        <tr>
          <td>
            <a href="tip_page.html">
              <div id="shop">
                <div class="shop_img">
                  <input type="button" />
                  <img src="images/paint.jpg" />
                </div>
                <div class="shop_ex">
                  <div class="shop_name">방문 페인트칠로 리폼하기</div>
                  <p>
                    조회수 <span class="font_green">280,755</span> · 스크랩
                    <span class="font_green">4,621</span>
                  </p>
                </div>
              </div>
            </a>
          </td>
          <td>
            <a href="tip_page.html">
              <div id="shop">
                <div class="shop_img">
                  <input type="button" />
                  <img src="images/tile.jpg" />
                </div>
                <div class="shop_ex">
                  <div class="shop_name">타일깔기도 이젠 셀프로 척척</div>
                  <p>
                    조회수 <span class="font_green">280,755</span> · 스크랩
                    <span class="font_green">4,621</span>
                  </p>
                </div>
              </div>
            </a>
          </td>
          <td>
            <a href="tip_page.html">
              <div id="shop">
                <div class="shop_img">
                  <input type="button" />
                  <img src="images/wall.jpg" />
                </div>
                <div class="shop_ex">
                  <div class="shop_name">내가 원하는 스타일로 벽지 꾸미기</div>
                  <p>
                    조회수 <span class="font_green">280,755</span> · 스크랩
                    <span class="font_green">4,621</span>
                  </p>
                </div>
              </div>
            </a>
          </td>
        </tr>
      </table>
      <div id="move_btn">
        <input type="button" value="더보기" />
      </div>
    </div>
<%@include file="../headerfooter/footer.jsp" %>
</body>
</html>