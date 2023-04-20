package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest

public class ChildBoardMapperTests {

	@Autowired
	private ChildBoardMapper mapper;
	
	@Test
	public void testPaging() {
		
		Criteria cri = new Criteria();
		
		List<ChildBoardVO> list = mapper.getListWithPaging(cri);
		
		System.out.println(list);
	}
}
