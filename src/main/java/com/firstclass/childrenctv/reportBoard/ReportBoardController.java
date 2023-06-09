package com.firstclass.childrenctv.reportBoard;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.firstclass.childrenctv.childBoard.ChildBoardService;
import com.firstclass.childrenctv.user.UserVO;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
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
	    model.addAttribute("board", board);
	    return "reportboard/update";
	}
	
	@PostMapping("/reportBoard/update")
	public String update(ReportBoardVO board, @RequestParam("child_id") Long child_id) {
		boardservice.update(board);
		return "redirect:/reportBoard/get?report_id=" + board.getReport_id();
	}
	
	//제보글 목록 가져오기
		@RequestMapping(value = "/mypage/mywrite", method = RequestMethod.GET)
		public String myWrite(Model model, HttpSession session) {
			UserVO user = (UserVO) session.getAttribute("user");
			List<ReportBoardVO> reportList = boardservice.getReportList(user.getUser_loginID()); // 제보글 목록 가져오기 mapper.sml
																									// -> sql명령문 ->DB data
			model.addAttribute("reportList", reportList);
			return "/mypage/mywrite";
		}



}
