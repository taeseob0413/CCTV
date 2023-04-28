package com.firstclass.childrenctv.ReportBoard;

import java.util.List;

public interface ReportBoardService {

	public void insert(ReportBoardVO board); // 제보 글 등록

	public void update(ReportBoardVO board); // 제보 글 수정

	public ReportBoardVO get(Long report_id); // 제보 글 보기

	public List<ReportBoardVO> getByChild(Long child_id); // 실종 아동별 글 목록 가져오기

	public List<ReportBoardVO> getByUser(String user_loginId); // 작성자별 글 목록 가져오기

	// 제보 목록 가져오기
	public List<ReportBoardVO> getReportList(String user_loginId);

	// 제보 목록에서 글 삭제하기
	//public void deleteReportBoardVO(Long report_id);

	public void deleteReportBoard(Long report_id); // delete

}
