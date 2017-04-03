package com.jun0126.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun0126.VO.BoardVO;
import com.jun0126.VO.CommentsVO;

@Repository
public class CommentsDAO {
	
	@Autowired
	private SqlSession sqlSession; 
	
	public void setWriter( CommentsVO commentsVO ) {	
		sqlSession.insert("comments.writer", commentsVO);   
	} 
	
	
	public List<CommentsVO> commentsList(int board_NO, int curPage, int PAGE_SIZE ) {
		System.out.println("코멘트 다오 시작"+"보드넘버"+board_NO+"현재 페이지"+curPage+"페이지사이즈"+PAGE_SIZE);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_NO", board_NO); 
		map.put("curPage", curPage);
		map.put("PAGE_SIZE", PAGE_SIZE);
		List<CommentsVO> commentsList = sqlSession.selectList("comments.list", map);
		return commentsList; 
	}
	  
/*	public void delete( CommentsVO commentsVO ) {
		sqlSession.delete("comments.delete", commentsVO);
	}*/
	public int commentsTotalCnt(int board_NO) {
		int totalCnt = sqlSession.selectOne("comments.total",board_NO);
		return totalCnt;  
	} 
 
	public void delete(int comments_NO) {
		sqlSession.delete("comments.delete", comments_NO);

	}
	
/*	public CommentsVO selectBoard(CommentsVO commentsVO) {
		CommentsVO vo = sqlSession.selectOne("comments.selectBoard", commentsVO);
		return vo;		
	}
	
	public int getBoardNO(int curPage,int PAGE_SIZE) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curPage", curPage); 
		map.put("PAGE_SIZE", PAGE_SIZE);
		int board_NO = sqlSession.selectOne("comments.getBoardNO",map);
		return board_NO;   
	} 
*/
}
