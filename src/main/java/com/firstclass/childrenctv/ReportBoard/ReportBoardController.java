package com.firstclass.childrenctv.ReportBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstclass.childrenctv.ChildBoard.ChildBoardService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ReportBoardController {

	private ReportBoardService boardservice;
	private ChildBoardService childservice;
	
	@GetMapping("/reportBoard/register")
    public String reportboardregister(@RequestParam("child_id") Long child_id, Model model) {
        // child_id 값을 모델에 추가하여 register.jsp로 전달
        model.addAttribute("child", childservice.getChildId(child_id));
        return "reportboard/register";
    }
	
	@PostMapping("/reportBoard/register")
	public String reportboardregister(ReportBoardVO board) {
		System.out.println("넣는 정보는 무엇일까????" +board.toString());
		boardservice.insert(board);
		
		return "redirect:/child/get?child_id=" + board.getChild_id();
		
	}
	
	@PostMapping("/reportBoard/delete")
	public String deleteReportBoard(Long report_id, @RequestParam("child_id") Long child_id) {
	    boardservice.deleteReportBoard(report_id);
	    return "redirect:/child/get?child_id=" + child_id;
	}

	
	@GetMapping("/reportBoard/get")
	public String get(@RequestParam("report_id") Long report_id, Model model) {
		model.addAttribute("board", boardservice.get(report_id));
		System.out.println("GET 컨트롤러 들어왔다!!!!!!!!!!");
		if(boardservice.get(report_id) != null) {
			return "reportboard/get";
		}
		else {
			return "redirect:/";
		}
	}
	
	
	@GetMapping("/reportBoard/update")
	public String update(@RequestParam("report_id") Long reportboard_id, Model model) {
	    // reportboard_id를 사용하여 해당 보고서 정보를 가져와서 update.jsp 화면에 전달
	    ReportBoardVO board = boardservice.get(reportboard_id);
	    System.out.println("어떤 정보를 가져왔을까????????" + board);
	    model.addAttribute("board", board);
	    return "reportboard/update";
	}
	
	@PostMapping("/reportBoard/update")
	public String update(ReportBoardVO board, @RequestParam("child_id") Long child_id) {
		System.out.println("넣는 정보는 무엇일까????" +board.toString());
		boardservice.update(board);
		return "redirect:/reportBoard/get?report_id=" + board.getReport_id();
	}

}
