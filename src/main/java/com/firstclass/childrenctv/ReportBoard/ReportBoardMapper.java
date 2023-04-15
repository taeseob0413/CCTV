package com.firstclass.childrenctv.ReportBoard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportBoardMapper {

	public void insert(ReportBoardVO board);
	public void update(ReportBoardVO board);
	public List<ReportBoardVO> get(Long report_id);
	public List<ReportBoardVO> getByChild(Long child_id);
	public List<ReportBoardVO> getByUser(Long user_id);
	
	public void deleteReportBoard(Long report_id);
}
