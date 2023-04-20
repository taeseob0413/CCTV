package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChildBoardMapper {
	
	public List<ChildBoardVO> getChildAddr(String child_location); 
	
	public List<ChildBoardVO> getList(); // 실종아동 조회
	
	public ChildBoardVO getChildId(Long id);
	
	public void insert(ChildBoardVO board); // 시퀀스의 다음 값을 구해서 insert 할 때 사용
	
	public Integer insertSelectKey(ChildBoardVO board); // pk값을 미리 sql을 통해 처리해 두고 특정한 이름으로 결과 보관
	
	public List<ChildBoardVO> getListWithPaging(Criteria cri); // 게시글 목록 페이징
	
    public ChildBoardVO read(Long child_id); // insert된 데이터 조회
	
}
