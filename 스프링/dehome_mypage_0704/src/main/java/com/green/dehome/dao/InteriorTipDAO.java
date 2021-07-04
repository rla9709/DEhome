package com.green.dehome.dao;

import java.util.List;

import com.green.dehome.dto.InteriorTipDTO;


public interface InteriorTipDAO {
	// 카테고리별 전체 인테리어팁 리스트 
	public List<InteriorTipDTO> tipListConstruct(InteriorTipDTO dto);
	public List<InteriorTipDTO> tipListStorage(InteriorTipDTO dto);
	public List<InteriorTipDTO> tipListDecorate(InteriorTipDTO dto);
	public List<InteriorTipDTO> tipListCleaning(InteriorTipDTO dto);
	public List<InteriorTipDTO> tipListDiy(InteriorTipDTO dto);
	public List<InteriorTipDTO> tipListReform(InteriorTipDTO dto);
	public List<InteriorTipDTO> tipListKitchen(InteriorTipDTO dto);
	public List<InteriorTipDTO> tipListLighting(InteriorTipDTO dto);
	
	// 카테고리별 인테리어팁 리스트
	public List<InteriorTipDTO> tipListCategory(InteriorTipDTO dto, String category);
	
	
	// 인테리어팁 작성
	public void tipWrite(InteriorTipDTO dto) throws Exception;
}
