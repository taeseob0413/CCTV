package com.firstclass.childrenctv;

import java.util.List;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.firstclass.childrenctv.ChildBoard.ChildBoardVO;

@SpringBootTest
public class ChildBoardControllerTest {
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@BeforeEach
	public void setup() {
		this.mockMvc=MockMvcBuilders.webAppContextSetup(ctx).build();
		}
	@Test
	public void testGetController() throws Exception{
		List<ChildBoardVO> child_list=(List<ChildBoardVO>) MockMvcRequestBuilders.get("/child/list");
		for(ChildBoardVO sss: child_list) {
			System.out.println(sss.getChild_name());
		}
	}
	
	@Test
	public void testGet() throws Exception {
		
		
	}
	
}
