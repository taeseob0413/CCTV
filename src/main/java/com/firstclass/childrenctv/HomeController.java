package com.firstclass.childrenctv;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/user/login")
    public String login(){
        return "/user/LoginUser";
    }

    @GetMapping("/")
    public String home(){
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

    @GetMapping("/find/user/userLoginId")
    public String findUserLoginId(){
        return "/user/FindUserLoginId";
    }

    @GetMapping("/find/user/userPassword")
    public String findUserPassword(){
        return "user/FindUserPassword";
    }
}
