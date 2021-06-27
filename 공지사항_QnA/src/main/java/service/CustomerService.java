package com.green.dehome.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.green.dehome.dto.CustomerDTO;

public interface CustomerService {
	//게시글작성
		public void create(CustomerDTO customerDTO) throws Exception;
		//게시글상세보기
		public CustomerDTO read(int qna_no) throws Exception;
		//게시글수정
		public void update(CustomerDTO customerDTO) throws Exception;
		//게시글삭제
		public void delete(int qna_no) throws Exception;
		//게시글전체목록
		public List<CustomerDTO> listAll()  throws Exception;
		//게시글조회수증가
		public void increaseViewcnt(int qna_no, HttpSession session) throws Exception;
}
