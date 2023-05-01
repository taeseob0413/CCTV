package com.firstclass.childrenctv.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.firstclass.childrenctv.ChildBoard.ChildBoardService;

<<<<<<< HEAD
import jakarta.servlet.http.HttpSession;
=======

>>>>>>> branch 'main' of https://github.com/ChangDaeJun/CCTV.git
import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UserController1 {
	
  private final UserService userService;
  private final ChildBoardService service;

    @PostMapping("/user/join")
    public String join(UserVO user){
    	System.out.println("성공해주세요...");   
    	System.out.print("정보 확인" + user.toString());	   	
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
<<<<<<< HEAD
=======

>>>>>>> branch 'main' of https://github.com/ChangDaeJun/CCTV.git
    
    //회원 조회
    @GetMapping("/mypage/get")
    public String userget(@RequestParam("user_id") long user_id, Model model) {
    	model.addAttribute("user", userService.get(user_id));
    	System.out.println("컨트롤러 작동했니?");
    	
    	return "/mypage/get";
    }
    	
    //회원 수정
	@GetMapping("/mypage/update")
	public String update(@RequestParam("user_id") long user_id, Model model , HttpSession session) {
		UserVO user = userService.get(user_id);
		System.out.println("정보 가져왔니ㅏ?" + user);
		model.addAttribute("user", user);
		return "mypage/update";
	}
	
	@PostMapping("/mypage/update")
	public String update(UserVO user) {	
		System.out.print("정보 확인" +  user.toString());
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
		
	@GetMapping("/mypage/register")
	public String register(@RequestParam("child_id") Long child_id, Model model) {
		model.addAttribute("child", service.getChildId(child_id));
		return "/mypage/register";
	}
	
	@PostMapping("/mypage/register")
	public String mypageregister() {
		return "/mypage/register";
	}
	
	

}
