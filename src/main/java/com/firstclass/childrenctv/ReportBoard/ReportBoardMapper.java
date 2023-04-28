package com.firstclass.childrenctv.ReportBoard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportBoardMapper {

	public void insert(ReportBoardVO board);
	public void update(ReportBoardVO board);
	
	public ReportBoardVO get(Long report_id);
	public List<ReportBoardVO> getByChild(Long child_id);
	public List<ReportBoardVO> getByUser(String user_loginId);
	
	// 제보 목록 가져오기
	public List<ReportBoardVO> getReportList(String user_loginId);
	
	// 제보 목록에서 글 삭제하기
	//public void deleteReportBoardVO(Long report_id);
	
	public void deleteReportBoard(Long report_id); 

}
