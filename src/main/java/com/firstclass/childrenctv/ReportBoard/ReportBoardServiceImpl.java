package com.firstclass.childrenctv.ReportBoard;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReportBoardServiceImpl implements ReportBoardService {

	private ReportBoardMapper mapper;

	@Override
	public void insert(ReportBoardVO board) {		// 제보 글 등록
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
	public ReportBoardVO get(Long report_id) {		//제보 상세 글 보기
		
		return mapper.get(report_id);
	}

	@Override
	public List<ReportBoardVO> getByChild(Long child_id) {		//실종 아동별 제보 글 보기
		
		return mapper.getByChild(child_id);
	}

	@Override
	public List<ReportBoardVO> getByUser(Long user_id) {		//작성자별 제보 글 보기
		
		return mapper.getByUser(user_id);
	}

}
