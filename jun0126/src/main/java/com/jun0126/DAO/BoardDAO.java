package com.jun0126.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun0126.VO.BoardVO;

@Repository
public class BoardDAO {
 
	@Autowired
	private SqlSession sqlSession;
	
	/*private Object boardCount;*/
	
	public int boardTotalCnt() {
		return sqlSession.selectOne("board.total");
	}

	public void hit(int board_NO) {
		sqlSession.update("board.hit", board_NO);

	}

	public void delete(int board_NO) {
		sqlSession.delete("board.delete", board_NO);

	}
	
	public List<BoardVO> boardList(int curPage, int PAGE_SIZE, String keyWord ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curPage", curPage);
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("keyWord", keyWord);
		List<BoardVO> boardList = sqlSession.selectList("board.list", map);
		return boardList;
	}  
	
	public List<BoardVO> pageView(int curPage, int PAGE_SIZE  ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curPage", curPage);
		map.put("PAGE_SIZE", PAGE_SIZE);
		List<BoardVO> boardList = sqlSession.selectList("board.viewerList", map);
		return boardList; 
	} 
	

	public BoardVO selectBoard(int board_NO) {
		BoardVO boardVO = sqlSession.selectOne("board.selectBoard", board_NO);
		return boardVO; 
	}  

	public void insertWriter(BoardVO boardVO) {
		sqlSession.insert("board.insertWriter", boardVO);
	}
	
	public BoardVO updateModify(BoardVO boardVO) {
		sqlSession.update("board.updateModify", boardVO);
		return boardVO;
	}
   
	public int getBoardNO(int curPage,int PAGE_SIZE) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curPage", curPage); 
		map.put("PAGE_SIZE", PAGE_SIZE);
		int board_NO = sqlSession.selectOne("board.getBoardNO",map);
		return board_NO;   
	}
}
