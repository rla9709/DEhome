function location_popup() {
	window.open("location_popup","location_popup","width=400, height=600, left=100, top=50");
}

function select_top(cc) {
			$(".select_second").hide();
			$("#" + cc).show();
		}

function location_ok() {

	var str = "interiorList?";
	var start = "popup_addr1="
	var addr1 = document.loc_form.popup_addr1.value;
	var add = "&popup_addr2="
	
	if(addr1 == 'seoul') {
		var addr2 = document.loc_form.seoul.value;
	} else if (addr1 == 'incheon') {
		var addr2 = document.loc_form.incheon.value;
	} else if (addr1 == 'busan') {
		var addr2 = document.loc_form.busan.value;
	} else if (addr1 == 'ulsan') {
		var addr2 = document.loc_form.ulsan.value;
	} else if (addr1 == 'gwangju') {
		var addr2 = document.loc_form.gwangju.value;
	} else if (addr1 == 'daegu') {
		var addr2 = document.loc_form.daegu.value;
	} else if (addr1 == 'daejeon') {
		var addr2 = document.loc_form.daejeon.value;
	} else if (addr1 == 'gyeonggi') {
		var addr2 = document.loc_form.gyeonggi.value;
	} else if (addr1 == 'gangwon') {
		var addr2 = document.loc_form.gangwon.value;
	} else if (addr1 == 'gyeongsangnamdo') {
		var addr2 = document.loc_form.gyeongsangnamdo.value;
	} else if (addr1 == 'gyeongsangbukdo') {
		var addr2 = document.loc_form.gyeongsangbukdo.value;
	} else if (addr1 == 'jeollanamdo') {
		var addr2 = document.loc_form.jeollanamdo.value;
	} else if (addr1 == 'jeollabukdo') {
		var addr2 = document.loc_form.jeollabukdo.value;
	} else if (addr1 == 'chungcheongnamdo') {
		var addr2 = document.loc_form.chungcheongnamdo.value;
	} else if (addr1 == 'chungcheongbukdo') {
		var addr2 = document.loc_form.chungcheongbukdo.value;
	} else if (addr1 == 'sejong') {
		var addr2 = document.loc_form.sejong.value;
	} else if (addr1 == 'jeju') {
		var addr2 = document.loc_form.jeju.value;
	}
	
	
	var addr = str.concat(start,addr1,add,addr2);

	opener.location.href = addr;
	window.close();
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