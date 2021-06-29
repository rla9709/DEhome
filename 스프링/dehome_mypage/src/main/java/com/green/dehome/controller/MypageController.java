package com.green.dehome.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.dehome.dto.MypageDTO;
import com.green.dehome.service.MypageService;

@Controller
public class MypageController {
	@Inject MypageService service;
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	//mypage 메인
	@RequestMapping(value = "/mypage/mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) throws Exception{
		return "mypage/mypage";
	}
	
	//회원정보 가져오기
	@RequestMapping(value = "/mypage/edit_account", method = RequestMethod.GET)
	public String getView(HttpSession session, Model model) throws Exception{
		String user_nick = session.getAttribute("nickname").toString();
		System.out.println("user_nick "+user_nick);
		MypageDTO dto = service.getUser(user_nick);
		model.addAttribute("userInfo",dto);
		return "mypage/edit_account";
	}
	
	// 회원정보 수정
	@RequestMapping(value = "/mypage/edit_account", method = RequestMethod.POST)
	public String editUser(HttpSession session,HttpServletRequest request, MypageDTO dto, HttpServletResponse response) throws Exception{
		
		String user_nick = session.getAttribute("nickname").toString();
		
		String db_user_pw = service.getPw(user_nick); //db 원래 비번
		String pre_pw = request.getParameter("pre_pw");
		
		System.out.println("db 비번 "+db_user_pw);
		System.out.println("입력받은 원래비번"+pre_pw);
		
		if (db_user_pw.equals(pre_pw)) {
			service.editUser(dto);
		}
		
		/* 입력받은 비밀번호가 다른 경우 */
//		else {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();	
//			out.println("<script>alert('기존 비밀번호를 확인하세요'); history.go(-1);</script>");
//			out.flush();
//		}
		return "redirect:/mypage/edit_account";
	}
	
	
//	// 회원정보 수정
//	@RequestMapping(value = "/mypage/edit_account", method = RequestMethod.POST)
//	public String editUser(HttpSession session,HttpServletRequest request, MypageDTO dto, HttpServletResponse response) throws Exception{
//		
//		String user_nick = session.getAttribute("nickname").toString();
//		
//		String db_user_pw = service.getPw(user_nick); //db 원래 비번
//		String pre_pw = request.getParameter("pre_pw");
//		
//		System.out.println("db 비번 "+db_user_pw);
//		System.out.println("입력받은 원래비번"+pre_pw);
//		
//		if (db_user_pw.equals(pre_pw)) {
//			service.editUser(dto);
//		}else {
//			out.println("<script>alert('기존 비밀번호를 확인하세요'); history.go(-1);</script>");
//		}
////		String user_id = dto.getUser_id();
////		MypageDTO pre_dto = service.getUser(user_id);
////		String pre_pw = pre_dto.getUser_pw();
////		if (pre_pw.equals(dto.getUser_pw())) {
////			service.editUser(dto);
////		}
//		return "redirect:/mypage/edit_account";
//	}
	


}
