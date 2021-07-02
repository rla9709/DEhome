package com.green.dehome.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.dehome.dto.InteriorReviewDTO;
import com.green.dehome.dto.MyTradeDTO;
import com.green.dehome.dto.MypageDTO;
import com.green.dehome.dto.TradeBoardDTO;
import com.green.dehome.dto.TradeBoardPaging;
import com.green.dehome.service.MypageService;
import com.green.dehome.service.TradeBoardService;
import com.green.dehome.service.UserService;

@Controller
public class MypageController {
	@Inject MypageService service;
	@Inject UserService userService;
	@Inject TradeBoardService tradeBoardservice;
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
/*  mypage 메인  */
	//나의 판매 상품
	@RequestMapping(value = "/mypage/mypage", method = RequestMethod.GET)
	public String myTradeList(HttpSession session, Model model) throws Exception {
		String user_nick = session.getAttribute("nickname").toString();
		
		MypageDTO mypageDto = null; 
//		model.addAttribute("userInfo",mypageDto);
		//------ 진행중인 거래 -------//
		List<MyTradeDTO> list1 = service.myTradeList(user_nick);
		for (int i = 0; i < list1.size(); i++) {
			MyTradeDTO dto = list1.get(i);
			
			int trade_no = dto.getTrade_no();
			
			int sumInterest = service.sumInterest(trade_no);
			
			if (sumInterest != 0) {
				list1.get(i).setTrade_interest(sumInterest);
			}else {
				list1.get(i).setTrade_interest(0);
			}
			
			mypageDto = service.getUser(dto.getUser_nick());
			dto.setUser_addr2(mypageDto.getUser_addr2());
		}
		model.addAttribute("tr_list", list1);
		
		//------ 판매 내역 -------//
		List<MyTradeDTO> list2 = service.mySellList(user_nick);
		//좋아요 수 
		for (int i = 0; i < list2.size(); i++) {
			MyTradeDTO dto = list2.get(i);
			
			int trade_no = dto.getTrade_no();
			
			int sumInterest = service.sumInterest(trade_no);
			
			if (sumInterest != 0) {
				list2.get(i).setTrade_interest(sumInterest);
			}else {
				list2.get(i).setTrade_interest(0);
			}
		}
		model.addAttribute("tr_sell_list", list2);
		
		//------ 구매 내역------//
		List<MyTradeDTO> list3 = service.myBuyList(user_nick);
		//좋아요 수 
		for (int i = 0; i < list3.size(); i++) {
			MyTradeDTO dto = list3.get(i);
			
			int trade_no = dto.getTrade_no();
			
			int sumInterest = service.sumInterest(trade_no);
			
			if (sumInterest != 0) {
				list3.get(i).setTrade_interest(sumInterest);
			}else {
				list3.get(i).setTrade_interest(0);
			}
			mypageDto = service.getUser(dto.getUser_nick());
			dto.setUser_addr2(mypageDto.getUser_addr2());
		}
		model.addAttribute("tr_buy_list", list3);
		
		
		MypageDTO dto = service.getUser(user_nick);
		model.addAttribute("userInfo",dto);
		
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

	//회원탈퇴 페이지
		@RequestMapping(value = "/mypage/delete_account", method = RequestMethod.GET)
		public String deleteView(HttpSession session, Model model) throws Exception{
//			String user_nick = session.getAttribute("nickname").toString();
//			System.out.println("user_nick "+user_nick);
//			MypageDTO dto = service.getUser(user_nick);
//			model.addAttribute("userInfo",dto);
			return "mypage/delete_account";
		}
	
	//회원 탈퇴 실행
	@RequestMapping(value = "/mypage/delete_account", method = RequestMethod.POST)
	public String deleteUser(HttpSession session, HttpServletResponse response) throws Exception {
		String user_nick = session.getAttribute("nickname").toString();
		service.deleteUser(user_nick);
		session.invalidate();
//		userService.logout(response);
		
		return "redirect:../main/mainpage";
	}
	
	//내가 쓴 글 - 자유게시판 
	@RequestMapping(value = "/mypage/my_trade_board", method = RequestMethod.GET)
	public String myTradeBoardList(HttpSession session, Model model,@RequestParam(defaultValue="1") int curPage) throws Exception {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		String user_nick = session.getAttribute("nickname").toString();
		map.put("user_nick", user_nick);
		
		//페이지 시작 인덱스 
		System.out.println("현재 페이지"+curPage);
		int startIndex = (curPage-1 )*10;
		System.out.println("시작 페이지"+startIndex);
		map.put("startIndex", startIndex);
		
		//리스트 받아오기
		List<TradeBoardDTO> list  = service.myTradeBoardList(map);
		model.addAttribute("list", list);
		
		//내가 쓴 글 갯수
		int listCnt = service.myBoardCount(user_nick);
		model.addAttribute("listCnt", listCnt);
		
		//페이징
		TradeBoardPaging pagingDto = new TradeBoardPaging(listCnt, curPage);
		model.addAttribute("paging", pagingDto);
		
		return "mypage/my_trade_board";
	}
	
//	//내가 쓴 글 - 자유게시판 
//	@RequestMapping(value = "/mypage/my_trade_board", method = RequestMethod.GET)
//	public String myTradeBoardList(HttpSession session, Model model,@RequestParam(defaultValue="1") int curPage) throws Exception {
//		
//		String user_nick = session.getAttribute("nickname").toString();
//		
//		//페이지 시작 인덱스 
//		System.out.println("현재 페이지"+curPage);
//		int startIndex = (curPage-1 )*10;
//		System.out.println("시작 페이지"+startIndex);
//		
//		//리스트 받아오기
//		List<TradeBoardDTO> list  = service.myTradeBoardList(user_nick);
//		model.addAttribute("list", list);
//		
//		//내가 쓴 글 갯수
//		int listCnt = service.myBoardCount(user_nick);
//		model.addAttribute("listCnt", listCnt);
//		
//		//페이징
//		TradeBoardPaging pagingDto = new TradeBoardPaging(listCnt, curPage);
//		model.addAttribute("paging", pagingDto);
//		
//		return "mypage/my_trade_board";
//	}
	
	
	//내 시공리뷰
	@RequestMapping(value = "/mypage/my_review", method = RequestMethod.GET)
	public String myReview(HttpSession session, Model model) throws Exception {
		String user_nick = session.getAttribute("nickname").toString();
		List<InteriorReviewDTO> list  = service.myReview(user_nick);
		
		//기업 평점 구하기
		for (int i = 0; i < list.size(); i++) {
			InteriorReviewDTO dto = list.get(i);
			String com_name = dto.getCom_name();
			float com_rating = service.myReviewCompany(com_name);
			list.get(i).setCom_rating(com_rating);
		}
		model.addAttribute("myReview", list);
		return "mypage/my_review";
	}
	



}
