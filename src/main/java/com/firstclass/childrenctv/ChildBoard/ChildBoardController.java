package com.firstclass.childrenctv.ChildBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/child/*")
@AllArgsConstructor
public class ChildBoardController {
	private ChildBoardService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list",service.getChild());
	}
	@GetMapping("/get")
	public void get(@RequestParam("child_id") Long child_id, Model model) {
		model.addAttribute("board",service.getChildId(child_id));
	}

}
