package com.firstclass.childrenctv.user;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.firstclass.childrenctv.ReportBoard.ReportBoardVO;


import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UserController1 {
	
  private final UserService userService;
    
    @PostMapping("/user/join")
    public String join(UserVO user){
    	System.out.println("성공해주세요...");   
    	System.out.print("정보 확인" +  user.toString());	
    	
    	userService.signup(user);
    	
    	return "index";
    }
    
    @PostMapping("/user/idCheck")
    @ResponseBody
    public String idcheck(@RequestParam("username") String loginid) {
    	int result = userService.idcheck(loginid);
    	
    	if(result != 0) {
    		return "fail";
    	} else {
    		return "success";
    	}	
    }
    
    @GetMapping("/user/emailcheck")
    @ResponseBody
     public String emailcheck(@RequestParam("user_email") String email) {
     	//System.out.println("갔을꺼ㅏ...?");
     	//System.out.println("이메일 인증 이메일 :" + email);
     	String code = userService.emailcheck(email);
     	
     	System.out.println("인증코드 :" +  code);
     	return code;
     }

    
	  

}
