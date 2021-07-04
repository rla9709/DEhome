package com.green.dehome.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.dehome.dto.InteriorTipDTO;
import com.green.dehome.service.InteriorTipService;

@Controller
public class InteriorTipController {
	private static final Logger LOGGER = LoggerFactory.getLogger(InteriorTipController.class);
	
	@Inject
	InteriorTipService service;
	
	// 인테리어팁 전체 리스트
	@RequestMapping(value = "/interior/interiorTip", method = RequestMethod.GET)
	public ModelAndView getInteriorTip(InteriorTipDTO dto) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		List<InteriorTipDTO> tipListConstruct = null;
		tipListConstruct = service.tiplistConstruct(dto);
		mav.addObject("tipListConstruct", tipListConstruct);
		System.out.println(tipListConstruct);
		
		List<InteriorTipDTO> tipListStorage = null;
		tipListStorage = service.tipListStorage(dto);
		mav.addObject("tipListStorage", tipListStorage);
		
		List<InteriorTipDTO> tipListDecorate = null;
		tipListDecorate = service.tipListDecorate(dto);
		mav.addObject("tipListDecorate", tipListDecorate);
		
		List<InteriorTipDTO> tipListCleaning = null;
		tipListCleaning = service.tipListCleaning(dto);
		mav.addObject("tipListCleaning", tipListCleaning);
		
		List<InteriorTipDTO> tipListDiy = null;
		tipListDiy = service.tipListDiy(dto);
		mav.addObject("tipListDiy", tipListDiy);
		
		List<InteriorTipDTO> tipListReform = null;
		tipListReform = service.tipListReform(dto);
		mav.addObject("tipListReform", tipListReform);
		
		List<InteriorTipDTO> tipListKitchen = null;
		tipListKitchen = service.tipListKitchen(dto);
		mav.addObject("tipListKitchen", tipListKitchen);
		
		List<InteriorTipDTO> tipListLighting = null;
		tipListLighting = service.tipListLighting(dto);
		mav.addObject("tipListLighting", tipListLighting);
		
		mav.setViewName("interior/interiorTip");

		return mav;
	}
	
	@RequestMapping(value = "/interior/interiorTipList", method = RequestMethod.GET)
	public ModelAndView tipList(HttpServletRequest request, HttpSession session, InteriorTipDTO dto, @RequestParam String category) throws Exception {
		// 세션에 닉네임 받아서 넣기
		String user_nick = (String) session.getAttribute("nickname");
		dto.setTip_user_nick(user_nick);
		
		ModelAndView mav = new ModelAndView();
		List<InteriorTipDTO> tipListCategory = null;
		tipListCategory = service.tipListCategory(dto, category);
		mav.addObject("tipListCategory", tipListCategory);
		mav.addObject("category", category);
		return mav;
	}
	
	// 인테리어팁 작성 페이지 이동
	@RequestMapping(value = "/interior/interiorTipWrite", method = RequestMethod.GET)
	public void tipWrite() throws Exception {}
	
	// 팁 작성 성공하면 해당 카테고리의 인테리어팁 리스트로 이동
	@RequestMapping(value = "/interior/interiorTipList", method = RequestMethod.POST)
	public String tipWriteGo(HttpServletRequest request, Model model, HttpSession session, InteriorTipDTO dto) throws Exception {
		// 세션에 닉네임 받아서 넣기
		String user_nick = (String) session.getAttribute("nickname");
		dto.setTip_user_nick(user_nick);
		
		model.addAttribute("request", request);
		
		service.tipWrite(dto);
		
		return "interior/interiorTipList";
	}
}
