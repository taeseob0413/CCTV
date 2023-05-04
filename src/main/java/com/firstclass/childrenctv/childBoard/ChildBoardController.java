package com.firstclass.childrenctv.childBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.firstclass.childrenctv.paging.Criteria;
import com.firstclass.childrenctv.paging.PageDTO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ChildBoardController {
	
	@Autowired
	private ChildBoardService service;
	
	@GetMapping("/child/list")
	public String list(Criteria cri,Model model) {
		List<ChildBoardVO> cl=service.getChildList(cri);
		int total=service.getTotal(cri);
		PageDTO paging=new PageDTO(cri, total);
		model.addAttribute("list", cl);
		model.addAttribute("pageMaker",paging);
		
		return "childboard/child";
	}
	@GetMapping("/child/get")
	public String get(@RequestParam("child_id") long child_id,Model model) {
		
	
		model.addAttribute("child",service.getChildId(child_id));
		
		
		return "childboard/get";
	}
	
	
}
