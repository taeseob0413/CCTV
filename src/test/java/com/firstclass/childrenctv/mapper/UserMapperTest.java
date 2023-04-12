package com.firstclass.childrenctv.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.firstclass.childrenctv.domain.UserVO;

@SpringBootTest
public class UserMapperTest {
	
	@Autowired
	private UserMapper userMapper;
	@Test
	void create() {
		UserVO userVO = new UserVO(1L, "s", "s", "s", "s", "s", "ss", 13, "dd");
        userMapper.create(userVO);
	}

}
