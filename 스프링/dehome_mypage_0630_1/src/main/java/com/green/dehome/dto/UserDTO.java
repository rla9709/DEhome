package com.green.dehome.dto;
import java.sql.Timestamp;

public class UserDTO {
	private String user_nick;
	private String user_id;
	private String user_pw;
	private String user_name;
	private int user_pnum;
	private String user_email;
	private String user_email2;
	private String user_sex;
	private String user_addr1;
	private String user_addr2;
	private String user_addr3;
	private String user_addr4;
	private Timestamp reg_date;
	private String com_name;
	private String login_type;

	///////select user이메일 선택값일때////////
	private String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	//////////////////////////////////
	public String getLogin_type() {
		return login_type;
	}
	public void setLogin_type(String login_type) {
		this.login_type = login_type;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUser_pnum() {
		return user_pnum;
	}
	public void setUser_pnum(int user_pnum) {
		this.user_pnum = user_pnum;
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
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
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
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "RegisterDTO [user_nick=" + user_nick + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_name="
				+ user_name + ", user_pnum=" + user_pnum + ", user_email=" + user_email + ", user_email2=" + user_email2
				+ ", user_sex=" + user_sex + ", user_addr1=" + user_addr1 + ", user_addr2=" + user_addr2
				+ ", user_addr3=" + user_addr3 + ", user_addr4=" + user_addr4 + ", reg_date=" + reg_date + ", com_name="
				+ com_name + "]";
	}
}
