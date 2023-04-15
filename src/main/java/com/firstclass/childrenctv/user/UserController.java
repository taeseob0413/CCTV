package com.firstclass.childrenctv.user;

import com.firstclass.childrenctv.response.BaseResponse;
import com.firstclass.childrenctv.user.dto.LoginDTO;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
public class UserController {
    private final UserService userService;

    @PostMapping("/user/login")
    public BaseResponse login(HttpServletRequest request, @RequestBody LoginDTO loginDTO){
        UserVO user = userService.signIn(loginDTO.getEmail(), loginDTO.getPassword());
        if(user == null){
            return new BaseResponse(400, "아이디 또는 비밀번호가 불일치합니다.");
        }
        request.getSession().setAttribute("user", user);
        return new BaseResponse(200, "성공적으로 로그인되었습니다.");
    }

    @PostMapping("/user/logout")
    public BaseResponse logout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return new BaseResponse(200, "성공적으로 로그아웃되었습니다.");
    }

    @GetMapping("/find/user/loginId")
    public BaseResponse findUserId(@RequestParam String userName, @RequestParam String userEmail){
        String userID = userService.findId(userName, userEmail);
        if(userID == null) return new BaseResponse<>(400, "일치하는 회원 정보가 없습니다.");
        return new BaseResponse(200, "회원님의 아이디는 " + userID + " 입니다.");
    }

    @GetMapping("/find/user/password")
    public BaseResponse findUserPassword(@RequestParam String userName, @RequestParam String userEmail, @RequestParam String userLoginId){
        boolean emailSend = userService.findpass(userName, userEmail, userLoginId);
        if(emailSend) return new BaseResponse<>(200, userEmail + "로 비밀번호를 전송했습니다.");
        return new BaseResponse(400, "정보가 불일치합니다. 다시 입력해주세요.");
    }
}
