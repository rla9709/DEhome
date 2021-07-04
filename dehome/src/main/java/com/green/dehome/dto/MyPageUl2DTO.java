package com.green.dehome.dto;

import java.sql.Timestamp;

public class MyPageUl2DTO {
	//내가 작성한 인테리어팁 관련 변수
	private int tip_no;
	private String tip_user_nick;
	private String tip_category;
	private String tip_title;
	private String tip_content;
	private String tip_file;
	private Timestamp tip_date;
	private int tip_count;
	private int tip_bookmark;
	// 해당 글 북마크 추가한 유저 변수
	private String tip_bmuser;
	//이미지 파일 업로드 썸네일
	private String tip_thumb;
	
	public int getTip_no() {
		return tip_no;
	}
	public void setTip_no(int tip_no) {
		this.tip_no = tip_no;
	}
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
	public String getTip_bmuser() {
		return tip_bmuser;
	}
	public void setTip_bmuser(String tip_bmuser) {
		this.tip_bmuser = tip_bmuser;
	}
	public String getTip_thumb() {
		return tip_thumb;
	}
	public void setTip_thumb(String tip_thumb) {
		this.tip_thumb = tip_thumb;
	}
	
	
	
	
	// 내가 작성한 게시물 관련 변수
	private int board_id;
	private String user_nick;
	private String board_title;
	private String board_content;
	private Timestamp board_date;
   	private int board_count;
   	private String board_pw;
   	private int board_pagenum;
   	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getUser_nick() {
		return user_nick;
	}
	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public String getBoard_pw() {
		return board_pw;
	}
	public void setBoard_pw(String board_pw) {
		this.board_pw = board_pw;
	}
	public int getBoard_pagenum() {
		return board_pagenum;
	}
	public void setBoard_pagenum(int board_pagenum) {
		this.board_pagenum = board_pagenum;
	}
   	
}
