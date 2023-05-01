package com.firstclass.childrenctv.ChildBoard;

import java.util.List;


import com.firstclass.childrenctv.util.paging.Criteria;

public interface ChildBoardService {
	   List<ChildBoardVO> getChildAddr(String child_location);
	   
	   List<ChildBoardVO> getChild();
	   
	   ChildBoardVO getChildId(long id);
	   
	   List<ChildBoardVO> getChildList(Criteria cri);
	   
	   void insert(List<ChildBoardVO> childList);
	   
	   public int getTotal(Criteria cri);

}
