function location_popup() {
	window.open("location_popup.jsp","location_popup","width=400, height=600, left=100, top=50");
}

function location_ok() {

	var str = "interiorList.jsp?";
	var start = "popup_addr1="
	var addr1 = document.loc_form.popup_addr1.value;
	var add = "&popup_addr2="
	var addr2 = document.loc_form.popup_addr2.value;
	
	var addr = str.concat(start,addr1,add,addr2);

	opener.location.href = addr;
	window.close();
}

function login_no() {
	alert("로그인이 필요한 서비스입니다.");
	return;
}

function caseWrite_check() {
	if(document.cons_case_write_frm.in_ex_title.value.length == 0) {
		alert("제목을 입력해주세요");
		document.cons_case_write_frm.in_ex_title.focus();
		return;
	}
	if(document.cons_case_write_frm.in_ex_content.value.length == 0) {
		alert("내용을 입력해주세요");
		document.cons_case_write_frm.in_ex_content.focus();
		return;
	}
	
	document.cons_case_write_frm.submit();
}

function caseEdit_check() {
	if(document.cons_case_edit_frm.in_ex_title.value.length == 0) {
		alert("제목을 입력해주세요");
		document.cons_case_edit_frm.in_ex_title.focus();
		return;
	}
	if(document.cons_case_edit_frm.in_ex_content.value.length == 0) {
		alert("내용을 입력해주세요");
		document.cons_case_edit_frm.in_ex_content.focus();
		return;
	}
	
	document.cons_case_edit_frm.submit();
}

