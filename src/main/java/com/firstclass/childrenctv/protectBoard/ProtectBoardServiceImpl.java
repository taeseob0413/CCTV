package com.firstclass.childrenctv.protectBoard;

import java.util.List;

import org.springframework.stereotype.Service;

import com.firstclass.childrenctv.childBoard.ChildBoardMapper;
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
		Long protect_id = protectMapper.getNotPR();	//작성된 글의 protect_id 가져오기
		int top_age = board.getChild_age()+10;
		int bottom_age = board.getChild_age()-10;
		List<Long> matchingList =childMapper.matching(board.getChild_name(), board.getChild_gender(), top_age, bottom_age);	//matching하는 childId값을 List로 반환
		if(matchingList.size() !=0) {
			for(int i=0; i<matchingList.size(); i++) {
				protectMapper.insertPR(protect_id, matchingList.get(i));
			}
		}
		protectMapper.doPR(protect_id);//pr을 1로 설정함
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
		System.out.println("get List with criteria : " +cri);
		
		return protectMapper.getListWithPaging(cri);
	}

	@Override
	public List<ProtectBoardVO> getByUser(String user_loginId) {
		
		return protectMapper.getByUser(user_loginId);
	}

	@Override
	public List<ProtectBoardVO> getByAddress(String address) {
		
		return protectMapper.getByAddress(address);
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
