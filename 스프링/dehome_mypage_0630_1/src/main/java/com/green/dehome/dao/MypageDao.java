package com.green.dehome.dao;

import java.util.List;

import com.green.dehome.dto.InteriorReviewDTO;
import com.green.dehome.dto.MypageDTO;
import com.green.dehome.dto.TradeBoardDTO;

public interface MypageDao {

	public MypageDTO getUser(String user_nick) throws Exception;
	public void editUser(MypageDTO dto) throws Exception;
	public String getPw(String user_nick) throws Exception;
	public void deleteUser(String user_nick) throws Exception;
	public List<InteriorReviewDTO> myReview(String user_nick)throws Exception;
	public List<TradeBoardDTO> myTradeBoardList(String user_nick)throws Exception;
	public int myBoardCount(String user_nick) throws Exception;
}
