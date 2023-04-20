package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ChildBoardController {
	
	@Autowired
	private ChildBoardService service;
	
	@GetMapping("/childboard/list")
	public void list(Criteria cri, Model model) {
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		System.out.println("성공!");
		
	}
	
	@GetMapping("/childboard/get")
	public String getChild(@RequestParam("child_id") Long child_id, Model model) {
		
		model.addAttribute("board",service.get(child_id));
		
		return "childboard/get";
	}
	
	
}