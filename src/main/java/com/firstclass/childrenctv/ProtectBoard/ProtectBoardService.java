package com.firstclass.childrenctv.ProtectBoard;

import java.util.List;

import com.firstclass.childrenctv.util.paging.Criteria;

public interface ProtectBoardService {

	public void insert(ProtectBoardVO board);	//보호 글 등록
	public void update(ProtectBoardVO board);		//보호 글 수정
	public ProtectBoardVO get(Long protect_id);		//상세 보호 글 보기
	public List<ProtectBoardVO> getAll(Criteria cri);	//페이징 해서 조회
	public int getTotal(Criteria cri);	//데이터 전체 개수 처리
	public List<ProtectBoardVO> getByUser(String user_loginId);		//작성자별 글 보기
	public void delete(Long protect_id);		//보호 글 삭제
	
	public List<Long> getProtectByChild(Long child_id);		//child_id로 protect 찾아내기
	
}
