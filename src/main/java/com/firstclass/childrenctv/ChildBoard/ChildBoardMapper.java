package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.firstclass.childrenctv.Paging.Criteria;

@Mapper
public interface ChildBoardMapper {
   public List<ChildBoardVO> getChildAddr(String child_location);
   
   public List<ChildBoardVO> getChild();
   
   public ChildBoardVO getChildId(Long id);
   
   public void insert(ChildBoardVO child);
   
   public List<ChildBoardVO> getChildWithPaging(Criteria cri);
   
   public int getTotal(Criteria cri);
}
	

