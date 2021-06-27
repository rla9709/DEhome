package com.green.dehome.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.green.dehome.dao.CustomerDAO;
import com.green.dehome.dto.CustomerDTO;

public class CustomerServiceImpl implements CustomerService {
	@Inject
	CustomerDAO customerDao;
	@Override
	public void create(CustomerDTO customerDTO) throws Exception {
		String title = customerDTO.getQna_title();
		String content = customerDTO.getQna_content();
		String usernick = customerDTO.getUser_nick();
		
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		usernick= usernick.replace("<", "&lt;");
		usernick= usernick.replace("<", "&gt;");
		title = title.replace(" ", "&nbsp;&nbsp;");
		usernick = usernick.replace(" ", "&nbsp;&nbsp;");
		content = content.replace("\n", "<br>");
		customerDTO.setQna_title(title);
		customerDTO.setQna_content(content);
		customerDTO.setUser_nick(usernick);
		
	}

	@Override
	public CustomerDTO read(int qna_no) throws Exception {
		// TODO Auto-generated method stub
		return customerDao.read(qna_no);
	}

	@Override
	public void update(CustomerDTO customerDTO) throws Exception {
		customerDao.update(customerDTO);
		
	}

	@Override
	public void delete(int qna_no) throws Exception {
		customerDao.delete(qna_no);
		
	}

	@Override
	public List<CustomerDTO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return customerDao.listAll();
	}

	@Override
	public void increaseViewcnt(int qna_no, HttpSession session) throws Exception {
		long update_time = 0;
		
		if(session.getAttribute("update_time_"+qna_no) != null) {
			update_time = (long)session.getAttribute("update_time_"+qna_no);
		}
		long current_time = System.currentTimeMillis();
		
		if (current_time - update_time > 5*1000) {
			customerDao.increaseViewcnt(qna_no);
			session.setAttribute("update_time_"	+qna_no, current_time);
		}
	}

}
