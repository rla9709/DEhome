package com.green.dehome.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.green.dehome.dto.CustomerDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO{
	@Inject
	SqlSession SqlSession;
	@Override
	public void create(CustomerDTO customerDTO) throws Exception {
		// TODO Auto-generated method stub
		SqlSession.insert("customer.qna_insert", customerDTO);
	}

	@Override
	public CustomerDTO read(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.selectOne("customer.qna_show", qna_no);
	}

	@Override
	public void update(CustomerDTO customerDTO) throws Exception {
		// TODO Auto-generated method stub
		SqlSession.update("customer.update", customerDTO);
	}

	@Override
	public void delete(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		SqlSession.insert("customer.qna_insert", qna_no);
	}

	@Override
	public List<CustomerDTO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return SqlSession.insert("customer.qna_list");;
	}

	@Override
	public void increaseViewcnt(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		SqlSession.insert("customer.increaseViewcnt", qna_no);
	}

}
