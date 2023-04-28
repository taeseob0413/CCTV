package com.firstclass.childrenctv.reportBoard;

import java.util.List;

public interface ReportBoardService {

	public void insert(ReportBoardVO board);	// 제보 글 등록
	public void update(ReportBoardVO board);	// 제보 글 수정
	public ReportBoardVO get(Long report_id);		// 상세 제보 글 보기
	public List<ReportBoardVO> getByChild(Long child_id);		// 실종 아동별 글 보기
	public List<ReportBoardVO> getByUser(String user_loginId);		// 작성자별 글 보기
	
	public void deleteReportBoard(Long report_id); // delete
}
