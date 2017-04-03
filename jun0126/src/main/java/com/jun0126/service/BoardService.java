package com.jun0126.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun0126.DAO.BoardDAO;
import com.jun0126.DAO.CommentsDAO;
import com.jun0126.VO.BoardVO;
import com.jun0126.controller.CommentsController;


@Service
public class BoardService {
	@Autowired
	private BoardDAO BoardDao;


 
	public void delete(int board_NO) {
		BoardDao.delete(board_NO);

	}
	 
	public int boardTotalCnt() {
		return BoardDao.boardTotalCnt();
	}
 
	public void hit(int board_NO) {
		BoardDao.hit(board_NO);

	}
	 
	

	//**list page
	 
public Map<String, Object> boardList(int curPage, String keyWord) {
		
	
		final int PAGE_SIZE=2;  
		final int BLOCK_SIZE=3;  

		
		//---------------------------------------------------------------------------------
	 
		
		int totalCnt = BoardDao.boardTotalCnt();
 
		int	totalPage = (int)Math.ceil(totalCnt * 1.0 /PAGE_SIZE); 
	 
		int	totalBlock = (int)Math.ceil(totalPage * 1.0/ BLOCK_SIZE);
	 
		int	curBlock = (int)Math.ceil(curPage * 1.0/ BLOCK_SIZE);
		//-----------------------------------------------------------------------------------------------------
	 

		 
		int	blockStart = curBlock==0 ? 1 : (curBlock-1) * BLOCK_SIZE+1;
		 
		int	prevPage = curBlock > 1 ? (curBlock - 1)*BLOCK_SIZE : 0;
 
		int nextPage = curBlock < totalBlock  ? (curBlock * BLOCK_SIZE)+1 : 0;
		 
		if(nextPage >= totalPage){
				nextPage = totalPage;
		}
		 
		int	blockEnd = (nextPage > 0)? blockStart + BLOCK_SIZE - 1 : totalPage ;
		  
		if(blockEnd > totalCnt){
				blockEnd = totalCnt;
		}	
		//----------------------------------------------------------------------
		 
		List<BoardVO> list = BoardDao.boardList(curPage,PAGE_SIZE ,keyWord);
		//----------------------------------------------------------------------
		 
			Map<String, Object> map= new HashMap<String,Object>();
			
			map.put("list",list);	
			map.put("totalCnt",totalCnt);
			map.put("PAGE_SIZE", PAGE_SIZE);
			map.put("curPage",curPage);	
			map.put("prevPage", prevPage);
			map.put("nextPage",nextPage);
			map.put("totalBlock", totalBlock);
			map.put("blockStart",blockStart);	
			map.put("blockEnd", blockEnd);
			map.put("totalPage", totalPage);
			map.put("curBlock", curBlock);
		
			return map;
	}

public Map<String, Object> pageView(int curPage,String keyWord) {
	

	
	final int PAGE_SIZE=1;   
	final int BLOCK_SIZE=2;   
	

	
	//---------------------------------------------------------------------------------
	 
	int totalCnt = BoardDao.boardTotalCnt();
	  
	int	totalPage = (int)Math.ceil(totalCnt * 1.0 /PAGE_SIZE); 
	 
	int	totalBlock = (int)Math.ceil(totalPage * 1.0/ BLOCK_SIZE);
	 
	int	curBlock = (int)Math.ceil(curPage * 1.0/ BLOCK_SIZE);
	 

	 
	int	blockStart = curBlock==0 ? 1 : (curBlock-1) * BLOCK_SIZE+1;
	 
	int	prevPage = curBlock > 1 ? (curBlock - 1)*BLOCK_SIZE : 0;
	 
	int nextPage = curBlock < totalBlock  ? (curBlock * BLOCK_SIZE)+1 : 0;
	 
	if(nextPage >= totalPage){
			nextPage = totalPage;
	}
	  
	int	blockEnd = (nextPage > 0)? blockStart + BLOCK_SIZE - 1 : totalPage ;
	 
	if(blockEnd > totalCnt){
			blockEnd = totalCnt;  
	}	 
	//----------------------------------------------------------------------

	List<BoardVO> list = BoardDao.pageView(curPage,PAGE_SIZE );
 
		Map<String, Object> map= new HashMap<String,Object>();
		
		map.put("list",list);	 
		map.put("totalCnt",totalCnt);
		map.put("PAGE_SIZE", PAGE_SIZE);
		map.put("curPage",curPage);	
		map.put("prevPage", prevPage);
		map.put("nextPage",nextPage);
		map.put("totalBlock", totalBlock);
		map.put("blockStart",blockStart);	
		map.put("blockEnd", blockEnd);
		map.put("totalPage", totalPage);
		map.put("curBlock", curBlock);
	
		return map;
}
	
 
	public BoardVO getBoard(int board_NO) {
		BoardVO boardVO = BoardDao.selectBoard(board_NO);
		return boardVO;
 
	}
	 
	public void setWriter(BoardVO boardVO) {
		BoardDao.insertWriter(boardVO);
	}
	 
	public BoardVO setModify(BoardVO boardVO) {
		BoardDao.updateModify(boardVO);
		return boardVO;
	}
	 
	public int getBoardNO(int curPage) {
		final int PAGE_SIZE=1;    
		int board_NO = BoardDao.getBoardNO(curPage,PAGE_SIZE);
		return board_NO; 
		  
	} 

}
	
	
		