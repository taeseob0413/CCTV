package com.firstclass.childrenctv.user;

import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@AllArgsConstructor
public class UserController {
    private final UserService userService;
    
    @PostMapping("/user/join")
    public String join(UserVO user){
    	System.out.println("성공해주세요...");   
    	System.out.print("정보 확인" +  user.toString());	
    	
    	userService.signup(user);
    	
    	return "index";
    }

    @PostMapping("/user/login")
    public String login(String email, String password, HttpServletRequest request){
        UserVO user = userService.signIn(email, password);
        if(user == null) return "index";

        request.getSession().setAttribute("user", user);
        return "index";
    }
}
