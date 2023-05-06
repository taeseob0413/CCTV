package com.firstclass.childrenctv;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.List;
import com.firstclass.childrenctv.childBoard.ChildBoardService;
import com.firstclass.childrenctv.childBoard.ChildBoardVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {
	
	@Autowired
	private ChildBoardService service;
	
	@GetMapping("/user/join")
	public String join() {
		return "/user/JoinUser";
	}

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
    
    @GetMapping("/find/user/userLoginId")
    public String findUserLoginId(){
        return "/user/FindUserLoginId";
    }

    @GetMapping("/find/user/userPassword")
    public String findUserPassword() {
        return "user/FindUserPassword";
    } 
    
    @GetMapping("/error")
    public String getError() {
    	return "error";
    }

} 





