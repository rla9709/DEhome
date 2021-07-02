package com.green.dehome.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.dehome.dto.TradeDTO;

@Repository
public class TradeDAOImpl implements TradeDAO {

	@Inject SqlSession sql;
	
	@Override
	public void tradeRegister(TradeDTO dto) throws Exception {
		sql.insert("mappers.tradeMapper.register_goods", dto);
	}

	@Override
	public List<TradeDTO> tradeList(TradeDTO dto) throws Exception {
		return sql.selectList("mappers.tradeMapper.tradeList");
	}


	@Override
	public List<TradeDTO> tradeListCategory(TradeDTO dto, String category) throws Exception {
		return	sql.selectList("mappers.tradeMapper.tradeListCategory", category);
	}

	@Override
	public List<TradeDTO> tradeListMore(TradeDTO dto, int page) throws Exception {
		return sql.selectList("mappers.tradeMapper.tradeListMore", page);
	}

	@Override
	public List<TradeDTO> tradeListCategoryMore(TradeDTO dto, String category) throws Exception {
		return	sql.selectList("mappers.tradeMapper.tradeListCategoryMore", category);
	}

	@Override
	public List<TradeDTO> tradeListSearch(TradeDTO dto,String search_area) throws Exception {
		return sql.selectList("mappers.tradeMapper.tradeList_search", search_area);
	}

}
