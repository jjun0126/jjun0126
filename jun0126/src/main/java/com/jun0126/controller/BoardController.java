package com.jun0126.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.jun0126.VO.BoardVO;
import com.jun0126.VO.FileVO;
import com.jun0126.VO.UserVO;
import com.jun0126.security.Auth;
import com.jun0126.security.AuthUser;
import com.jun0126.service.BoardService;

@Controller
@RequestMapping( "/board" )
public class BoardController { 

	@Autowired
	private BoardService boardService;
    /*삭제 컨트롤러*/	
	@Auth
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("board_NO") int board_NO) {
		boardService.delete(board_NO);
		return "redirect:/board/list";
	}
	
	//--------------------------------------------------------------------
	//**list page
	//@RequestParam 파람에 처음 값이 넘어오지 않으면 에러가 나서 기본으로 1을 줌
	@RequestMapping(value = "/list")
	public String boardList(@RequestParam(defaultValue="1" ) int curPage, String keyWord, Model model) {
		Map<String, Object> map = boardService.boardList(curPage,keyWord); 
		model.addAttribute("map", map);
		return "board_view/boardList_View";
	}
	/*상세보기 페이지 가져오기 컨트롤러*/
	  

/*	@RequestMapping(value = "/getBoardNO")
	public String getBoardNO(Model model) {
		int board_NO = boardService.getBoardNO();	 
		model.addAttribute("board_NO", board_NO);
		boardService.hit(board_NO);
		return "redirect:/board/viewer";   
	} 
	 */
	
	
	@RequestMapping(value = "/viewer", method = RequestMethod.GET)
	public String viewer_form(@RequestParam(value="curPage", required=false, defaultValue="1")int curPage, 						
							String keyWord, Model model) {
		Map<String, Object> boardViewerMap = boardService.pageView(curPage,keyWord);
		int board_NO = boardService.getBoardNO(curPage);	 
		boardService.hit(board_NO);
		model.addAttribute("boardViewerMap", boardViewerMap); 
		model.addAttribute("board_NO", board_NO);
		return "board_view/boardViewer_View";
	}  
	/*글쓰기 폼 가져오기  컨트롤러*/ 
	@Auth
	@RequestMapping("/writer_form")
	public String writer_form() {
		return "board_view/boardWriter_View";
	}
	/*글쓰기 저장 컨트롤러*/
	@Auth
	@RequestMapping(value = "/writer", method = RequestMethod.POST)
	public String writer(@AuthUser UserVO authUser, 
			@ModelAttribute BoardVO boardVO){
		boardVO.setUser_ID( authUser.getUser_ID());
		boardVO.setUser_NO( authUser.getUser_NO());
		boardService.setWriter(boardVO);
		/*FileService.insert( multiPartFile, fileVO );*/
		return "redirect:/board/viewer"; 
	}
	/*수정하기 폼 가져오기 컨트롤러*/  
	@Auth
	@RequestMapping(value = "/modify_form")      
	public String modify_form(@RequestParam(value="board_NO") int board_NO, Model model) {
		BoardVO boardVO = boardService.getBoard(board_NO); 
		model.addAttribute("boardVO", boardVO);
		return "board_view/boardModify_View";  
	}  
	/*수정하기 저장 컨트롤러*/
	@Auth
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(@RequestParam("board_NO") int board_NO, BoardVO boardVO, Model model) {
		boardService.setModify(boardVO); 
		boardService.getBoard(board_NO);     
		return "redirect:/board/viewer?board_NO=" + board_NO;
	}
	
	
	
}


