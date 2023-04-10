package com.firstclass.childrenctv;

import static org.assertj.core.api.Assertions.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import com.firstclass.childrenctv.service.UserService;

@SpringBootTest
public class datasourceTest {
	
	@Autowired
	private UserService user;
	
		@Test
		public void testConnection() {
			try (Connection con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", 
					"CCTV", 
					"1234")) {
				
				System.out.println(con);
			} catch (Exception e) {
				fail(e.getMessage());
			}
		}
		
		@Test
		public void addtest() {
			String name ="LCH";
			int age = 24;
			String phone = "010-0000-0000";
			user.add(name, age, phone);
		}
	

}
