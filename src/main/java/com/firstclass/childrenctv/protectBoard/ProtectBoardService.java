package com.firstclass.childrenctv.protectBoard;

import java.util.List;

public interface ProtectBoardService {

	public void insert(ProtectBoardVO board);	//보호 글 등록
	public void update(ProtectBoardVO board);		//보호 글 수정
	public ProtectBoardVO get(Long protect_id);		//상세 보호 글 보기
	public List<ProtectBoardVO> getAll();		//보호 글 전체리스트
	public List<ProtectBoardVO> getByUser(String user_loginId);		//작성자별 글 보기
	public List<ProtectBoardVO> getByAddress(String address);	//지역별 글 보기
	public void delete(Long protect_id);		//보호 글 삭제
	
	public List<Long> getProtectByChild(Long child_id);
	
}
