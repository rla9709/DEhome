package com.green.dehome.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.dehome.dto.InteriorTipDTO;

@Repository
public class InteriorTipDAOImpl implements InteriorTipDAO {
	
	@Inject
	private SqlSession sql;
	
	@Override
	public List<InteriorTipDTO> tipListConstruct(InteriorTipDTO dto) {
		return sql.selectList("mappers.interiorTipMapper.tipListConstruct", dto);
	}

	@Override
	public List<InteriorTipDTO> tipListStorage(InteriorTipDTO dto) {
		return sql.selectList("mappers.interiorTipMapper.tipListStorage", dto);
	}

	@Override
	public List<InteriorTipDTO> tipListDecorate(InteriorTipDTO dto) {
		return sql.selectList("mappers.interiorTipMapper.tipListDecorate", dto);
	}

	@Override
	public List<InteriorTipDTO> tipListCleaning(InteriorTipDTO dto) {
		return sql.selectList("mappers.interiorTipMapper.tipListCleaning", dto);
	}

	@Override
	public List<InteriorTipDTO> tipListDiy(InteriorTipDTO dto) {
		return sql.selectList("mappers.interiorTipMapper.tipListDiy", dto);
	}

	@Override
	public List<InteriorTipDTO> tipListReform(InteriorTipDTO dto) {
		return sql.selectList("mappers.interiorTipMapper.tipListReform", dto);
	}

	@Override
	public List<InteriorTipDTO> tipListKitchen(InteriorTipDTO dto) {
		return sql.selectList("mappers.interiorTipMapper.tipListKitchen", dto);
	}

	@Override
	public List<InteriorTipDTO> tipListLighting(InteriorTipDTO dto) {
		return sql.selectList("mappers.interiorTipMapper.tipListLighting", dto);
	}
	
	@Override
	public List<InteriorTipDTO> tipListCategory(InteriorTipDTO dto, String category) {
		return sql.selectList("mappers.interiorTipMapper.tipListCategory", category);
	}
	
	@Override
	public void tipWrite(InteriorTipDTO dto) throws Exception {
		sql.insert("mappers.interiorTipMapper.tipWrite", dto);
	}

}