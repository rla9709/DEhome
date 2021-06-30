package com.green.dehome.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.dehome.dto.InteriorReviewDTO;
import com.green.dehome.dto.MypageDTO;
import com.green.dehome.dto.TradeBoardDTO;

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

	@Override
	public void deleteUser(String user_nick) throws Exception {
		sqlSession.delete("mappers.mypageMapper.deleteUser",user_nick);
	}

	@Override
	public List<InteriorReviewDTO> myReview(String user_nick) throws Exception {
		return sqlSession.selectList("mappers.mypageMapper.myReview",user_nick);
	}

	@Override
	public List<TradeBoardDTO> myTradeBoardList(String user_nick) throws Exception {
		return sqlSession.selectList("mappers.mypageMapper.myTradeBoardList",user_nick);
	}

	@Override
	public int myBoardCount(String user_nick) throws Exception {
		return sqlSession.selectOne("mappers.mypageMapper.myBoardCount",user_nick);
	}

}
