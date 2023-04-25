package com.firstclass.childrenctv.protectBoard;

import java.net.URI;
import java.net.URISyntaxException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ProtectBoardController {

	private ProtectBoardService boardService;
	
	
	@GetMapping("/protectBoard/list")
	public String protectBoardList(Model model) {
		model.addAttribute("list", boardService.getAll());
		return "protectboard/list";
	}
	
	@GetMapping("/protectBoard/register")
	public String protectBoardRegister() {
		
		return "protectboard/register";
	}
	
	@PostMapping("/protectBoard/register")
	public String protectBoardRegister(ProtectBoardVO board) {
		System.out.println("넣는 정보는 무엇일까????" +board.toString());
		boardService.insert(board);
		
		return "redirect:/protectBoard/list";
	}
	
	@GetMapping("/protectBoard/get")
	public String protectBoardGet(@RequestParam("protect_id") Long protect_id, Model model, HttpServletRequest request) {
		//get 페이지 이전에 어디 page에 있었는지에 따라 다른 attribute 넘기기
		URI  uri;
		try {
			String referringPage = request.getHeader("referer");
			uri= new URI(referringPage);
			if(uri.getPath() =="/protectBoard/list") {
				model.addAttribute("originPage", "protect");
			}else if(uri.getPath() == "/child/get") {
				model.addAttribute("originPage", "child");
			}
		}catch( URISyntaxException e) {
			e.printStackTrace();
		}
		ProtectBoardVO board = boardService.get(protect_id);
		model.addAttribute("board", board);
		System.out.println("GET 컨트롤러 왔다!!");
		if(boardService.get(protect_id) != null) {
			return "protectboard/get";
		}
		else {
			return "redirect:/";
		}
	}
	
	@PostMapping("/protectBoard/delete")
	public String deleteProtectBoard(Long protect_id) {
		boardService.delete(protect_id);
		return "redirect:/protectBoard/list";
	}
	
	@GetMapping("/protectBoard/update")
	public String update(@RequestParam("protect_id") Long protect_id, Model model) {
		ProtectBoardVO board = boardService.get(protect_id);
		System.out.println("가져온 정보는???" + board);
		model.addAttribute("board", board);
		return "protectboard/update";
	}
	
	@PostMapping("/protectBoard/update")
	public String update(ProtectBoardVO board) {
		System.out.println("넣는 정보는?????" + board.toString());
		boardService.update(board);
		return "redirect:/protectBoard/list";
	}
	
	
	
}
