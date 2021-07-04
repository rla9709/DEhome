package com.green.dehome.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.green.dehome.dto.MyPageUl2DTO;
import com.green.dehome.service.MyPageUl2Service;

public class MyPageUl2Controller {

	@Inject
	MyPageUl2Service service;
	
	// 내가 작성한 인테리어 팁 리스트
	@RequestMapping(value = "/mypage/my_interior_tip", method = RequestMethod.GET)
	public ModelAndView getMyInteriorTip(HttpSession session, MyPageUl2DTO dto) throws Exception {
		// 세션에 닉네임 받아서 넣기
		String user_nick = (String) session.getAttribute("nickname");
		dto.setTip_user_nick(user_nick);
		
		ModelAndView mav = new ModelAndView();
		
		List<MyPageUl2DTO> myTipList = null;
		myTipList = service.myTipList(dto);
		mav.addObject("myTipList", myTipList);
		mav.addObject("bmuser", dto.getTip_bmuser());
		mav.addObject("nick", user_nick);
		
		return mav;
	}
	
	// 내가 북마크한 인테리어 팁 리스트
	@RequestMapping(value = "/mapage/my_bookmark", method = RequestMethod.GET)
	public ModelAndView getMyBmTip(HttpSession session, MyPageUl2DTO dto) throws Exception {
		// 세션에 닉네임 받아서 넣기
		String user_nick = (String) session.getAttribute("nickname");
		dto.setTip_user_nick(user_nick);
		
		ModelAndView mav = new ModelAndView();
		
		List<MyPageUl2DTO> myBmTipList = null;
		myBmTipList = service.myBmTipList(dto);
		mav.addObject("myBmTipList", myBmTipList);
		mav.addObject("bmuser", dto.getTip_bmuser());
		mav.addObject("nick", user_nick);
		
		return mav;
	}
}
