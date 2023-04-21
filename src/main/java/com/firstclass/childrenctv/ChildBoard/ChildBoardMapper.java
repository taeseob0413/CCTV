package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChildBoardMapper {
	
   public List<ChildBoardVO> getChildAddr(String child_location);
   
   public List<ChildBoardVO> getChild();
   
   public ChildBoardVO getChildId(Long id);
   
   public void insert(ChildBoardVO child);
   
   public List<ChildBoardVO> getChildWithPaging(Criteria cri);
   
   public int getTotal(Criteria cri);
   
   public List<ChildBoardVO> matching(String child_name, String child_gender, Long top_age, Long bottom_age);
}
	

