function tip_write_check() {
	if(document.tip_write_frm.tip_title.value.length == 0) {
		alert("제목을 작성해주세요.");
		tip_write_frm.tip_title.focus();
		return;
	}
	
	if(document.tip_write_frm.tip_content.value.length == 0) {
		alert("내용을 작성해주세요.");
		tip_write_frm.tip_content.focus();
		return;
	}
	document.tip_write_frm.submit();
}