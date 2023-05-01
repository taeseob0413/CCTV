package com.firstclass.childrenctv.ProtectBoard;

import java.util.List;

import org.springframework.stereotype.Service;

import com.firstclass.childrenctv.ChildBoard.ChildBoardMapper;
import com.firstclass.childrenctv.util.paging.Criteria;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProtectBoardServiceImpl implements ProtectBoardService {

	private ProtectBoardMapper protectMapper;
	private ChildBoardMapper childMapper;
	
	@Override
	public void insert(ProtectBoardVO board) {

		protectMapper.insert(board);
		//matching 작업 시작
		matching(board.getProtect_id());
	}
	
	//matching 작업
	private void matching(Long protect_id) {
		ProtectBoardVO board = protectMapper.getNoneApproval(protect_id);
		int top_age = board.getChild_age()+10;
		int bottom_age = board.getChild_age()-10;		//검색하는 실종 아동의 나이를 +-10으로 검색
		List<Long> matchingList =childMapper.matching(board.getChild_name(), board.getChild_gender(), top_age, bottom_age);
		if(matchingList.size() !=0) {
			for(int i=0; i<matchingList.size(); i++) {
				protectMapper.insertPR(protect_id, matchingList.get(i));		//protectrelation 테이블에 매칭 저장
			}
		}
			
	}

	@Override
	public void update(ProtectBoardVO board) {
		
		protectMapper.update(board);
	}

	@Override
	public ProtectBoardVO get(Long protect_id) {
		
		return protectMapper.get(protect_id);
	}

	@Override
	public List<ProtectBoardVO> getAll(Criteria cri) {
		
		return protectMapper.getListWithPaging(cri);
	}

	@Override
	public List<ProtectBoardVO> getByUser(String user_loginId) {
		
		return protectMapper.getByUser(user_loginId);
	}

	@Override
	public void delete(Long protect_id) {
		
		protectMapper.delete(protect_id);
	}

	@Override
	public List<Long> getProtectByChild(Long child_id) {
		
		return protectMapper.getProtectByChild(child_id);
	}

	@Override
	public int getTotal(Criteria cri) {
		
		return protectMapper.getTotalCount(cri);
	}

}
