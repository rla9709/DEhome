package com.green.dehome.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.green.dehome.dto.MyPageUl2DTO;

public class MyPageUl2DAOImpl implements MyPageUl2DAO {
	
	@Inject
	private SqlSession sql;
	
	@Override
	public List<MyPageUl2DTO> myTipList(MyPageUl2DTO dto) throws Exception {
		return sql.selectList("mappers.myPageUl2Mapper.myTipList", dto);
	}

	@Override
	public List<MyPageUl2DTO> myBmTipList(MyPageUl2DTO dto) throws Exception {
		return sql.selectList("mappers.myPageUl2Mapper.myBmTipList", dto);
	}

}
