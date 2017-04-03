package test;

import java.security.Provider.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jun0126.service.BoardService;

@Controller
public class TestController {
	 
	@Autowired
	private BoardService boardService;
	
	@RequestMapping( "/hello")
	public String test(){
		System.out.println("test");
		int count = boardService.boardTotalCnt();
		System.out.println("count==="+ count);
		return "/WEB-INF/views/test";
	}
	
}