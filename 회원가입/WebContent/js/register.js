var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[~!@#$%^&*()_+-=|<>?:{}])(?=.*[0-9].{8,25}$)/;
var pattern_num = /[0-9]/;
var pattern_eng = /[a-zA-Z]/;
var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;
var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

/*--닉네임 중복체크 팝업부분--*/
function nick_popup() {
	window.open("nick_popup.jsp","nick_check_popup","width=400, height=600, left=100, top=50");
}

function nick_ok() {
	if(document.nick_chk_form.user_nick.value.length == 0) {
		alert("닉네임을 입력해주세요.");
		document.nick_chk_form.user_nick.focus();
		return;
	}
	if(pattern_spc.test(document.nick_chk_form.user_nick.value)) {
		alert("닉네임은 한글과 영어만 사용이 가능합니다.\n특수문자를 제거해주세요.");
		document.nick_chk_form.user_nick.focus();
		return;
	}
	if(pattern_num.test(document.nick_chk_form.user_nick.value)) {
		alert("닉네임은 한글과 영어만 사용이 가능합니다.\n숫자를 제거해주세요.");
		document.nick_chk_form.user_nick.focus();
		return;
	}
	
	document.nick_chk_form.submit();
}

function nick_use() {
	opener.document.getElementById("user_nick").value = document.getElementById("user_nick").value;
	opener.document.getElementById("overlap_chk").disabled = true;
	window.close();
}

/*--아이디 중복체크 팝업부분--*/
function id_popup() {
	window.open("id_popup.jsp","id_check_popup","width=400, height=600, left=100, top=50");
}

function id_ok() {
	if(document.id_chk_form.user_id.value.length == 0) {
		alert("아이디를 입력해주세요.");
		document.id_chk_form.user_id.focus();
		return;
	}
	if(pattern_spc.test(document.id_chk_form.user_id.value)) {
		alert("아이디는 영어와 숫자만 사용이 가능합니다.\n특수문자를 제거해주세요.");
		document.id_chk_form.user_id.focus();
		return;
	}
	if(pattern_kor.test(document.id_chk_form.user_id.value)) {
		alert("아이디는 영어와 숫자만 사용이 가능합니다.\n한글을 제거해주세요.");
		document.id_chk_form.user_id.focus();
		return;
	}
	
	document.id_chk_form.submit();
}

function id_use() {
	opener.document.getElementById("user_id").value = document.getElementById("user_id").value;
	opener.document.getElementById("overlap_chk2").disabled = true;
	window.close();
}






function register_ok() {
	if(document.register_form.user_nick.value.length == 0) {
		alert("닉네임은 필수 입력 사항입니다.");
		document.register_form.user_nick.focus();
		return;
	}
	
	if(document.register_form.overlap_chk.disabled == false) {
		alert("닉네임 중복확인은 필수 입력 사항입니다.");
		document.register_form.overlap_chk.focus();
		return;
	}
	
	
	
	if(document.register_form.user_id.value.length == 0) {
		alert("아이디는 필수 입력 사항입니다.");
		document.register_form.user_id.focus();
		return;
	}
	
	if(document.register_form.overlap_chk2.disabled == false) {
		alert("아이디 중복확인은 필수 입력 사항입니다.");
		document.register_form.overlap_chk2.focus();
		return;
	}
	
	
	
	if(document.register_form.user_pw.value.length == 0) {
		alert("비밀번호는 필수 입력 사항입니다.");
		document.register_form.user_pw.focus();
		return;
	}
	
	if(document.register_form.user_pw.value.length < 8) {
		alert("비밀번호는 최소 8자리 이상 입력해주세요.");
		document.register_form.user_pw.focus();
		return;
	} else if(!pattern_num.test(document.register_form.user_pw.value)) {
		alert("비밀번호에 숫자를 사용하세요.");
		document.register_form.user_pw.focus();
		return;
	} else if(!pattern_eng.test(document.register_form.user_pw.value)) {
		alert("비밀번호에 영문자를 사용하세요.");
		document.register_form.user_pw.focus();
		return;
	} else if(!pattern_spc.test(document.register_form.user_pw.value)) {
		alert("비밀번호에 특수문자를 사용하세요.");
		document.register_form.user_pw.focus();
		return;
	} else if(document.register_form.user_pw.value.length > 16) {
		alert("비밀번호는 16자리 이하로 입력해주세요.");
		document.register_form.user_pw.focus();
		return;
	}
	
	if(document.register_form.user_pwChk.value.length == 0) {
		alert("비밀번호 확인란은 필수 입력 사항입니다.");
		document.register_form.user_pwChk.focus();
		return;
	} else if(document.register_form.user_pw.value != document.register_form.user_pwChk.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.register_form.user_pwChk.focus();
		return;
	}
	
	
	
	if(document.register_form.user_name.value.length == 0) {
		alert("이름은 필수 입력 사항입니다.");
		document.register_form.user_name.focus();
		return;
	}
	if(pattern_spc.test(document.register_form.user_name.value) || pattern_num.test(document.register_form.user_name.value)) {
		alert("이름은 한글 혹은 영문으로만 입력해주십시오.");
		document.register_form.user_name.focus();
		return;
	}
	
	
	if(document.register_form.user_pnum.value.length == 0) {
		alert("전화번호는 필수 입력 사항입니다.");
		document.register_form.user_pnum.focus();
		return;
	} else if(document.register_form.user_pnum.value.length > 11) {
		alert("전화번호는 11자리 이내로 입력해주십시오.");
		document.register_form.user_pnum.focus();
		return;
	} else if(pattern_spc.test(document.register_form.user_pnum.value) || pattern_eng.test(document.register_form.user_pnum.value) || pattern_kor.test(document.register_form.user_pnum.value)) {
		alert("전화번호는 숫자만 입력해주십시오.");
		document.register_form.user_pnum.focus();
		return;
	}
	
	if(!/01[01689][1-9]{1}[0-9]{2,3}[0-9]{4}$/.test(document.register_form.user_pnum.value)){
		alert("휴대폰 번호 양식이 아닙니다.");
		return;
	}
	
	
	
	if(document.register_form.user_email.value.length == 0) {
		alert("이메일은 필수 입력 사항입니다.");
		document.register_form.user_email.focus();
		return;
	}
	if(pattern_spc.test(document.register_form.user_email.value) || pattern_kor.test(document.register_form.user_email.value)) {
		alert("이메일은 숫자와 영문의 조합으로만 입력해주십시오.");
		document.register_form.user_email.focus();
		return;
	}
	
	
	if(document.register_form.user_email2.value.length == 0) {
		alert("이메일 주소를 다시 확인해주세요.");
		document.register_form.user_email2.focus();
		return;
	}
	if(pattern_spc.test(document.register_form.user_email2.value) || pattern_kor.test(document.register_form.user_email2.value)) {
		alert("이메일은 숫자와 영문의 조합으로만 입력해주십시오.");
		document.register_form.user_email2.focus();
		return;
	}
	
	
	
	if(document.register_form.user_addr1.value.length == 0) {
		alert("주소는 필수 입력 사항입니다.");
		document.register_form.user_addr1.focus();
		return;
	}
	if(document.register_form.user_addr2.value.length == 0) {
		alert("주소는 필수 입력 사항입니다.");
		document.register_form.user_addr2.focus();
		return;
	}
	if(document.register_form.user_addr3.value.length == 0) {
		alert("주소는 필수 입력 사항입니다.");
		document.register_form.user_addr3.focus();
		return;
	}
	if(document.register_form.user_addr4.value.length == 0) {
		alert("원활한 중고거래를 위해 상세 주소까지 입력 부탁드립니다.");
		document.register_form.user_addr4.focus();
		return;
	}
	
	document.register_form.submit();

}




function email_change(){
	if(document.register_form.email.options[document.register_form.email.selectedIndex].value == '0'){
		document.register_form.user_email2.disabled = true; 
 		document.register_form.user_email2.value = "";
		return;
	}
	if(document.register_form.email.options[document.register_form.email.selectedIndex].value == '9'){ 
		document.register_form.user_email2.disabled = false;
 		document.register_form.user_email2.value = "";
 		document.register_form.user_email2.focus();
		return;  
	} else { 
		document.register_form.user_email2.disabled = true;
 		document.register_form.user_email2.value = document.register_form.email.options[document.register_form.email.selectedIndex].value;
		return;
	} 
}