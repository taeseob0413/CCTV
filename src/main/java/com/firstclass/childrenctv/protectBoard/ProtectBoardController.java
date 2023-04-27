package com.firstclass.childrenctv.protectBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.firstclass.childrenctv.util.paging.Criteria;
import com.firstclass.childrenctv.util.paging.PageDTO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ProtectBoardController {

	private ProtectBoardService boardservice;
	
	@GetMapping("/protectBoard/list")
	public String protectBoardlist(Criteria cri, Model model) {
		model.addAttribute("list", boardservice.getAll(cri));
		int total = boardservice.getTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "protectboard/list";
	}
	
	@GetMapping("/protectBoard/register")
	public String protectBoardregister() {
		
		return "protectboard/register";
	}
	
	@PostMapping("/protectBoard/register")
	public String protectboardregister(ProtectBoardVO board) {
		System.out.println("넣는 정보는 무엇일까????" +board.toString());
		board.setApproval(1);
		boardservice.insert(board);
		
		return "redirect:/protectBoard/list";
	}
	
	@GetMapping("/protectBoard/get")
	public String protectboardget(@RequestParam("protect_id") Long protect_id, Model model) {
		model.addAttribute("board", boardservice.get(protect_id));
		System.out.println("GET 컨트롤러 왔다!!");
		if(boardservice.get(protect_id) != null) {
			return "protectboard/get";
		}
		else {
			return "redirect:/";
		}
	}
	
	@PostMapping("/protectBoard/delete")
	public String deleteprotectboard(Long protect_id) {
		boardservice.delete(protect_id);
		return "redirect:/protectBoard/list";
	}
	
	@GetMapping("/protectBoard/update")
	public String update(@RequestParam("protect_id") Long protect_id, Model model) {
		ProtectBoardVO board = boardservice.get(protect_id);
		System.out.println("가져온 정보는???" + board);
		model.addAttribute("board", board);
		return "protectboard/update";
	}
	
	@PostMapping("/protectBoard/update")
	public String update(ProtectBoardVO board) {
		System.out.println("넣는 정보는?????" + board.toString());
		boardservice.update(board);
		return "redirect:/protectBoard/list";
	}
	
}
