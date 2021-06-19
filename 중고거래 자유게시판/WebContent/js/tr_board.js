function write_ok(){
	
	if(document.form.tr_b_title.value ==""){
		alert("제목을 입력하세요.");
		form.tr_b_title.focus();
		return;
	}
	if(document.form.tr_b_content.value == ""){
		alert("내용을 입력하세요.");
		form.tr_b_content.focus();
		return;
	}
	if(document.form.tr_b_pw.value ==""){
		alert("비밀번호를 입력하세요.");
		form.tr_b_pw.focus();
		return;
	}

	document.form.submit();
	
}

function delete_ok(){
	if(document.delete_form.tr_b_pw.value ==""){
		alert("비밀번호를 입력하세요.");
		delete_form.tr_b_pw.focus();
		return;
	}
	document.delete_form.submit();
}

function no() {
		alert("로그인 후 이용하세요");
		
	}