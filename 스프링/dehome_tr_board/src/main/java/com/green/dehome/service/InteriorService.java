package com.green.dehome.service;

import java.util.List;

import com.green.dehome.dto.InteriorDTO;

public interface InteriorService {
	public String userAddr(String user_nick) throws Exception;
	
	public String addrKor(String popup_addr1, String popup_addr2) throws Exception;
	
	public List<InteriorDTO> locList(String addr) throws Exception;
	
	public List<InteriorDTO> moreLocList(InteriorDTO dto) throws Exception;
	
	public String userComName(String user_nick) throws Exception;
	
	public InteriorDTO companyInfo(InteriorDTO dto) throws Exception;
	
	public List<InteriorDTO> comReivew(String com_name) throws Exception;
	
	public List<InteriorDTO> moreReList(InteriorDTO dto) throws Exception;
	
	public List<InteriorDTO> comExample(String com_name) throws Exception;
		
	public List<InteriorDTO> moreExList(InteriorDTO dto) throws Exception;
	
	public List<String> notInCompany() throws Exception;
	
	public void companyRegist(InteriorDTO dto) throws Exception;
	
	public void reviewRegist(InteriorDTO dto) throws Exception;
	
	public void reSum(InteriorDTO dto) throws Exception;
	
	public void reCount(InteriorDTO dto) throws Exception;
	
	public void reRating(InteriorDTO dto) throws Exception;
	
	public InteriorDTO reviewShow(InteriorDTO dto) throws Exception;
	/*
	public InteriorDTO likeOnOff(InteriorDTO dto) throws Exception;
	
	public void reviewLikeOn(InteriorDTO dto) throws Exception;
	
	public void reInterestCountUp(InteriorDTO dto) throws Exception;
	
	public void reviewLikeOff(InteriorDTO dto) throws Exception;
	
	public void reInterestCountDown(InteriorDTO dto) throws Exception;
	*/
}
