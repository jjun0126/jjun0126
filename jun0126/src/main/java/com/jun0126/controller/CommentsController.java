package com.jun0126.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.jun0126.VO.CommentsVO;
import com.jun0126.VO.UserVO;
import com.jun0126.security.Auth;
import com.jun0126.security.AuthUser;
import com.jun0126.service.CommentsService;
  
@RestController 
@RequestMapping("/comments")
public class CommentsController {
	 
	@Autowired 
	private CommentsService commentsService;
	  
	@Auth
	@ResponseBody    
	@RequestMapping(value = "/writer", method = RequestMethod.POST)
	public String writer(@AuthUser UserVO authUser, 
			@ModelAttribute CommentsVO commentsVO) { 
		System.out.println("뭐가 오긴하나요");
		commentsVO.setUser_ID( authUser.getUser_ID());
		commentsVO.setUser_NO( authUser.getUser_NO());
		System.out.println("밑에"+commentsVO);
		commentsService.setWriter(commentsVO);  
		String board_NO = commentsVO.getBoard_NO(); 

		return board_NO;
	}     
	  
	@Auth 
	@RequestMapping(value = "/commentsList", method = RequestMethod.GET)
	public ModelAndView viewer_form(@RequestParam(value="curPage", required=false, defaultValue="1")int curPage,	
											@RequestParam(value="board_NO")int board_NO, ModelAndView mvc,Model model) {
		System.out.println(curPage+"코멘트 콘트롤러" + board_NO );  
		Map<String, Object> commentsList = commentsService.commentsList(board_NO, curPage); 
		model.addAttribute("commentsList", commentsList);  
		model.addAttribute("board_NO", board_NO);  
		 
		mvc.setViewName("board/comments_List");
		mvc.addObject(commentsList); 
		System.out.println("코멘트 콘트롤러 맵" + commentsList+ "보드넘버"+ board_NO);  
		return mvc; 
	}    
	@Auth
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam("comments_NO") int comments_NO) {
		commentsService.delete(comments_NO);
		return "redirect:/comments/commentsList";
	}   
	
	
	
	
	 /*  
	@ResponseBody
	@RequestMapping("/delete")
	public Map<String, Object> delete( String comments_NO, String board_NO, int curPage, Model model ) {
		Map<String, Object> map = commentsService.commentsList(comments_NO,board_NO,curPage); 
		model.addAttribute("map", map);
		return map;
	}
	@ResponseBody
	@RequestMapping("/modyfi_form")
	public CommentsVO modyfi(CommentsVO commentsVO, Model model) {
		CommentsVO vo = commentsService.selectBoard( commentsVO );	
		model.addAttribute("vo", vo);
		return vo;
	}*/

}
