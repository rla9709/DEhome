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
	
	
}
