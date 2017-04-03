package com.jun0126.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun0126.DAO.GuestBoardDAO;
import com.jun0126.VO.GuestBoardVO;
 

@Service
public class GuestBoardService {
	@Autowired
	private GuestBoardDAO guestBoardDao;
	 
	public void delete(int board_NO) {
		guestBoardDao.delete(board_NO);

	}
	 
	public int boardTotalCnt() {
		return guestBoardDao.boardTotalCnt();
	}
	 
	public void hit(int board_NO) {
		guestBoardDao.hit(board_NO);

	}
	

	//--------------------------------------------------------------------
	//**list page

	 
public Map<String, Object> guestBoardList(int curPage, String keyWord) {

		final int PAGE_SIZE=10;  
		final int BLOCK_SIZE=5;  

		//---------------------------------------------------------------------------------
		 
		 
	 
		int totalCnt = guestBoardDao.boardTotalCnt();
		 
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
		 
		List<GuestBoardVO> guestBoardList = guestBoardDao.guestBoardList(curPage,PAGE_SIZE ,keyWord);
		//----------------------------------------------------------------------
	 
			Map<String, Object> guestBoardMap= new HashMap<String,Object>();
			
			guestBoardMap.put("list",guestBoardList);	
			guestBoardMap.put("totalCnt",totalCnt);
			guestBoardMap.put("PAGE_SIZE", PAGE_SIZE);
			guestBoardMap.put("curPage",curPage);	
			guestBoardMap.put("prevPage", prevPage);
			guestBoardMap.put("nextPage",nextPage);
			guestBoardMap.put("totalBlock", totalBlock);
			guestBoardMap.put("blockStart",blockStart);	
			guestBoardMap.put("blockEnd", blockEnd);
			guestBoardMap.put("totalPage", totalPage);
			guestBoardMap.put("curBlock", curBlock);
		
			return guestBoardMap;
	}
	
	 
	public GuestBoardVO getBoard(int board_NO) {
		GuestBoardVO boardVO = guestBoardDao.selectBoard(board_NO);
		return boardVO;

	}
	 
	public void setWriter(GuestBoardVO boardVO) {
		guestBoardDao.insertWriter(boardVO);
	}
	 
	public GuestBoardVO setModify(GuestBoardVO boardVO) {
		guestBoardDao.updateModify(boardVO);
		return boardVO;
	}
	   
	public GuestBoardVO insertReply(GuestBoardVO boardVO) {
		guestBoardDao.insertReply(boardVO);
		return boardVO;
	}
}
	
	
		