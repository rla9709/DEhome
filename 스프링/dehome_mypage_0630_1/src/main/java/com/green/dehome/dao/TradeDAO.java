package com.green.dehome.dao;

import java.util.List;

import com.green.dehome.dto.TradeDTO;

public interface TradeDAO {
	
	//중고거래 물품등록
	public void tradeRegister(TradeDTO dto) throws Exception; 
	//중고거래 메인화면(리스트 출력)
	public List<TradeDTO> tradeList(TradeDTO dto) throws Exception;
	//중고거래 메인화면(리스트 출력) - 더보기
	public List<TradeDTO> tradeListMore(TradeDTO dto, int page) throws Exception;
	//중고거래 메인화면 카테고리별 리스트 출력
	public List<TradeDTO> tradeListCategory(TradeDTO dto, String category) throws Exception;
	//중고거래 메인화면 카테고리별 리스트 출력 - 더보기
	public List<TradeDTO> tradeListCategoryMore(TradeDTO dto, String category) throws Exception;
	//중고거래 메인화면 동네검색시 리스트(리스트 출력)
	public List<TradeDTO> tradeListSearch(TradeDTO dto, String search_area) throws Exception;
}
