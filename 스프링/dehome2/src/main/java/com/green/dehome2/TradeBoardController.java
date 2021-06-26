package com.green.dehome2;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.dehome2.dto.TradeBoardDTO;
import com.green.dehome2.service.TradeBoardService;



@Controller
public class TradeBoardController {
	@Inject TradeBoardService service;
	private static final Logger logger = LoggerFactory.getLogger(TradeBoardController.class);
	
	@RequestMapping(value = "/trade/tr_board_write", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	
	@RequestMapping(value = "/trade/tr_board_write", method = RequestMethod.POST)
	public String writeTradeBoard(TradeBoardDTO dto) throws Exception {
//		if (Integer.toString(dto.getTr_board_id()) == null) {
//			dto.setTr_board_id(1);
//		}
		logger.info("write");
		service.writeTradeBoard(dto);
		return "redirect:/trade/tr_board_list";
	}
	

	@RequestMapping(value = "/trade/tr_board_list", method = RequestMethod.GET)
	public void tradeBoardList(Model model) throws Exception{
		List<TradeBoardDTO> list = service.tradeBoardList();
		
		model.addAttribute("list", list);
	}
	
	// 게시판 글 가져오기(조회)
	@RequestMapping(value = "/trade/tr_board_show", method = RequestMethod.GET)
	public void showTradeBoard(@RequestParam("board_id") int board_id, Model model) throws Exception{
		service.hitUp(board_id);
		TradeBoardDTO dto = service.showTradeBoard(board_id);
		model.addAttribute("show",dto);
	}
		
	// 게시판 글 수정
	@RequestMapping(value = "/trade/tr_board_edit", method = RequestMethod.GET)
	public void editView(@RequestParam("board_id") int board_id, Model model) throws Exception{
		TradeBoardDTO dto = service.showTradeBoard(board_id);
		
		model.addAttribute("show",dto);
	}
	
	@RequestMapping(value = "/trade/tr_board_edit", method = RequestMethod.POST)
	public String editTradeBoard(TradeBoardDTO dto) throws Exception{
		service.editTradeBoard(dto);
		
		return "redirect:/trade/tr_board_list";
	}
	
//	// 게시물 삭제
//	@RequestMapping(value = "/trade/tr_board_delete", method = RequestMethod.GET)
//	public void deleteView(@RequestParam("board_id") int board_id, Model model) throws Exception{
//		TradeBoardDTO dto = service.showTradeBoard(board_id);
//		
//		model.addAttribute("show",dto);
//	}
//	
	// 게시물 삭제
	@RequestMapping(value = "/trade/tr_board_delete", method = RequestMethod.GET)
	public String deleteTradeBoard(@RequestParam("board_id") int board_id) throws Exception {
	  
	 service.deleteTradeBoard(board_id);  

	 return "redirect:/trade/tr_board_list";
	}
	
//	public void getListPage(Model model, @RequestParam("num") int num )throws Exception {
//		PagingDto page = new PagingDto();
//		
//		page.setNum(num);
//		page.setCount(service.count());  
//
//		List list = null; 
//		list = service.listPage(page.getDisplayPost(), page.getPostNum());
//
//		model.addAttribute("list", list);   
//		model.addAttribute("page",page);
//		model.addAttribute("select", num);
//	}
	

	


	
	
	
	
	
}
