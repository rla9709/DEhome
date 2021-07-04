package com.green.dehome.service;

import java.util.List;

import com.green.dehome.dto.InteriorTipDTO;

public interface InteriorTipService {
	public List<InteriorTipDTO> tiplistConstruct(InteriorTipDTO dto) throws Exception;
	public List<InteriorTipDTO> tipListStorage(InteriorTipDTO dto) throws Exception;
	public List<InteriorTipDTO> tipListDecorate(InteriorTipDTO dto) throws Exception;
	public List<InteriorTipDTO> tipListCleaning(InteriorTipDTO dto) throws Exception;
	public List<InteriorTipDTO> tipListDiy(InteriorTipDTO dto) throws Exception;
	public List<InteriorTipDTO> tipListReform(InteriorTipDTO dto) throws Exception;
	public List<InteriorTipDTO> tipListKitchen(InteriorTipDTO dto) throws Exception;
	public List<InteriorTipDTO> tipListLighting(InteriorTipDTO dto) throws Exception;
	
	public List<InteriorTipDTO> tipListCategory(InteriorTipDTO dto, String category) throws Exception;
	
	public void tipWrite(InteriorTipDTO dto) throws Exception;
}
