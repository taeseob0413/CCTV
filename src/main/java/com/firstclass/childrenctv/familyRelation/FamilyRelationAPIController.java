package com.firstclass.childrenctv.familyRelation;

import com.firstclass.childrenctv.user.UserVO;
import com.firstclass.childrenctv.util.response.BaseResponse;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@AllArgsConstructor
public class FamilyRelationAPIController {
    private final FamilyRelationService familyRelationService;

    @PostMapping("/user/familyRelation")
    public BaseResponse register(HttpServletRequest request, @RequestParam Long childId){
        UserVO user = (UserVO) request.getSession().getAttribute("user");
        if(user == null) return new BaseResponse(400, "로그인 후 이용해주세요.");

        boolean success = familyRelationService.missingChildRegister(user.getUser_id(), childId);
        if(success) return new BaseResponse(200, "성공적으로 등록되었습니다. 아이를 찾을 수 있도록 최선을 다하겠습니다.");
        return new BaseResponse(400, "이미 요청되었습니다.");
    }

    @GetMapping("user/familyRelation/list")
    public BaseResponse findRelationList(HttpServletRequest request){
        UserVO user = (UserVO) request.getSession().getAttribute("user");
        if(user == null) return new BaseResponse(400, "로그인 후 이용해주세요.");

        List<FamilyRelationVO> list = familyRelationService.findRelationByUser(user.getUser_id());
        if(list != null) return new BaseResponse(200, "성공적으로 삭제되었습니다.", list);
        return new BaseResponse(400, "Err : 비정상적인 요청입니다.");
    }
}
