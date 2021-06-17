<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap" rel="stylesheet"/>
	<link rel="stylesheet" href="../css/header_footer.css" />
	<link rel="stylesheet" href="../css/my_page.css" />
	<link rel="stylesheet" href="../css/sign_up.css" />
	<link rel="stylesheet" href="../css/reset.css" />
	
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>	
<script type="text/javascript" src="../js/register.js" charset="utf-8"></script>
</head>
<body>
	<jsp:include page="../headerfooter/header.jsp"/>

      <div class="contents_sign_up">
        <h2 class="page_title">회원가입</h2>
        <form method="post" name="register_form" action="register_ok.jsp">
          <div class="sign_up_box">
            <h3 class="sign_up_box_title">사이트 내 정보입력 회원가입</h3>
            
            <p class="sign_up_label">닉네임</p>
            <p>
	            <input type="text" name="user_nick" id="user_nick" class="sign_up_input3" placeholder="닉네임은 한글과 영어만 사용이 가능합니다" />
	            <button type="button" onclick="nick_popup()" id="overlap_chk">중복확인</button>	
            </p>
            <br />
            <p class="sign_up_label">아이디</p>
            <p>
            	<input type="text" name="user_id" id="user_id" class="sign_up_input3" placeholder="아이디는 영어와 숫자만 사용이 가능합니다" />
            	<button type="button" onclick="id_popup()" id="overlap_chk2">중복확인</button>
            </p>
            <br />
            
            <p class="sign_up_label">비밀번호</p>
            <p>
              <input type="password" name="user_pw" class="sign_up_input" id="password_validation" placeholder="비밀번호는 8~16자 영문자, 숫자, 특수문자를 사용하세요" />
              <br><span class="pwdValTxt"><br></span>
            </p>
            <p class="sign_up_label">비밀번호 확인</p>
            <p>
              <input type="password" name="user_pwChk" class="sign_up_input" /><br>
            </p>
            <br />
            <!--0607_SE추가-->
            <p class="sign_up_label">이름</p>
            <p>
              <input type="text" name="user_name" class="sign_up_input" />
            </p>
            <br />
            <p class="sign_up_label">전화번호</p>
            <p>
              <input type="tel" name="user_pnum" class="sign_up_input" />
            </p>
            <br />
            <p class="sign_up_label">이메일</p>
            <p>
              <input type="text" name="user_email" class="sign_up_input2" />
              @
              <input type="text" name="user_email2" class="sign_up_input2"  disabled="disabled" />
              <select style="height: 44px; margin-top: 5px"  name="email" onchange="email_change()">
                <option value="0">선택</option>
                <option value="9">직접 입력</option>
                <option value="naver.com">naver.com</option>
                <option value="daum.net">daum.net</option>
                <option value="nate.com">nate.com</option>
                <option value="gmail.com">gmail.com</option>
                <option value="hanmail.net">hanmail.net</option>
              </select>
            </p>
            <br />
            <p class="sign_up_label">성별</p>
            <p>
              <select style="width: 438px; height: 44px; margin-top: 5px;" name="user_sex">
                <option value="m">남자</option>
                <option value="f">여자</option>
              </select>
            </p>
            <br />
            <p class="sign_up_label">주소</p>
            <div class="reg_addr">
				<input type="text" class="addr1" name="user_addr1" id="postcode" placeholder="우편번호">
				<input type="button" class="addr_btn" onclick="execPostcode()" value="우편번호 찾기"><br>
				<input type="text" class="addr2" name="user_addr2" id="address" placeholder="주소"><br>
				<input type="text" class="addr3" name="user_addr3" id="extraAddress" placeholder="참고항목"><br>
				<input type="text" class="addr4" name="user_addr4" id="detailAddress" placeholder="상세주소">
			</div>
			
			<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
			<script>
			    function execPostcode() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
			                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
			                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                var addr = ''; // 주소 변수
			                var extraAddr = ''; // 참고항목 변수
			
			                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			                    addr = data.roadAddress;
			                } else { // 사용자가 지번 주소를 선택했을 경우(J)
			                    addr = data.jibunAddress;
			                }
			
			                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			                if(data.userSelectedType === 'R'){
			                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                        extraAddr += data.bname;
			                    }
			                    // 건물명이 있고, 공동주택일 경우 추가한다.
			                    if(data.buildingName !== '' && data.apartment === 'Y'){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                    if(extraAddr !== ''){
			                        extraAddr = ' (' + extraAddr + ')';
			                    }
			                    // 조합된 참고항목을 해당 필드에 넣는다.
			                    document.getElementById("extraAddress").value = extraAddr;
			                
			                } else {
			                    document.getElementById("extraAddress").value = '';
			                }
			
			                // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                document.getElementById('postcode').value = data.zonecode;
			                document.getElementById("address").value = addr;
			                // 커서를 상세주소 필드로 이동한다.
			                document.getElementById("detailAddress").focus();
			            }
			        }).open();
			    }
			</script>
			
			<br />
			
			<input type="checkbox" id="comCheckBtn" onclick="doDisplay()"> 
			<span id="com_chk_span">기업인가요?</span>
			<div id="comCheck" style="display: none">
				<p class="sign_up_label">업체명 작성</p>
	            <p>
	              <input type="text" id="com_name" name="com_name" class="sign_up_input" placeholder="업체명을 작성해주세요" />
	            </p>
	            <br />
            </div>

            <div>
              <input type="button" value="확인" class="sign_up_button" onclick="register_ok()" />
            </div>
          </div>
          <div class="sns_sign_up_box">
            <h3 class="sign_up_box_title">SNS 인증 회원가입</h3>
            <div>
              <input
                type="button"
                value="네이버 아이디로 회원가입"
                class="sign_up_button_naver"
              />
            </div>
            <div>
              <input
                type="button"
                value="카카오 아이디로 회원가입"
                class="sign_up_button_kakao"
              />
            </div>
          </div>
        </form>
      </div>
    
    <jsp:include page="../headerfooter/footer.jsp"/>
</body>
</html>