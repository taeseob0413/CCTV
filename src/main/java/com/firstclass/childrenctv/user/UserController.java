package com.firstclass.childrenctv.user;

import com.firstclass.childrenctv.response.BaseResponse;
import com.firstclass.childrenctv.user.dto.LoginDTO;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
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
}
