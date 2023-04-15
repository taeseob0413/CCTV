package com.firstclass.childrenctv.ReportBoard;

import java.util.List;

public interface ReportBoardService {

	public void insert(ReportBoardVO board);	// 제보 글 등록
	public void update(ReportBoardVO board);	// 제보 글 수정
	public ReportBoardVO get(Long report_id);		// 상세 제보 글 보기
	public List<ReportBoardVO> getByChild(Long child_id);		// 실종 아동별 글 보기
	public List<ReportBoardVO> getByUser(Long user_id);		// 작성자별 글 보기
	public String getLoginId(Long user_id);		// 사용자 로그인 아이디 가져오기
	
	public void deleteReportBoard(Long report_id); // delete
}
