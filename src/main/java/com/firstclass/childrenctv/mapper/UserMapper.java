package com.firstclass.childrenctv.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

	public int add(String name, int age, String phone);
}
