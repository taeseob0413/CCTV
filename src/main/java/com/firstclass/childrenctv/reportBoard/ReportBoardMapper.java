package com.firstclass.childrenctv.reportBoard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportBoardMapper {

	public Long insert(ReportBoardVO board);
	public void update(ReportBoardVO board);
	public ReportBoardVO get(Long report_id);
	public List<ReportBoardVO> getByChild(Long child_id);
	public List<ReportBoardVO> getByUser(String user_loginId);
	
	public void deleteReportBoard(Long report_id);
}
