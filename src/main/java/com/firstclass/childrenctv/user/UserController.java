package com.firstclass.childrenctv.user;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@AllArgsConstructor
public class UserController {
    
	private UserService userService;

    @PostMapping("/user/login")
    public String login(String email, String password, HttpServletRequest request){
        UserVO user = userService.signIn(email, password);
        if(user == null) return "index";

        request.getSession().setAttribute("user", user);
        return "index";
    }
}
