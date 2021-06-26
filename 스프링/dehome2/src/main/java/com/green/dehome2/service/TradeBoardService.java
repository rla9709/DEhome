package com.green.dehome2.service;

import java.util.List;

import com.green.dehome2.dto.TradeBoardDTO;


public interface TradeBoardService {
	
	public void writeTradeBoard(TradeBoardDTO dto) throws Exception;
	public List<TradeBoardDTO> tradeBoardList() throws Exception;
	public TradeBoardDTO showTradeBoard(int board_id) throws Exception;
	public void editTradeBoard(TradeBoardDTO dto) throws Exception;
	// 게시물 삭제
	public void deleteTradeBoard(int board_id) throws Exception;
	public void hitUp(int board_id) throws Exception;
}