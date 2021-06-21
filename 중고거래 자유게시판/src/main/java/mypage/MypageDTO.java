package mypage;

import java.sql.Timestamp;

public class MypageDTO {
	// 나의 QNA 관련 변수 
	private int qna_no;
	private String qna_user_nick;
	private String qna_title;
	private String qna_content;
	private Timestamp qna_date;
	private int qna_count;
	private String qna_type;
	private String qna_pw;
	private String qna_process;
	
	//페이징 처리를 위한 변수
	public static int myqna_pageSize = 20;
	public static int myqna_pageCount = 100;
	public static int myqna_pageNum = 1;
	
	//나의 QNA 페이징
		public static String myqna_pageNumber(int limit) {
	    	String str = "";
	    	int temp = (myqna_pageNum - 1) % limit;
	    	int startPage = myqna_pageNum - temp; // pageNum - (pageNum - 1) % limit
	    	
	    	if((startPage - limit) > 0) {
	    		str = "<a href='my_qna.jsp?pageNum="+(startPage-1)+"'>[이전]</a>&nbsp;&nbsp;";
	    	}
	    	
	    	for (int i = startPage; i < (startPage+limit); i++) {
				if (i == myqna_pageNum) {
					str += "["+i+"]&nbsp;&nbsp;";
				} else {
					str += "<a href='my_qna.jsp?pageNum="+i+"'>["+ i + "]</a>&nbsp;&nbsp;";
				}
				
				if (i >= myqna_pageCount) {
					break;
				}
			}
	    	
	    	if ((startPage + limit) <= myqna_pageCount) {
				str += "<a href='my_qna.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
			}
	    	
	    	return str;
	    }
	
	public String getQna_process() {
		return qna_process;
	}
	public void setQna_process(String qna_process) {
		this.qna_process = qna_process;
	}
		
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_user_nick() {
		return qna_user_nick;
	}
	public void setQna_user_nick(String qna_user_nick) {
		this.qna_user_nick = qna_user_nick;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Timestamp getQna_date() {
		return qna_date;
	}
	public void setQna_date(Timestamp qna_date) {
		this.qna_date = qna_date;
	}
	public int getQna_count() {
		return qna_count;
	}
	public void setQna_count(int qna_count) {
		this.qna_count = qna_count;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public String getQna_pw() {
		return qna_pw;
	}
	public void setQna_pw(String qna_pw) {
		this.qna_pw = qna_pw;
	}
	
	
	//연진님 MypageDTO
	private String user_nick;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String user_email2;
	private String user_addr1;
	private String user_addr2;
	private String user_addr3;
	private String user_addr4;
	private String user_sex;
	private Timestamp reg_date;
	private int user_pnum;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_email2() {
		return user_email2;
	}
	public void setUser_email2(String user_email2) {
		this.user_email2 = user_email2;
	}
	public String getUser_addr1() {
		return user_addr1;
	}
	public void setUser_addr1(String user_addr1) {
		this.user_addr1 = user_addr1;
	}
	public String getUser_addr2() {
		return user_addr2;
	}
	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}
	public String getUser_addr3() {
		return user_addr3;
	}
	public void setUser_addr3(String user_addr3) {
		this.user_addr3 = user_addr3;
	}
	public String getUser_addr4() {
		return user_addr4;
	}
	public void setUser_addr4(String user_addr4) {
		this.user_addr4 = user_addr4;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getUser_pnum() {
		return user_pnum;
	}
	public void setUser_pnum(int user_pnum) {
		this.user_pnum = user_pnum;
	}



	
	
}
