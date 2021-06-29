package com.green.dehome.dao;

import com.green.dehome.dto.MypageDTO;

public interface MypageDao {

	public MypageDTO getUser(String user_nick) throws Exception;
	public void editUser(MypageDTO dto) throws Exception;
	public String getPw(String user_nick) throws Exception;
}
