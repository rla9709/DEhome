
function email_change(){
	if(document.form.email.options[document.form.email.selectedIndex].value == '0'){
		document.form.user_email2.disabled = true; 
 		document.form.user_email2.value = ""
		return;
	}
	if(document.form.email.options[document.form.email.selectedIndex].value == '9'){ 
		document.form.user_email2.disabled = false;
 		document.form.user_email2.value = "";
 		document.form.user_email2.focus();
		return;  
	} else { 
		document.form.user_email2.disabled = true;
 		document.form.user_email2.value 
			= document.form.email.options[document.form.email.selectedIndex].value;
		return;
	} 
}

function edit_ok(){
	if(document.form.user_nick.value.length == 0) {
		alert("닉네임는 필수 입력 사항입니다.");
		document.form.mem_nick.focus();
		return;
	}
	if(document.form.pre_pw.value.length == 0) {
		alert("기존 비밀번호는 필수 입력 사항입니다.");
		document.form.mem_pwd.focus();
		return;
	}
	if(document.form.user_pw.value.length == 0) {
		alert("새 비밀번호는 필수 입력 사항입니다.");
		document.form.mem_pwd_new.focus();
		return;
	}
	if(document.form.user_pw2.value.length == 0) {
		alert("새 비밀번호 확인은 필수 입력 사항입니다.");
		document.form.mem_pwd_new2.focus();
		return;
	}
	if(document.form.user_pnum.value.length == 0) {
		alert("휴대폰 번호는 필수 입력 사항입니다.");
		document.form.user_id.focus();
		return;
	}
	if(document.form.user_addr2.value.length == 0) {
		alert("주소는 필수 입력 사항입니다.");
		document.form.address_input1.focus();
		return;
	}
	if(document.form.user_addr4.value.length == 0) {
		alert("상세주소를 입력하세요.");
		document.form.address_input2.focus();
		return;
	}
	
	
	
	/*비밀번호 확인*/
	if(document.form.user_pw.value != document.form.user_pw2.value) {
		alert("새 비밀번호가 일치하지 않습니다.");
		document.form.mem_pwd_new2.focus();
		return;
	}
	
	document.form.submit();
}





function check_ok(){
	ckType = document.getElementsByName("delete_reason")
	
	for (i=0;i<ckType.length ;i++){
		 if (ckType[i].checked == true){
			 reason = ckType[i].value;
			 break;
		 }
		if (i == ckType.length-1){
		 alert("회원탈퇴 사유를 선택하세요");
		}
	}
	
	if(ckType[5].checked == true){
		if(document.delete_form.etc_text.value == ""){
			alert("기타 내용을 입력하세요.")
		}
	}
	
	if(document.getElementsByName("delete")[0].isChecked == false){
		alert("회원 탈퇴에 동의하세요");
	}else{
		
	document.delete_form.submit();
	}
}











