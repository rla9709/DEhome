package com.green.dehome.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.dehome.dto.CustomerDTO;
import com.green.dehome.service.CustomerService;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
	
	@Inject 
	CustomerService customerService;
	
	@RequestMapping("qna_list.do")
	public ModelAndView qna_list() throws Exception{
		List<CustomerDTO> qna_list  = customerService.listAll(); 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/qna_list");
		mav.addObject("qna_list", qna_list);
		return mav;
	}
	
	@RequestMapping(value="qna_write.do", method=RequestMethod.GET)
	public String qna_write() {
		return "customer/write";
	}
	
	@RequestMapping(value = "qna_insert.do", method=RequestMethod.POST)
	public String qna_insert(@ModelAttribute CustomerDTO customerDTO) throws Exception{
		customerService.create(customerDTO);
		return "redirect:qna_list.do";
	}
	
	@RequestMapping(value = "qna_view.do", method=RequestMethod.POST)
	public ModelAndView view(@RequestParam int qna_no, HttpSession session) throws Exception{
		customerService.increaseViewcnt(qna_no, session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/qna_view");
		mav.addObject("dto", customerService.read(qna_no));
		
		return mav;
	}
	
	@RequestMapping(value = "qna_update.do", method = RequestMethod.POST)
	public String update(@ModelAttribute CustomerDTO customerDTO) throws Exception{
		customerService.update(customerDTO);
		return "redirect:qna_list.do";
	}
	
	@RequestMapping(value = "qna_delete.do", method = RequestMethod.POST)
	public String delete(@RequestParam int qna_no) throws Exception{
		customerService.delete(qna_no);
		return "redirect:qna_list.do";
	}
}
