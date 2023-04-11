package com.firstclass.childrenctv.user;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserMapperTest {

    @Autowired
    private UserMapper userMapper;
    @Test
    void create() {
        UserVO userVO = new UserVO(1L, "s", "s", "s", "s", "s", "ss", 13, "dd");
        userMapper.create(userVO);
    }

    @Test
    void existIDPASSWORD(){
        boolean is = userMapper.existUserByIdAndPassword("s2", "s");
        System.out.println(is);
    }
}