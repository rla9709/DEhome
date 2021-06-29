package com.green.dehome.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.dehome.dto.MypageDTO;

@Repository
public class MypageDaoImpl implements MypageDao{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public MypageDTO getUser(String user_nick) throws Exception {
		return sqlSession.selectOne("mappers.mypageMapper.getUser",user_nick);
	}

	@Override
	public void editUser(MypageDTO dto) throws Exception {
		sqlSession.update("mappers.mypageMapper.editUser", dto);
	}

	@Override
	public String getPw(String user_nick) throws Exception {
		return sqlSession.selectOne("mappers.mypageMapper.getPw",user_nick);
	}

}
