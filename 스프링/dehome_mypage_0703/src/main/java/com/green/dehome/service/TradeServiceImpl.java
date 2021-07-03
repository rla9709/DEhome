package com.green.dehome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.dehome.dao.TradeDAO;
import com.green.dehome.dto.TradeDTO;

@Service
public class TradeServiceImpl implements TradeService {
	
	@Inject
	TradeDAO dao;

	@Override
	public void tradeRegister(TradeDTO dto) throws Exception {
		dao.tradeRegister(dto);
	}

	@Override
	public List<TradeDTO> tradeList(TradeDTO dto) throws Exception {
		return dao.tradeList(dto);
	}

	@Override
	public List<TradeDTO> tradeListSearch(TradeDTO dto,String search_area) throws Exception {
		return dao.tradeListSearch(dto,search_area);
	}

	@Override
	public List<TradeDTO> tradeListCategory(TradeDTO dto, String category) throws Exception {
		return dao.tradeListCategory(dto,category);
	}

	@Override
	public List<TradeDTO> tradeListMore(TradeDTO dto, int page) throws Exception {
		return dao.tradeListMore(dto, page);
	}

	@Override
	public List<TradeDTO> tradeListCategoryMore(TradeDTO dto, String category) throws Exception {
		return dao.tradeListCategoryMore(dto, category);
	}

	@Override
	public TradeDTO tradeShow(TradeDTO dto, int tr_no) {
		return dao.tradeShow(dto, tr_no);
	}

	@Override
	public String getAddr2(String user_nick) {
		return dao.getAddr2(user_nick);
	}

	@Override
	public void setCount(int tr_no) {
		dao.setCount(tr_no);
	}
	
}
