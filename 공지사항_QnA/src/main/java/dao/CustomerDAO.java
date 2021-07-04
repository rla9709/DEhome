package com.green.dehome.dao;

import java.util.List;

import com.green.dehome.dto.CustomerDTO;

public interface CustomerDAO {
	//QNA
	//게시글전체목록
	public List<CustomerDTO> qna_list(CustomerDTO dto)  throws Exception;
	//게시글상세보기
	public CustomerDTO qna_show(int qna_no) throws Exception;
	//게시글작성
	public void qna_insert(CustomerDTO customerDTO) throws Exception;
	//게시글수정
	public void qna_modify(CustomerDTO customerDTO) throws Exception;
	//게시글삭제
	public void qna_delete(int qna_no) throws Exception;
	//게시글조회수증가
	public void qna_increaseViewcnt(int qna_no) throws Exception;

	//Notice
	//게시글전체목록
	public List<CustomerDTO> not_list(CustomerDTO dto)  throws Exception;
	//게시글상세보기
	public CustomerDTO not_show(int not_no) throws Exception;
	//게시글작성
	public void not_insert(CustomerDTO customerDTO) throws Exception;
	//게시글수정
	public void not_modify(CustomerDTO customerDTO) throws Exception;
	//게시글삭제
	public void not_delete(int not_no) throws Exception;
	//게시글조회수증가
	public void not_increaseViewcnt(int not_no) throws Exception;
}
