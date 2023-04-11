package com.firstclass.childrenctv.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.firstclass.childrenctv.domain.ReportBoardVO;
import com.firstclass.childrenctv.mapper.ReportBoardMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReportBoardServiceImpl implements ReportBoardService {

	private ReportBoardMapper mapper;

	@Override
	public void insert(ReportBoardVO board) {
		mapper.insert(board);
	}

	@Override
	public void update(ReportBoardVO board) {
		mapper.update(board);
	}

	@Override
	public void delete(Long report_id) {
		mapper.delete(report_id);
	}
	

	@Override
	public ReportBoardVO get(Long report_id) {
		
		return mapper.get(report_id);
	}

	@Override
	public List<ReportBoardVO> getByChild(Long child_id) {
		
		return mapper.getByChild(child_id);
	}

	@Override
	public List<ReportBoardVO> getByUser(Long user_id) {
		
		return mapper.getByUser(user_id);
	}

}
