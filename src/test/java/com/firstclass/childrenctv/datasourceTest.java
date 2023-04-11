package com.firstclass.childrenctv;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.firstclass.childrenctv.domain.ReportBoardVO;
import com.firstclass.childrenctv.service.ReportBoardService;

@SpringBootTest
public class datasourceTest {
	
	@Autowired
	private ReportBoardService Reportboard;
	
		
		@Test
		public void addreportboard() {

			ReportBoardVO  board = new ReportBoardVO();
			board.setChild_id(1025L);
			board.setReport_address("대구");
			board.setReport_content("봤다");
			board.setReport_id(9L);
			board.setUser_id(15188L);
			Reportboard.insert(board);
		}
		
		@Test
		public void getreportboard() {
			ReportBoardVO board =Reportboard.get(3L);
			
			System.out.println("ReportBoardVO 정보!!!!!!!!!!!!" + board.toString());
		}
		
		@Test
		public void getlistbychild() {
			System.out.println("아이 번호로 찾기!!!!" + Reportboard.getByChild(1025L));
		}
		
		@Test void getlistbyuser() {
			System.out.println("유저 번호로 찾기!!!!" + Reportboard.getByUser(15188L));
		}
		
		
		
		
	

}
