package com.firstclass.childrenctv;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.firstclass.childrenctv.childBoard.ChildBoardVO;
import com.firstclass.childrenctv.safetyMap.SafetyMapService;
import com.firstclass.childrenctv.safetyMap.SafetyMapVO;


@SpringBootTest
public class SafetyMapServiceTest {
	
    @Autowired
	private SafetyMapService service;
	
	@Test
	public void testInsert() {
		ChildBoardVO s= new ChildBoardVO();
		
		SafetyMapVO safe=new SafetyMapVO();
		safe.setSafety_address("서울특별시 광진구 뚝섬로52마길 56-0");
		safe.setSafety_class("어린이집");
		safe.setSafety_latitude(37.5281957);
		safe.setSafety_longitude(127.0812972);
		safe.setSafety_name("동아마트");
		safe.setSafety_telno("02-446-0553");
		
	}
	@Test
	public void testGet() {
		List<SafetyMapVO> safe_list=service.getSafetyMap();
		for(SafetyMapVO sss:safe_list) {
			System.out.println(sss.getSafety_name());
		}
	}
	@Test
	public void testGetAddr() {
		List<SafetyMapVO> safe_list=service.getSafetyMapAddr(37.535744,127.1463936);
		for(SafetyMapVO sss:safe_list) {
			System.out.println(sss.getSafety_name());
		}
	}
	
	
}
