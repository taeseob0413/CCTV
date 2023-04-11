package com.firstclass.childrenctv.service;

import java.util.List;

import com.firstclass.childrenctv.domain.ReportBoardVO;

public interface ReportBoardService {

	public void insert(ReportBoardVO board);	// 제보 글 등록
	public void update(ReportBoardVO board);
	public void delete(Long report_id);
	public ReportBoardVO get(Long report_id);		// 상세 제보 글 보기
	public List<ReportBoardVO> getByChild(Long child_id);		// 실종 아동별 글 보기
	public List<ReportBoardVO> getByUser(Long user_id);		// 작성자별 글 보기
	
}
