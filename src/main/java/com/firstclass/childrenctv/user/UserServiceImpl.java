package com.firstclass.childrenctv.user;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{
    private final UserMapper userMapper;
    @Override
    public void signup(UserVO user) {

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
        return null;
    }

    @Override
    public String findpass(String name, String email, String loginId) {
        return null;
    }

    @Override
    public void infoUpdate(UserVO user) {

    }

    @Override
    public List<UserVO> getAllUserList() {
        return null;
    }
}
