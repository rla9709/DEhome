package com.green.dehome.service;

import java.util.List;

import javax.inject.Inject;

import com.green.dehome.dao.MyPageUl2DAO;
import com.green.dehome.dto.MyPageUl2DTO;

public class MyPageUl2ServiceImpl implements MyPageUl2Service {
	
	@Inject
	private MyPageUl2DAO dao;
	
	@Override
	public List<MyPageUl2DTO> myTipList(MyPageUl2DTO dto) throws Exception {
		return dao.myTipList(dto);
	}

	@Override
	public List<MyPageUl2DTO> myBmTipList(MyPageUl2DTO dto) throws Exception {
		return dao.myBmTipList(dto);
	}

}
