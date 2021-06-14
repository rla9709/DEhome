package trade;

import java.sql.Timestamp;

public class TradeBoardDTO {
	private int tr_board_id;
	private String tr_user_nick;
	private String tr_board_title;
	private String tr_board_content;
	private Timestamp tr_board_date;
   	private int tr_board_count;
   	private String tr_board_pw;
	public static int pageSize = 10;
	public static int pageCount = 1;
	public static int pageNum = 1;
	
	public static String pageNumber(int limit){
		String str = "";
		int temp = (pageNum - 1) % limit;
		int startPage = pageNum - temp;
		
		if ((startPage - limit)>0) {
			str = "<a href = 'tr_board_list.jsp?pageNum="+(startPage - 1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		for (int i = startPage; i < (startPage+limit); i++) {
			if (i == pageNum) {
				str += "["+i+"]&nbsp;&nbsp;";
			}else {
				str += "<a href='tr_board_list.jsp?pageNum="+i+"'>["+i+"]</a>&nbsp;&nbsp;";
			}
			if (i >= pageCount) {
				break;
			}
		}
		if ((startPage + limit) <= pageCount) {
			str += "<a href='tr_board_list.jsp?pageNum="+(startPage+limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	

	public int getTr_board_id() {
		return tr_board_id;
	}
	public void setTr_board_id(int tr_board_id) {
		this.tr_board_id = tr_board_id;
	}
	public String getTr_user_nick() {
		return tr_user_nick;
	}
	public void setTr_user_nick(String tr_user_nick) {
		this.tr_user_nick = tr_user_nick;
	}
	public String getTr_board_title() {
		return tr_board_title;
	}
	public void setTr_board_title(String tr_board_title) {
		this.tr_board_title = tr_board_title;
	}
	public String getTr_board_content() {
		return tr_board_content;
	}
	public void setTr_board_content(String tr_board_content) {
		this.tr_board_content = tr_board_content;
	}
	public Timestamp getTr_board_date() {
		return tr_board_date;
	}
	public void setTr_board_date(Timestamp tr_board_date) {
		this.tr_board_date = tr_board_date;
	}
	public int getTr_board_count() {
		return tr_board_count;
	}
	public void setTr_board_count(int tr_board_count) {
		this.tr_board_count = tr_board_count;
	}
	public String getTr_board_pw() {
		return tr_board_pw;
	}
	public void setTr_board_pw(String tr_board_pw) {
		this.tr_board_pw = tr_board_pw;
	}


   	
}
