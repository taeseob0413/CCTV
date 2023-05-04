package com.firstclass.childrenctv;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.firstclass.childrenctv.childBoard.ChildBoardService;
import com.firstclass.childrenctv.childBoard.ChildBoardVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {
	
	@Autowired
	private ChildBoardService service;
	
    @GetMapping("/user/login")
    public String login(){
        return "/user/LoginUser";
    }

    @GetMapping("/")
    public String home(Model model){
    	List<ChildBoardVO> cl=service.getChild();
		model.addAttribute("list", cl);
        return "index";
    }
    
    @GetMapping("/reportBoard/get")
    public String get() {
    	return "reportboard/get";
    }
    
    @GetMapping("/reportBoard/register")
    public String register() {
    	return "reportboard/register";
    }
}
