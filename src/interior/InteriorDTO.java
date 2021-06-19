package interior;

import java.sql.Timestamp;

public class InteriorDTO {
	// 시공상담관련 변수
	private String in_com_name;
	private String in_com_title;
	private String in_com_addr;
	private String in_com_content;
	private String in_com_file;
	private float in_com_rating;
	private int in_com_contract;
	
	public float getIn_com_rating() {
		return in_com_rating;
	}
	public void setIn_com_rating(float in_com_rating) {
		this.in_com_rating = in_com_rating;
	}
	public int getIn_com_contract() {
		return in_com_contract;
	}
	public void setIn_com_contract(int in_com_contract) {
		this.in_com_contract = in_com_contract;
	}
	public String getIn_com_name() {
		return in_com_name;
	}
	public void setIn_com_name(String in_com_name) {
		this.in_com_name = in_com_name;
	}
	public String getIn_com_title() {
		return in_com_title;
	}
	public void setIn_com_title(String in_com_title) {
		this.in_com_title = in_com_title;
	}
	public String getIn_com_addr() {
		return in_com_addr;
	}
	public void setIn_com_addr(String in_com_addr) {
		this.in_com_addr = in_com_addr;
	}
	public String getIn_com_content() {
		return in_com_content;
	}
	public void setIn_com_content(String in_com_content) {
		this.in_com_content = in_com_content;
	}
	public String getIn_com_file() {
		return in_com_file;
	}
	public void setIn_com_file(String in_com_file) {
		this.in_com_file = in_com_file;
	}
	
	// 인테리어 팁 관련 변수
	private int tip_no;
	private String tip_user_nick;
	private String tip_category;
	private String tip_title;
	private String tip_content;
	private String tip_file;
	private Timestamp tip_date;
	private int tip_count;
	private int tip_bookmark;
	
	public String getTip_user_nick() {
		return tip_user_nick;
	}
	public void setTip_user_nick(String tip_user_nick) {
		this.tip_user_nick = tip_user_nick;
	}
	public String getTip_category() {
		return tip_category;
	}
	public void setTip_category(String tip_category) {
		this.tip_category = tip_category;
	}
	public int getTip_no() {
		return tip_no;
	}
	public void setTip_no(int tip_no) {
		this.tip_no = tip_no;
	}
	
	public String getTip_title() {
		return tip_title;
	}
	public void setTip_title(String tip_title) {
		this.tip_title = tip_title;
	}
	public String getTip_content() {
		return tip_content;
	}
	public void setTip_content(String tip_content) {
		this.tip_content = tip_content;
	}
	public String getTip_file() {
		return tip_file;
	}
	public void setTip_file(String tip_file) {
		this.tip_file = tip_file;
	}
	public Timestamp getTip_date() {
		return tip_date;
	}
	public void setTip_date(Timestamp tip_date) {
		this.tip_date = tip_date;
	}
	public int getTip_count() {
		return tip_count;
	}
	public void setTip_count(int tip_count) {
		this.tip_count = tip_count;
	}
	public int getTip_bookmark() {
		return tip_bookmark;
	}
	public void setTip_bookmark(int tip_bookmark) {
		this.tip_bookmark = tip_bookmark;
	}
}
