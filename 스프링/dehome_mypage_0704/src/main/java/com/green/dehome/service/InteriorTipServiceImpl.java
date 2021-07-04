package com.green.dehome.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.green.dehome.dao.InteriorTipDAO;
import com.green.dehome.dto.InteriorTipDTO;
import com.green.dehome.dto.TradeDTO;

@Service
public class InteriorTipServiceImpl implements InteriorTipService {
	
	@Inject
	private InteriorTipDAO dao;
	
	@Override
	public List<InteriorTipDTO> tiplistConstruct(InteriorTipDTO dto) throws Exception {
		return dao.tipListConstruct(dto);
	}


	@Override
	public List<InteriorTipDTO> tipListStorage(InteriorTipDTO dto) throws Exception {
		return dao.tipListStorage(dto);
	}

	@Override
	public List<InteriorTipDTO> tipListDecorate(InteriorTipDTO dto) throws Exception {
		return dao.tipListDecorate(dto);
	}

	@Override
	public List<InteriorTipDTO> tipListCleaning(InteriorTipDTO dto) throws Exception {
		return dao.tipListCleaning(dto);
	}

	@Override
	public List<InteriorTipDTO> tipListDiy(InteriorTipDTO dto) throws Exception {
		return dao.tipListDiy(dto);
	}

	@Override
	public List<InteriorTipDTO> tipListReform(InteriorTipDTO dto) throws Exception {
		return dao.tipListReform(dto);
	}

	@Override
	public List<InteriorTipDTO> tipListKitchen(InteriorTipDTO dto) throws Exception {
		return dao.tipListKitchen(dto);
	}

	@Override
	public List<InteriorTipDTO> tipListLighting(InteriorTipDTO dto) throws Exception {
		return dao.tipListLighting(dto);
	}

	@Override
	public List<InteriorTipDTO> tipListCategory(InteriorTipDTO dto, String category) throws Exception {
		return dao.tipListCategory(dto, category);
	}
	
	@Override
	public void tipWrite(InteriorTipDTO dto) throws Exception {
		dao.tipWrite(dto);
	}
	
}
