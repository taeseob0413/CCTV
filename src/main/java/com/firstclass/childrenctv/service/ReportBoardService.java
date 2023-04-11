package com.firstclass.childrenctv.service;

import java.util.List;

import com.firstclass.childrenctv.domain.ReportBoardVO;

public interface ReportBoardService {

	public void insert(ReportBoardVO board);
	public void update(ReportBoardVO board);
	public void delete(Long report_id);
	public ReportBoardVO get(Long report_id);
	public List<ReportBoardVO> getByChild(Long child_id);
	public List<ReportBoardVO> getByUser(Long user_id);
	
}
