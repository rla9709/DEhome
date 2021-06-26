function findID() {
	if(document.find_id_form.user_name.value.length == 0) {
		alert("이름을 입력해주세요.");
		document.find_id_form.user_name.focus();
		return;
	}
	
	if(document.find_id_form.user_email.value.length == 0) {
		alert("이메일을 입력해주세요.");
		document.find_id_form.user_email.focus();
		return;
	}
	
	document.find_id_form.submit();
}