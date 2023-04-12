package com.firstclass.childrenctv.ReportBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ReportBoardController {

	private ReportBoardService service;
	
	@PostMapping("/reportBoard/register")
	public String reportboardregister(ReportBoardVO board) {
		//setchild_id와 setuser_id는 세션에서 받아오는 정보로 입력하는데 임시로 직접 입력해뒀습니다
		board.setChild_id(1204L);
		board.setUser_id(20L);
		System.out.println("넣는 정보는 무엇일까????" +board.toString());
		service.insert(board);
		
		return "index";
		
	}
	
	

}
