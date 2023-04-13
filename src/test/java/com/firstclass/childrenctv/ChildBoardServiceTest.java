package com.firstclass.childrenctv;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.firstclass.childrenctv.ChildBoard.ChildBoardService;
import com.firstclass.childrenctv.ChildBoard.ChildBoardVO;


@SpringBootTest
public class ChildBoardServiceTest {
	
    @Autowired
	private ChildBoardService service;
	
	@Test
	public void testRegister() {
		ChildBoardVO child=new ChildBoardVO();
		child.setChild_age(15L);
		child.setChild_feature("안녕하세요");
		child.setChild_gender("m");
		child.setChild_height(100f);
		child.setChild_location("seoul");
		child.setChild_name("gkgkgk");
		child.setChild_outfit("ddd");
		child.setChild_time("11시11");
		
		service.insert(child);
		System.out.println("성공");
		
	}
	@Test
	public void testGet() {
		List<ChildBoardVO> child_list=service.getChildAddr("송파");
		for(ChildBoardVO sss: child_list) {
			System.out.println(sss.getChild_name());
		}
		
	}
}
