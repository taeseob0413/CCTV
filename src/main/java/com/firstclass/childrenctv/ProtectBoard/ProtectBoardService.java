package com.firstclass.childrenctv.ProtectBoard;

import java.util.List;

public interface ProtectBoardService {

	public void insert(ProtectBoardVO board);	//보호 글 등록
	public void update(ProtectBoardVO board);		//보호 글 수정
	public ProtectBoardVO get(Long protect_id);		//상세 보호 글 보기
	public List<ProtectBoardVO> getAll();		//보호 글 전체리스트
	public List<ProtectBoardVO> getByUser(Long user_id);		//작성자별 글 보기
	public List<ProtectBoardVO> getByAddress(String address);	//지역별 글 보기
	public void delete(Long protect_id);		//보호 글 삭제
	
	public String getLoginId(Long user_id);	//사용자 로그인 아이디 가져오기
}
