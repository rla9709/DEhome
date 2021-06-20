<%@page import="customer.QnaBoardDTO"%>
<%@page import="customer.QnaBoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="trade.TradeBoardDTO"%>
<%@page import="trade.TradeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna_list.jsp</title>
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Nanum+Gothic&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../css/header_footer.css" />
    <link rel="stylesheet" href="../css/my_page.css" />
    <link rel="stylesheet" href="../css/login.css" />
    <link rel="stylesheet" href="../css/reset.css" />
    <link rel="stylesheet" href="../css/qna_board.css" />
    <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<body>
<%
// 	String qna_user_nick = "";
// 	if (request.getParameter("qna_user_nick") != null) {
// 		qna_user_nick = request.getParameter("qna_user_nick");
// 	}
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum= "1";
	}
	QnaBoardDAO dao = QnaBoardDAO.getInstance();
	String qna_user_nick = dao.getUsernick(); //db에서 usernick가져오기위한 임시메소드
// 	System.out.println(qna_user_nick);
	
	ArrayList<QnaBoardDTO> qnaBoardList = dao.qnaBoardList(pageNum);
	
	int qna_id, qna_count = 0;
	String qna_title="", qna_content="", qna_pw ="", qna_type ="", qna_process="";
	Timestamp qna_date=null;
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd hh:mm");
	
%>
<%@include file="../headerfooter/header.jsp" %>
<content>
    <center>
    	<div id = "qna_board">
    		<div id="board_title">
                 	공지사항
                <input type="button" value="글쓰기" onclick="location.href='qna_write.jsp?&pageNum=<%= pageNum %>'">
            </div>
            <table id="table" width="800" cellspacing="0" >
                <tr class="table_top">
                    <td width="40" align="center" >번호</td>
                    <td width="120" align="center" >QnA종류</td>
                    <td width="450" align="center" >제목</td>
                    <td width="60" align="center" >유저닉</td>
                    <td width="170" align="center" >날짜</td>
                    <td width="60" align="center" >조회수</td>
                    <td width="120" align="center" >처리상태</td>
                </tr>
                
                
            </table>
    	</div>
    	
        <div id="qna_board">
            <div id="board_title">
                QnA
                <input type="button" value="글쓰기" onclick="location.href='qna_write.jsp?&pageNum=<%= pageNum %>'">
            </div>

            <table id="table" width="800" cellspacing="0" >
                <tr class="table_top">
                    <td width="40" align="center" >번호</td>
                    <td width="120" align="center" >QnA종류</td>
                    <td width="450" align="center" >제목</td>
                    <td width="60" align="center" >유저닉</td>
                    <td width="170" align="center" >날짜</td>
                    <td width="60" align="center" >조회수</td>
                    <td width="120" align="center" >처리상태</td>
                </tr>
                <%
                for(int i = 0; i< qnaBoardList.size(); i++){
                	QnaBoardDTO dto = qnaBoardList.get(i);
                	
                	qna_id = dto.getQna_id();
                	qna_user_nick = dto.getQna_user_nick();
                	qna_title = dto.getQna_title();
                	qna_content = dto.getQna_content();
                	qna_count = dto.getQna_count();
                	qna_date = dto.getQna_date();
                	qna_type = dto.getQna_type();
                	qna_process = dto.getQna_process();
                	qna_pw = dto.getQna_pw();
                	
                	
                %>
                	<tr bgcolor="#f7f7f7" 
                		onmouseover="this.style.backgroundColor='#eeeeef'" 
						onmouseout="this.style.backgroundColor='#f7f7f7'">
						<td>
							<%=qna_id %>
						</td>
						<td>
							<%	
								String qnatype="";
								if(qna_type.equals("usedtrade")){
									qnatype = "중고거래";
								}else if(qna_type.equals("interrior")){
									qnatype = "인테리어";
								}else if(qna_type.equals("membership")){
									qnatype = "회원관련";
								}
							%>
							<%=qnatype %>
						</td>
						<td>
							<a href="qna_show.jsp?qna_user_nick=<%=qna_user_nick %>&qna_id=<%= qna_id %>&pageNum=<%=pageNum%>">
								<%=qna_title %>
							</a>
						</td>
						<td>
							<%=qna_user_nick %>
						</td>
						<td align="center">
							<%= sdf.format(qna_date) %>
						</td>
                		<td>
                			<%=qna_count %>
                		</td>
                		<td>
                			<%	
                				String qnaprocess = "";
                				if(qna_process.equals("processing")){
                					qnaprocess = "처리중";
                				}else if(qna_process.equals("compelete")){
                					qnaprocess = "답변완료";
                				}
                			%>
                			<%=qnaprocess %>
                		</td>
                	</tr>
                <%	
                }
                %>
                
            </table>
        </div>
    </center>
    <center id="pagenum">
	<%=QnaBoardDTO.pageNumber(4) %>
	</center>
</content>
<%@include file="../headerfooter/footer.jsp" %>


</body>
</html>