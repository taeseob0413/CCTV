package com.firstclass.childrenctv.ChildBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ChildBoardController {
	
	@Autowired
	private ChildBoardService service;
	
	@GetMapping("/child/list")
	public String list(Model model) {
		String child_location="seoul";
		model.addAttribute("list", service.getChildAddr(child_location));
		System.out.println("성공!");
		return "/childboard/child";
	}
	
	@GetMapping("/child/get")
	public void get(@RequestParam("child_id") Long child_id, Model model) {
		model.addAttribute("board",service.getChildId(child_id));
	} 

}
