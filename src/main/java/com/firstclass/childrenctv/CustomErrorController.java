package com.firstclass.childrenctv;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController {
    
    @RequestMapping(value = "/error")
    public String handleError(HttpServletRequest request){
        // http의 에러 상태 코드 받아오기
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);

        // 만약 에러 코드가 있다면
        if(status != null){
            return "error.jsp";
        }
        return "error.jsp";
    }
}