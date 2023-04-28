package com.firstclass.childrenctv.ReportBoard;



import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class ReportBoardServiceImpl implements ReportBoardService {

	private ReportBoardMapper mapper;

	@Override
	public void insert(ReportBoardVO board) {// 제보 글 등록
		
		mapper.insert(board);		
	}

	@Override
	public void update(ReportBoardVO board) {		//제보 글 수정
		mapper.update(board);
	}


	@Override
	public ReportBoardVO get(Long report_id) {
		
		return mapper.get(report_id);
	}

	@Override
	public List<ReportBoardVO> getByChild(Long child_id) {		//실종 아동별 제보 글 보기
		
		return mapper.getByChild(child_id);
	}

	@Override
	public List<ReportBoardVO> getByUser(String user_loginId) {		//작성자별 제보 글 보기
		
		return mapper.getByUser(user_loginId);
	}
	
	// 제보 목록 가져오기
	@Override
	public List<ReportBoardVO> getReportList(String user_loginId) {
		
		return mapper.getReportList(user_loginId);
		/*
		 * System.out.println("Hello JUnitTest");
		 * 
		 * List<ReportBoardVO> list = mapper.getReportList(); // mapper -> sql -> data
		 * access
		 * 
		 * log.info(list.get(0)); log.info(list.get(1)); log.info(list.get(2));
		 * 
		 * return list;
		 */
		
	}
	
	/*// 제보목록에서 글 삭제하기
		@Override
	public void deleteReportBoardVO(Long report_id) {		//제보 글 삭제
		
		mapper.deleteReportBoardVO(report_id);
	} */
	
	
	
	@Override
	public void deleteReportBoard(Long report_id) {		//제보 글 삭제
		
		mapper.deleteReportBoard(report_id);
	}
	


}
