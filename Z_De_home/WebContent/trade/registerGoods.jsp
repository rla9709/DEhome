<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerGoods</title>
	<link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
		href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      	rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="../css/reset.css" type="text/css"/>
    <link rel="stylesheet" href="../css/registerGoods.css" type="text/css"/>
</head>
<body>
    <%@ include file = "../headerfooter/header.jsp" %>
    
    <main>
      <form name="reg_goods_form" action="insert_ok.jsp" method="post" enctype="multipart/form-data">
        <div class="sell_form">
          <p class="regi_form_main_title">내 상품 등록</p>
          <div>
            <select name="tr_category" id="goods_category">
              <option value="0" selected>카테고리</option>
              <option value="furniture">가구</option>
              <option value="fabric">fabric</option>
              <option value="interior_prop">인테리어 소품</option>
              <option value="light">조명</option>
              <option value="storage_furniture">수납</option>
              <option value="life_bath">생활/욕실</option>
              <option value="kitchen">주방</option>
              <option value="diy">DIY</option>
            </select>
          </div>
          <div class="goods_regi_form regi_form_title">
            <input type="text" name="tr_title" maxlength="20" placeholder="글 제목" />
          </div>
          <div class="goods_regi_form regi_form_price">
            <select
              name="tr_price"
              id="price_category"
              onchange="select_change()"
            >
              <option value="1" selected>판매금액</option>
              <option value="2">무료나눔</option>
            </select>
            <input
              type="text"
              maxlength="10"
              placeholder="숫자만 입력(0원일 경우 무료나눔을 선택해주세요.)"
              id="price"
            />
          </div>
          <div class="goods_regi_form_file">
            <label for="ex_file">사진 업로드</label>
            <input
              type="file"
              name="tr_photo"
              id="ex_file"
              onchange="javascript:document.getElementById('fileName').value = this.value.split('\\')[this.value.split('\\').length-1]"
              accept="image/*"
            />
            <input type="text" id="fileName" readonly />
          </div>
          <!-- 디비에 값넣을때 엔터값은 <br>태그로 치환해주세요 -->
          <textarea
            name="tr_content"
            class="goods_regi_form_content"
            cols="48"
            rows="10"
            maxlength="1000"
            placeholder="게시글 내용을 작성해주세요.&#13;&#10;(가품 및 판매금지 품목은 게시가 제한될 수 있어요.)"
          ></textarea>
          <div class="goods_submit_btn">
            <input type="reset" value="새로고침" />
            <input type="submit" value="상품등록"/>
<!--             <input type="button" value="상품등록" onclick="check_ok()"/> -->
          </div>
        </div>
      </form>
    </main>
    <!-- 가격 적는거 선택할때 옵션주기위한 스크립트코드 -->
    <script>
      function select_change() {
        if (
          document.reg_goods_form.price_category.options[
            document.reg_goods_form.price_category.selectedIndex
          ].value == "2"
        ) {
          document.reg_goods_form.price.disabled = true;
          document.reg_goods_form.price.value = "무료나눔";
          return;
        } else {
          document.reg_goods_form.price.disabled = false;
          document.reg_goods_form.price.value = "";
          return;
        }
      }
      function check_ok(){
    		if(document.form.tr_category.value.length == 0){
    			alert("카테고리를 선택하세요.");
    			return;
    		}
    		if(document.form.tr_title.value.length == 0){
    			alert("글제목을 입력해주세요.");
    			form.tr_title.focus();
    			return;
    		}
    		if(document.form.tr_photo.value.length == 0){
    			alert("사진을 첨부해주세요.");
    			form.tr_photo.focus();
    			return;
    		}
    		if(document.form.tr_content.value.length == 0){
    			alert("글내용을 입력해주세요.");
    			form.tr_content.focus();
    			return;
    		}
    		document.form.submit();
    		
    	}
    </script>
   
    <%@ include file = "../headerfooter/footer.jsp" %>
</body>
</html>