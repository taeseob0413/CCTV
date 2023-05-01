package com.firstclass.childrenctv.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UserController1 {
	
  private final UserService userService;

    @PostMapping("/user/join")
    public String join(UserVO user){	
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
     	String code = userService.emailcheck(email);     	
     	System.out.println("인증코드 :" +  code);
     	return code;
     }
    
    //회원 조회
    @GetMapping("/mypage/get")
    public String userget(@RequestParam("user_id") long user_id, Model model) {
    	model.addAttribute("user", userService.get(user_id));  	
    	return "/mypage/get";
    }
    	
    //회원 수정
	@GetMapping("/mypage/update")
	public String update(@RequestParam("user_id") long user_id, Model model , HttpSession session) {
		UserVO user = userService.get(user_id);
		model.addAttribute("user", user);
		return "mypage/update";
	}
	
	@PostMapping("/mypage/update")
	public String update(UserVO user) {	
		userService.infoUpdate(user);
		return "redirect:/";
	}
		
	//회원탈퇴
	@GetMapping("/mypage/delete")
	public String delete() {
		return "mypage/delete";
	}
		
	@PostMapping("/mypage/delete")
	public String delete(Long id, HttpSession session) {
		userService.delete(id);
		session.invalidate();	
		return "index";
	}
}
