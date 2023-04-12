package com.firstclass.childrenctv.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.firstclass.childrenctv.domain.UserVO;

@Mapper
public interface UserMapper {
	void create(UserVO userVO);

}
