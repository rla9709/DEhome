<%@page import="Register.RegisterDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="register" class="Register.RegisterDTO"></jsp:useBean>
<jsp:setProperty property="*" name="register"/>
<%
	/*--REG_DATE 설정--*/
	register.setReg_date(new Timestamp(System.currentTimeMillis()));


	/*--이메일 직접입력이 아닐때 user_email2 값 셋팅--*/
	if (request.getParameter("user_email2") == null) {
		register.setUser_email2(request.getParameter("email"));
	}

	RegisterDAO rdb = RegisterDAO.getinstance();
	
	/*--전화번호 중복--*/
	int input_tel = Integer.parseInt(request.getParameter("user_pnum"));
	int re = rdb.searchTel(input_tel);
	
	/*--기업이름 중복--*/
	String input_com_name = request.getParameter("com_name");
	int com_re = rdb.searchComName(input_com_name);
	
	if (re == 1) {		
%>
		<script type="text/javascript">
			alert("중복되는 전화번호가 존재합니다.\n회원가입 여부 혹은 전화번호를 다시 확인해주세요.");
			history.go(-1);
		</script>		
<%	
	} else if (com_re == 1) {
%>
		<script type="text/javascript">
			alert("중복되는 업체명이 존재합니다.\n회원가입 여부 혹은 업체명을 다시 확인해주세요.");
			history.go(-1);
		</script>		
<%	
	} else {
		
		int rgResult = 0; // 회원가입 성공확인
		
		if (request.getParameter("com_name") == null) {
			/*--유저용 회원가입--*/
			rgResult = rdb.insertUser(register, false);
		} else {
			/*--기업용 회원가입--*/
			rgResult = rdb.insertUser(register, true);
		}
		
		
		if (rgResult == -1) {
			%>
					<script type="text/javascript">
						alert("회원가입에 실패하였습니다.");
						history.back();
					</script>		
			<%
				} else { 
			%>
					<script type="text/javascript">
						alert("회원가입을 축하드립니다.");
						document.location.href = "../main/mainpage.jsp";
					</script>			
			<%
				}
	}
			%>
<html>
<head>
<body>

</body>
</html>