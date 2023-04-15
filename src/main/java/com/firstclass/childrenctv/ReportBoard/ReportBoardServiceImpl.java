package com.firstclass.childrenctv.ReportBoard;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReportBoardServiceImpl implements ReportBoardService {

	private ReportBoardService service;

	@Override
	public void insert(ReportBoardVO board) {// 제보 글 등록
		
		service.insert(board);
		
	}

	@Override
	public void update(ReportBoardVO board) {		//제보 글 수정
		service.update(board);
	}

	@Override
	public List<ReportBoardVO> get(Long report_id) {		//제보 상세 글 보기
		
		return service.get(report_id);
	}

	@Override
	public List<ReportBoardVO> getByChild(Long child_id) {		//실종 아동별 제보 글 보기
		
		return service.getByChild(child_id);
	}

	@Override
	public List<ReportBoardVO> getByUser(Long user_id) {		//작성자별 제보 글 보기
		
		return service.getByUser(user_id);
	}
	
	@Override
	public void deleteReportBoard(Long report_id) {		//제보 글 삭제
		
		service.deleteReportBoard(report_id);
	}
	

}
