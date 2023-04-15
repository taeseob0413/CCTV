package com.firstclass.childrenctv.user;

import com.firstclass.childrenctv.util.GmailService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{
    private final UserMapper userMapper;
    private final GmailService gmailService;
    

    @Override
    public void signup(UserVO user) {
    	userMapper.create(user);	
    }

    @Override
    public UserVO signIn(String loginid, String password) {
        UserVO user = null;
        try {
            user = userMapper.existUserByIdAndPassword(loginid, password);
        }catch (Exception e){

        }
        return user;
    }

    @Override
    public String findId(String name, String email) {
        String userLoginId = null;
        try {
            UserVO user = userMapper.existUserByNameAndEmail(name, email);
            userLoginId = user.getUser_loginID();
        }catch (Exception e){

        }
        return userLoginId;
    }

    @Override
    public boolean findpass(String name, String email, String loginId) {
        String userLoginId = null;
        UserVO user = null;
        try {
            user = userMapper.existUserByNameAndEmail(name, email);
            userLoginId = user.getUser_loginID();
        }catch (Exception e){

        }
        if(userLoginId == null || !userLoginId.equals(loginId)) return false;
        gmailService.send(email, "CCTV 비밀번호를 알려드립니다.", "당신의 비밀번호는 " + user.getUser_password() +" 입니다.");
        return true;
    }

    @Override
    public void infoUpdate(UserVO user) {

    }

    @Override
    public List<UserVO> getAllUserList() {
        return null;
    }
}
