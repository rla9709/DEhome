package com.green.dehome2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.dehome2.dao.TradeBoardDao;
import com.green.dehome2.dto.TradeBoardDTO;

@Service
public class TradeBoardServiceImpl implements TradeBoardService {

	@Inject
	private TradeBoardDao dao;
	
	@Override
	public void writeTradeBoard(TradeBoardDTO dto) throws Exception {
		dao.writeTradeBoard(dto);
	}

	@Override
	public List<TradeBoardDTO> tradeBoardList() throws Exception {
		return dao.tradeBoardList();
	}

	@Override
	public TradeBoardDTO showTradeBoard(int board_id) throws Exception {
		return dao.showTradeBoard(board_id);
	}

	@Override
	public void editTradeBoard(TradeBoardDTO dto) throws Exception {
		dao.editTradeBoard(dto);
	}

	@Override
	public void deleteTradeBoard(int board_id) throws Exception {
		dao.deleteTradeBoard(board_id);
	}

	@Override
	public void hitUp(int board_id) throws Exception {
		dao.hitUp(board_id);
		
	}
	
}
