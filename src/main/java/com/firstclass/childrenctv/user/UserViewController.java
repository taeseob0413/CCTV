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
public class UserViewController {
  private final UserService userService;

  	//회원가입
    @PostMapping("/user/join")
    public String join(UserVO user){	
    	userService.signup(user);	
    	return "index";
    }
    
    //user 아이디 중복체크
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
    
    //이메일 인증
    @GetMapping("/user/emailcheck")
    @ResponseBody
     public String emailcheck(@RequestParam("user_email") String email) {
     	String code = userService.emailcheck(email);
     	return code;
     }
    
    //회원 조회
    @GetMapping("/mypage/get")
    public String userget(@RequestParam("user_id") Long user_id, Model model) {
    	model.addAttribute("user", userService.get(user_id));  	
    	return "/mypage/get";
    }
    	
    //회원 수정
	@GetMapping("/mypage/update")
	public String update(@RequestParam("user_id") Long user_id, Model model) {
		UserVO user = userService.get(user_id);
		model.addAttribute("user", user);
		return "mypage/update";
	}
	
	@PostMapping("/mypage/update")
	public String update(UserVO user, Model model) {
		userService.infoUpdate(user);
		return "index";
	}
		
	//회원탈퇴
	@GetMapping("/mypage/delete")
	public String delete() {	
		return "mypage/delete";
	}
		
	@PostMapping("/mypage/delete")
	public String delete(UserVO vo, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("user");		
		String sPw = user.getUser_password();
		String vPw = vo.getUser_password();
		if(!(sPw.equals(vPw))) {
			return "redirect:/mypage/delete";
		}
		userService.delete(user);
		session.invalidate();
		return "index";
	}
	
	//회원탈퇴 시 비밀번호 체크
	@PostMapping("/mypage/delete_pw")
	@ResponseBody
	public int pwcheck(UserVO user) {
		int result = userService.pwcheck(user);	
		return result;
	}	
}
