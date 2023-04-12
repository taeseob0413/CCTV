package com.firstclass.childrenctv;

import java.sql.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.firstclass.childrenctv.ReportBoard.ReportBoardService;
import com.firstclass.childrenctv.ReportBoard.ReportBoardVO;

@SpringBootTest
public class datasourceTest {
	
	@Autowired
	private ReportBoardService Reportboard;
	
		
		@Test
		public void addreportboard() {
			long currentTimeMillis = System.currentTimeMillis();
	        Date currentDate = new Date(currentTimeMillis);
			ReportBoardVO  board = new ReportBoardVO();
			board.setChild_id(1025L);
			board.setReport_address("대구구구구");
			board.setReport_content("봤다");
			board.setUser_id(20L);
			board.setReport_time(currentDate);
			Reportboard.insert(board);
		}
		
		@Test
		public void getreportboard() {
			ReportBoardVO board =Reportboard.get(1L);
			System.out.println("ReportBoardVO 정보!!!!!!!!!!!!" + board.toString());
		}
		
		@Test
		public void getlistbychild() {
			System.out.println("아이 번호로 찾기!!!!" + Reportboard.getByChild(1025L));
		}
		
		@Test 
		public void getlistbyuser() {
			System.out.println("유저 번호로 찾기!!!!" + Reportboard.getByUser(15188L));
		}
		
		@Test
		public void deletereportboardtest() {		//글 삭제 테스트
			Reportboard.deleteReportBoard(2118L);
		}
		
		@Test
		public void updatereportboardtest() {
			long currentTimeMillis = System.currentTimeMillis();
	        Date currentDate = new Date(currentTimeMillis);
			ReportBoardVO  board = new ReportBoardVO();
			board.setReport_address("평택");
			board.setReport_content("평택에서 봤습니다");
			board.setReport_time(currentDate);
			board.setReport_id(218L);
			Reportboard.update(board);
		}
		
		
}
