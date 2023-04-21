package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.firstclass.childrenctv.reportBoard.ReportBoardService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ChildBoardController {
	
	@Autowired
	private ChildBoardService service;
	@Autowired
	private ReportBoardService boardservice;
	
	@GetMapping("/child/list")
	public String list(Model model) {
		String child_location="동작";
		List<ChildBoardVO> cl=service.getChildAddr(child_location);
		
		model.addAttribute("list", cl);
		
		System.out.println("성공!");
		return "childboard/child";
	}
	@GetMapping("/child/get")
	public String get(@RequestParam("child_id") Long child_id,Model model) {
		model.addAttribute("child",service.getChildId(child_id));
		model.addAttribute("report", boardservice.getByChild(child_id));
		return "childboard/get";
	}
	
	
}