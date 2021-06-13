package trade;

import java.sql.Timestamp;

public class TradeDTO {
	private int tr_no;
	private String tr_user_nick;
	private String tr_category;
	private String tr_title;
	private String tr_content;
	private Timestamp tr_date;
	private int tr_count;
	private int tr_evalue;
	private String tr_price;
	private String tr_photo;
	private int tr_complete; //거래완료 여부
	
	////////////////////
	//유저 주소,닉네임 집어 넣을 변수
	private String user_addr2;
	public String getUser_addr2() {
		return user_addr2;
	}
	public void setUser_addr2(String user_addr2) {
		this.user_addr2 = user_addr2;
	}
	////////////////////
	
	public int getTr_no() {
		return tr_no;
	}
	public int getTr_evalue() {
		return tr_evalue;
	}
	public void setTr_evalue(int tr_evalue) {
		this.tr_evalue = tr_evalue;
	}
	public void setTr_no(int tr_no) {
		this.tr_no = tr_no;
	}
	public String getTr_user_nick() {
		return tr_user_nick;
	}
	public void setTr_user_nick(String tr_user_nick) {
		this.tr_user_nick = tr_user_nick;
	}
	public String getTr_category() {
		return tr_category;
	}
	public void setTr_category(String tr_category) {
		this.tr_category = tr_category;
	}
	public String getTr_title() {
		return tr_title;
	}
	public void setTr_title(String tr_title) {
		this.tr_title = tr_title;
	}
	public String getTr_content() {
		return tr_content;
	}
	public void setTr_content(String tr_content) {
		this.tr_content = tr_content;
	}
	public Timestamp getTr_date() {
		return tr_date;
	}
	public void setTr_date(Timestamp tr_date) {
		this.tr_date = tr_date;
	}
	public int getTr_count() {
		return tr_count;
	}
	public void setTr_count(int tr_count) {
		this.tr_count = tr_count;
	}
	public String getTr_price() {
		return tr_price;
	}
	public void setTr_price(String tr_price) {
		this.tr_price = tr_price;
	}
	public String getTr_photo() {
		return tr_photo;
	}
	public void setTr_photo(String tr_photo) {
		this.tr_photo = tr_photo;
	}
	public int getTr_complete() {
		return tr_complete;
	}
	public void setTr_complete(int tr_complete) {
		this.tr_complete = tr_complete;
	}
}
