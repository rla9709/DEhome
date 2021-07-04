package com.green.dehome.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.green.dehome.dao.CustomerDAO;
import com.green.dehome.dto.CustomerDTO;

@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService {
	@Inject
	CustomerDAO customerDao;
	
	//QnA
	@Override // 게시글전체목록
	public List<CustomerDTO> qna_list(CustomerDTO dto) throws Exception {
		return customerDao.qna_list(dto);
	}
	
//	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override // 게시글상세보기
	public CustomerDTO qna_show(int qna_no) throws Exception {
		customerDao.qna_increaseViewcnt(qna_no);
		return customerDao.qna_show(qna_no);
	}

	@Override // 게시글작성
	public void qna_insert(CustomerDTO customerDTO) throws Exception {
		customerDao.qna_insert(customerDTO);
	}

	@Override // 게시글수정
	public void qna_modify(CustomerDTO customerDTO) throws Exception {
		customerDao.qna_modify(customerDTO);

	}

	@Override // 게시글삭제
	public void qna_delete(int qna_no) throws Exception {
		customerDao.qna_delete(qna_no);

	}
	
	//Notice
	@Override // 게시글전체목록
	public List<CustomerDTO> not_list(CustomerDTO dto) throws Exception {
		return customerDao.not_list(dto);
	}
	
//	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override // 게시글상세보기
	public CustomerDTO not_show(int not_no) throws Exception {
		customerDao.not_increaseViewcnt(not_no);
		return customerDao.not_show(not_no);
	}
	
	@Override // 게시글작성
	public void not_insert(CustomerDTO customerDTO) throws Exception {
		customerDao.not_insert(customerDTO);
	}
	
	@Override // 게시글수정
	public void not_modify(CustomerDTO customerDTO) throws Exception {
		customerDao.not_modify(customerDTO);
		
	}
	
	@Override // 게시글삭제
	public void not_delete(int not_no) throws Exception {
		customerDao.not_delete(not_no);
		
	}
	

}
