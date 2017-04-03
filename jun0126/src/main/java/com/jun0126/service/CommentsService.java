package com.jun0126.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun0126.DAO.CommentsDAO;
import com.jun0126.VO.CommentsVO;


@Service
public class CommentsService {
		
	@Autowired
	private CommentsDAO commentsDao;
		
	public void setWriter( CommentsVO commentsVO ) {
		commentsDao.setWriter( commentsVO ); 
	} 
		 
	  
	public Map<String, Object> commentsList(int board_NO, int curPage) {
			 
			   
		final int PAGE_SIZE=100; //페이지당 게시물수 
		final int BLOCK_SIZE=100; //블록당 페이지수
	 
			 
		//---------------------------------------------------------------------------------
		//1.페이징을 위한 기본 데이터 계산	 
		//1-1 총계시물수  
		int totalCnt = commentsDao.commentsTotalCnt(board_NO);	
		//1-2 총페이지수 
		int	totalPage = (int)Math.ceil(totalCnt * 1.0 /PAGE_SIZE); 
		//1-3  총 블록 계수 = 총페이지 갯수로 몇개의 블록이 필요할지 계산
		int	totalBlock = (int)Math.ceil(totalPage * 1.0/ BLOCK_SIZE);
		//1-4 현재 블록 계산   = 현재 페이지를 블록당 페이지 수로  나눔
		int	curBlock = (int)Math.ceil(curPage * 1.0/ BLOCK_SIZE);
		//-----------------------------------------------------------------------------------------------------
		// 3. view에서 페이지 리스트를 렌더링 하기위한 데이터 값 계산
		//	blockStart,blockEnd 변수는 밑에 블록리스트를 표시하기 위하여
		//  prevPage,nextPage는 이전 다음 버튼에 사용하기 위하여 선언

		//블록의 시작 페이지 번호 (게시물 번호 아님)  
		int	blockStart = curBlock==0 ? 1 : (curBlock-1) * BLOCK_SIZE+1;
		// 이전페이지를 누르면  = 현재 블록이 1보다 크면 전블록의 마지막 페이지로 가고 아니면 0 뷰단에서 처음페이지는  이전페이지 버튼이 안나오게 표시해놔서 0으로 처리
		int	prevPage = curBlock > 1 ? (curBlock - 1)*BLOCK_SIZE : 0;
		// 다음 페이지 = 현재블록 보다 총블록이 작으면 = 현재블록 (2)* 블록사이즈(10) +1 =21 ->2블록(11~20)에서 넥스트를 누르면 21블록으로 이동하게 만듬  아니면 0
		// 뷰 페이지에서 마지막 페이지에선 다음 버튼 안나오게 처리 했음으로 0으로 처리(0은 변화없음? 정확히 모르겠음)
		int nextPage = curBlock < totalBlock  ? (curBlock * BLOCK_SIZE)+1 : 0;
		//마지막 페이지 범위를 초과하지 않도록 처리
		//넥스트 페이지가 총페이지보다 크거나 같으면 다음페이지는 총페이지와 같게 함 (다음 페이지가 12페이지 에서 끝나면 20페이지까지 안나오고 12페이지에서 끝나도록)
		if(nextPage >= totalPage){
				nextPage = totalPage;
		}
		//블록의 끝 페이지 번호  (게시물 번호 아님) =  블록 시작 페이지 (21)+10-1=30   (3번쨰 블록은 21페에지 시작 30페이지 끝)
		int	blockEnd = (nextPage > 0)? blockStart + BLOCK_SIZE - 1 : totalPage ;
		//블록의 끝 페이지 번호가 토탈 페이지보다 많으면 토탈페이지를 블록의 끝번호 (게시물 11개면 1~10페이지 블록 까지 안만들고 2페이지 11을 블록의 끝으로)
		if(blockEnd > totalCnt){
				blockEnd = totalCnt;
		}	  
		//----------------------------------------------------------------------
		//4.리스트 가져오기
		List<CommentsVO> list = commentsDao.commentsList(board_NO, curPage,PAGE_SIZE);
		//----------------------------------------------------------------------
		//5.리스트 정보 맵에 저장하여 뷰단으로 보냄 
			Map<String, Object> Map= new HashMap<String,Object>();
				
			Map.put("list",list);	
			Map.put("totalCnt",totalCnt);
			Map.put("PAGE_SIZE", PAGE_SIZE); 
			Map.put("curPage",curPage);	
			Map.put("prevPage", prevPage);
			Map.put("nextPage",nextPage);
			Map.put("totalBlock", totalBlock);
			Map.put("blockStart",blockStart);	
			Map.put("blockEnd", blockEnd);
			Map.put("totalPage", totalPage);
			Map.put("curBlock", curBlock);
			
			 
			 
			return Map;
	
}
	

	public void delete(int comments_NO) {
		commentsDao.delete(comments_NO);

	}
		/*
	public CommentsVO delete( CommentsVO commentsVO ) {
		commentsDao.delete( commentsVO );
		CommentsVO vo = commentsDao.selectBoard(commentsVO);
		return vo;	
	}
	public CommentsVO selectBoard( CommentsVO commentsVO ) {
		commentsDao.selectBoard( commentsVO );
		CommentsVO vo = commentsDao.selectBoard(commentsVO);
		return vo;	
	}   */
 
}



