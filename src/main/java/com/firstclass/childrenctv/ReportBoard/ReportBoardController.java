package com.firstclass.childrenctv.ReportBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ReportBoardController {
	@Autowired
	private ReportBoardService service;
	
	@PostMapping("/reportBoard/register")
	public String reportboardregister(ReportBoardVO board) {
		//setchild_id와 setuser_id는 세션에서 받아오는 정보로 입력하는데 임시로 직접 입력해뒀습니다
		board.setChild_id(1204L);
		board.setUser_id(20L);
		System.out.println("넣는 정보는 무엇일까????" +board.toString());
		service.insert(board);
		
		return "index";		// 추후에 list 화면으로 이동시키기
		
	}
	
	@PostMapping("/reportBoard/delete")
	    public String deleteReportBoard(Long report_id) {  //세션에서 정보 넘어올때 다시 수정
    
        service.deleteReportBoard(report_id);
      
        return "index"; //실종아동 정보 게시판이 만들어지면 수정
    
    }

	@PostMapping("/reportBoard/update")
	public String updateReportBoard(ReportBoardVO board) {
	    service.update(board);
	    return "index";  //추후에 list 화면으로 이동시키기
	
	}

}
