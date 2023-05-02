package com.firstclass.childrenctv.familyRelation;

import com.firstclass.childrenctv.user.UserVO;
import com.firstclass.childrenctv.util.response.BaseResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@AllArgsConstructor
public class FamilyRelationController1 {

    private final FamilyRelationService familyRelationService;
    
    
    /*@GetMapping("/mypage/register")
    public void addchild(FamilyRelationVO family, HttpSession session) {    	
    	UserVO user = (UserVO)session.getAttribute("user_id");
    	family.setUser_id(user.getUser_id());    	
    	familyRelationService.addchild(family);  
    }
    
    @PostMapping("/mypage/register")
	public String mypageregister() {
		return "/mypage/register";
    }*/
}
