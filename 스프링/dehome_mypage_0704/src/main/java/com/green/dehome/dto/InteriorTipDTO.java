package com.green.dehome.dto;

import java.sql.Timestamp;
import java.util.List;

public class InteriorTipDTO {
	private int tip_no;
	private String tip_user_nick;
	private String tip_category;
	private String tip_title;
	private String tip_content;
	private String tip_file;
	private Timestamp tip_date;
	private int tip_count;
	private int tip_bookmark;
	private List<InteriorTipDTO> interiorTipList;
	
	public InteriorTipDTO() {}
	
	public InteriorTipDTO(int tip_no, String tip_user_nick, String tip_category, String tip_title, String tip_content,
			String tip_file, Timestamp tip_date, int tip_count, int tip_bookmark,
			List<InteriorTipDTO> interiorTipList) {
		this.tip_no = tip_no;
		this.tip_user_nick = tip_user_nick;
		this.tip_category = tip_category;
		this.tip_title = tip_title;
		this.tip_content = tip_content;
		this.tip_file = tip_file;
		this.tip_date = tip_date;
		this.tip_count = tip_count;
		this.tip_bookmark = tip_bookmark;
		this.interiorTipList = interiorTipList;
	}

	@Override
	public String toString() {
		return "InteriorTipDTO [tip_no=" + tip_no + ", tip_user_nick=" + tip_user_nick + ", tip_category="
				+ tip_category + ", tip_title=" + tip_title + ", tip_content=" + tip_content + ", tip_file=" + tip_file
				+ ", tip_date=" + tip_date + ", tip_count=" + tip_count + ", tip_bookmark=" + tip_bookmark + "]";
	}
	
	public List<InteriorTipDTO> getInteriorTipList() {
		return interiorTipList;
	}
	
	public void setInteriorTipList(List<InteriorTipDTO> interiorTipList) {
		this.interiorTipList = interiorTipList;
	}
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
	
}
