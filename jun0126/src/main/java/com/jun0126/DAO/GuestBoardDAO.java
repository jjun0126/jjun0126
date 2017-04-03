package com.jun0126.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jun0126.VO.GuestBoardVO;

@Repository
public class GuestBoardDAO {

	@Autowired 
	private SqlSession sqlSession;
	
	/*private Object boardCount;*/

	public int boardTotalCnt() {
		return sqlSession.selectOne("guestBoard.total");
	}

	public void hit(int board_NO) {
		sqlSession.update("guestBoard.hit", board_NO);

	}
	
	public void delete(int board_NO) {
		sqlSession.delete("guestBoard.delete", board_NO);

	}

	public List<GuestBoardVO> guestBoardList(int curPage, int PAGE_SIZE,String keyWord ) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("curPage", curPage);
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("keyWord", keyWord);
		List<GuestBoardVO> boardList = sqlSession.selectList("guestBoard.list", map);
		return boardList;
	}
	

	public GuestBoardVO selectBoard(int board_NO) {
		GuestBoardVO boardVO = sqlSession.selectOne("guestBoard.selectBoard", board_NO);
		return boardVO;
	}
	
	public void insertWriter(GuestBoardVO boardVO) {
		sqlSession.insert("guestBoard.insertWriter", boardVO);
	}
	
	public GuestBoardVO updateModify(GuestBoardVO boardVO) {
		sqlSession.update("guestBoard.updateModify", boardVO);
		return boardVO;
	} 
 
	public GuestBoardVO insertReply(GuestBoardVO boardVO) {
		sqlSession.insert("guestBoard.insertReply", boardVO);
		return boardVO; 
	}
	 
	
}
