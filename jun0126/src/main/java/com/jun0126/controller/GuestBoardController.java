package com.jun0126.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jun0126.VO.GuestBoardVO;
import com.jun0126.VO.UserVO;
import com.jun0126.security.Auth;
import com.jun0126.security.AuthUser;
import com.jun0126.service.GuestBoardService;


@Controller
@RequestMapping( "/guestBoard" )
public class GuestBoardController {

	@Autowired
	private GuestBoardService boardService;
  
	@Auth
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("board_NO") int board_NO) {
		boardService.delete(board_NO);
		return "redirect:/guestBoard/list"; 
	}
	
	//--------------------------------------------------------------------
	//**list page
	
	@RequestMapping(value = "/list")
	public String boardList(@RequestParam(defaultValue="1") int curPage, String keyWord, Model model) {
		
		Map<String, Object> guestBoardMap = boardService.guestBoardList(curPage,keyWord); 
		model.addAttribute("guestBoardMap", guestBoardMap); 
		return "guestBoard_view/guestBoardList_View"; 
	} 
 
	@RequestMapping(value = "/viewer", method = RequestMethod.GET)
	public String viewer_form(@RequestParam("board_NO") int board_NO, Model model) {
		int totalCnt = boardService.boardTotalCnt();
		boardService.hit(board_NO);
		GuestBoardVO guestBoardVO = boardService.getBoard(board_NO);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("GuestBoardVO", guestBoardVO);
		return "guestBoard_view/guestBoardViewer_View";
	} 
	@Auth
	@RequestMapping("/writer_form")
	public String writer_form() {
		return "guestBoard_view/guestBoardWriter_View";
	}
	@Auth
	@RequestMapping(value = "/writer", method = RequestMethod.POST)
	public String writer(@AuthUser UserVO authUser, 
			@ModelAttribute GuestBoardVO boardVO) {
		boardVO.setUser_ID( authUser.getUser_ID());
		boardVO.setUser_NO( authUser.getUser_NO());
		boardService.setWriter(boardVO);
		return "redirect:/guestBoard/list";
	}
	@Auth
	@RequestMapping(value = "/modify_form", method = RequestMethod.GET)
	public String modify_form(@RequestParam("board_NO") int board_NO, Model model) {
		GuestBoardVO boardVO = boardService.getBoard(board_NO); 
		model.addAttribute("boardVO", boardVO);
		return "guestBoard_view/guestBoardModify_View"; 
	}
	@Auth
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@RequestParam("board_NO") int board_NO, GuestBoardVO boardVO, Model model) {
		System.out.println("모디파이"+boardVO);
		boardService.setModify(boardVO);
		boardService.getBoard(board_NO);
		return "redirect:/guestBoard/viewer?board_NO=" + board_NO;
	}
	@Auth
	@RequestMapping(value = "/reply_form", method = RequestMethod.GET)
	public String reply_form(@AuthUser UserVO authUser,
							 @RequestParam("board_NO")int board_NO, Model model) {
		
		GuestBoardVO boardVO = boardService.getBoard(board_NO); 
		System.out.println(board_NO);  
		model.addAttribute("boardVO", boardVO);  
		boardVO.setUser_ID( authUser.getUser_ID());
		boardVO.setUser_NO( authUser.getUser_NO());
		return "guestBoard_view/guestBoardReply_View";
	}  

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(@AuthUser UserVO authUser,
						@RequestParam("board_NO") int board_NO, GuestBoardVO boardVO) {

		boardVO.setUser_ID( authUser.getUser_ID());
		boardVO.setUser_NO( authUser.getUser_NO());
		System.out.println("리플 저장"+boardVO ); 
		boardService.insertReply(boardVO);  
		boardService.getBoard(board_NO); 
		return "redirect:/guestBoard/viewer?board_NO=" + board_NO;
	}
}
