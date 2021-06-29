package com.green.dehome.service;

import com.green.dehome.dto.MypageDTO;

public interface MypageService {

	public MypageDTO getUser(String user_nick) throws Exception;
	public void editUser(MypageDTO dto) throws Exception;
	public String getPw(String user_nick) throws Exception;
}
