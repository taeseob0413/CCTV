package com.firstclass.childrenctv;

import static org.assertj.core.api.Assertions.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ChildrenctvApplicationTests {

	@Test
	void contextLoads() {
	}
	
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
}
