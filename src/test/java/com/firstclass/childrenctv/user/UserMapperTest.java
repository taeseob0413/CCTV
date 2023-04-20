package com.firstclass.childrenctv.user;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserMapperTest {

    @Autowired
    private UserMapper userMapper;

//    @Test
//    void create() {
//        UserVO userVO = new UserVO(5L, "s", "s", "s", "s", 13, "ss", "s", "dd");
//        userMapper.create(userVO);
//    }

    @Test
    void create() {
        //UserVO userVO = new UserVO(2L, "chang dae jun", "eowns1209@gmail.com", "testId", "1234", 13, "ss", "s", "dd");
        //userMapper.create(userVO);
    }


    @Test
    void existIDPASSWORD(){
        UserVO is = userMapper.existUserByIdAndPassword("s2", "s");
        System.out.println(is);
    }

    //동일한 이름과 이메일을 가진 데이터가 있으면 데이터가 2개 불러와져서 오류 발생
    @Test
    void existNameAndEmail(){
        UserVO userVO = userMapper.existUserByNameAndEmail("s", "s");
        System.out.println(userVO);
    }
}