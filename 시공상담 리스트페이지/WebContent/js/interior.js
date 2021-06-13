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