package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChildBoardMapper {
	
	public List<ChildBoardVO> getChildAddr(String child_location); 
	
	public List<ChildBoardVO> getChild();
	
	public ChildBoardVO getChildId(Long id);
	
	public void insert(ChildBoardVO child); 
	
	//public Integer insertSelectKey(ChildBoardVO board); // pk값을 미리 sql을 통해 처리해 두고 특정한 이름으로 결과 보관
	
	//public List<ChildBoardVO> getListWithPaging(Criteria cri); // 게시글 목록 페이징
	
    //public ChildBoardVO read(Long child_id); // insert된 데이터 조회
	
}
