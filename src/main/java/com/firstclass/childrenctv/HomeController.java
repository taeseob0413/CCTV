package com.firstclass.childrenctv;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

	@GetMapping("/user/login")
	public String login(){
		return "/user/LoginUser";
	}


    @GetMapping("/")
    public String home() {
        return "index";
    }
    
    @GetMapping("/reportBoard/get")
    public String get() {
    	return "reportboard/get";
    }
    
   @GetMapping("/register") //여기를("/reportBoard/register")이거에서 /register로바꿨다가 다시 바꿈
    public String register() {
    	return "reportboard/register";
    }
   

    @GetMapping("/find/user/userPassword")
    public String findUserPassword() {
        return "user/FindUserPassword";
    }
  

}



