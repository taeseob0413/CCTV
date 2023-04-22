package com.firstclass.childrenctv;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@GetMapping("/user/join")
	public String join() {
		return "/user/JoinUser";
	}

	@GetMapping("/user/login")
	public String login(){
		return "/user/LoginUser";
	}


    @GetMapping("/")
    public String home() {
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

    @GetMapping("/user/update") 
	public String update() {
		return "/mypage/update1";
	}

    } 






