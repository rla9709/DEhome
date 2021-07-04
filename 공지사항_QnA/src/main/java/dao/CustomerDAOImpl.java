package com.green.dehome.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.dehome.dto.CustomerDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO{
	@Inject
	SqlSession sqlSession;
	
	//QnA
	@Override // 목록보기
	public List<CustomerDTO> qna_list(CustomerDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mappers.customerMapper.qna_list",dto);
	}
	
	@Override //상세내용보기
	public CustomerDTO qna_show(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mappers.customerMapper.qna_show", qna_no);
	}
	
	@Override // 게시글작성
	public void qna_insert(CustomerDTO customerDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("mappers.customerMapper.qna_insert", customerDTO);
	}

	@Override //수정
	public void qna_modify(CustomerDTO customerDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("mappers.customerMapper.qna_modify", customerDTO);
	}

	@Override //삭제
	public void qna_delete(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("mappers.customerMapper.qna_delete", qna_no);
	}

	@Override //조회수증가
	public void qna_increaseViewcnt(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("mappers.customerMapper.qna_increaseViewcnt", qna_no);
	}
	
	
	//notice
	@Override // 목록보기
	public List<CustomerDTO> not_list(CustomerDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mappers.customerMapper.not_list",dto);
	}
	
	@Override //상세내용보기
	public CustomerDTO not_show(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mappers.customerMapper.not_show", qna_no);
	}
	
	@Override // 게시글작성
	public void not_insert(CustomerDTO customerDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("mappers.customerMapper.not_insert", customerDTO);
	}
	
	@Override //수정
	public void not_modify(CustomerDTO customerDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("mappers.customerMapper.not_modify", customerDTO);
	}
	
	@Override //삭제
	public void not_delete(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete("mappers.customerMapper.not_delete", qna_no);
	}
	
	@Override //조회수증가
	public void not_increaseViewcnt(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("mappers.customerMapper.not_increaseViewcnt", qna_no);
	}

}
