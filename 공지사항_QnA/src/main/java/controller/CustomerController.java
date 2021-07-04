package com.green.dehome.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.dehome.dto.CustomerDTO;
import com.green.dehome.service.CustomerService;

@Controller
public class CustomerController {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	CustomerService CService;
	
	@RequestMapping("qna_list")
	public ModelAndView qna_list(CustomerDTO dto) throws Exception{
		
		List<CustomerDTO> qna_list  = CService.qna_list(dto); 
		for(int i = 0; i < qna_list.size(); i++) {
			if(qna_list.get(i).getQna_type().equals("usedtrade")) {
				qna_list.get(i).setQna_type("중고거래");
			}else if(qna_list.get(i).getQna_type().equals("membership")){
				qna_list.get(i).setQna_type("회원관련");
			}else if(qna_list.get(i).getQna_type().equals("interrior")){
				qna_list.get(i).setQna_type("인테리어");
			}
		}
		for(int i = 0; i < qna_list.size(); i++) {
			if(qna_list.get(i).getQna_process().equals("processing")) {
				qna_list.get(i).setQna_process("처리중");
			}else if(qna_list.get(i).getQna_process().equals("compelete")){
				qna_list.get(i).setQna_process("답변완료");
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/customer/qna_list");
		mav.addObject("qna_list", qna_list);
		return mav;
	}
	
	@RequestMapping(value="qna_write", method=RequestMethod.GET)
	public String qna_write() {
		return "customer/qna_write"; // qna_write.jsp로 이동
	}
	
	@RequestMapping(value = "qna_insert", method=RequestMethod.POST)
	public String qna_insert(@ModelAttribute CustomerDTO customerDTO) throws Exception{
		CService.qna_insert(customerDTO);
		return "redirect:qna_list";
	}
	
	@RequestMapping(value = "/qna_show", method=RequestMethod.GET)
	public ModelAndView qna_show(@RequestParam int qna_no) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/customer/qna_show");
		mav.addObject("dto", CService.qna_show(qna_no));
		
		return mav;
	}
	
	@RequestMapping(value = "qna_modify", method = RequestMethod.POST)
	public String qna_modify(@ModelAttribute CustomerDTO customerDTO) throws Exception{
		CService.qna_modify(customerDTO);
		return "redirect:qna_list";
	}
	
	@RequestMapping(value = "qna_delete", method = RequestMethod.GET)
	public String qna_delete(@RequestParam int qna_no) throws Exception{
		CService.qna_delete(qna_no);
		return "redirect:qna_list";
	}
	
	//Notice
	@RequestMapping("not_list")
	public ModelAndView not_list(CustomerDTO dto) throws Exception{
		
		List<CustomerDTO> not_list  = CService.not_list(dto); 
		for(int i = 0; i < not_list.size(); i++) {
			if(not_list.get(i).getNot_menu().equals("usedtrade")) {
				not_list.get(i).setNot_menu("중고거래");
			}else if(not_list.get(i).getNot_menu().equals("membership")){
				not_list.get(i).setNot_menu("회원관련");
			}else if(not_list.get(i).getNot_menu().equals("interrior")){
				not_list.get(i).setNot_menu("인테리어");
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/customer/not_list");
		mav.addObject("not_list", not_list);
		return mav;
	}
	
	@RequestMapping(value="not_write", method=RequestMethod.GET)
	public String not_write() {
		return "customer/not_write"; // qna_write.jsp로 이동
	}
	
	@RequestMapping(value = "not_insert", method=RequestMethod.POST)
	public String not_insert(@ModelAttribute CustomerDTO customerDTO) throws Exception{
		CService.not_insert(customerDTO);
		return "redirect:not_list";
	}
	
	@RequestMapping(value = "not_show", method=RequestMethod.POST)
	public ModelAndView not_show(@RequestParam int not_no) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/not_show");
		mav.addObject("dto", CService.not_show(not_no));
		
		return mav;
	}
	
	@RequestMapping(value = "not_modify", method = RequestMethod.POST)
	public String not_modify(@ModelAttribute CustomerDTO customerDTO) throws Exception{
		CService.not_modify(customerDTO);
		return "redirect:not_list";
	}
	
	@RequestMapping(value = "not_delete", method = RequestMethod.POST)
	public String not_delete(@RequestParam int not_no) throws Exception{
		CService.not_delete(not_no);
		return "redirect:not_list";
	}
}
