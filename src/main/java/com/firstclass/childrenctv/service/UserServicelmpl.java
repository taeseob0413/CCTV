package com.firstclass.childrenctv.service;

import org.springframework.stereotype.Service;

import com.firstclass.childrenctv.mapper.UserMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserServicelmpl implements UserService {

	private UserMapper mapper;
	
	@Override
	public void add(String name, int age, String phone) {
		mapper.add(name, age, phone);
		System.out.println("진짜 제발!!!!");
	}

}
