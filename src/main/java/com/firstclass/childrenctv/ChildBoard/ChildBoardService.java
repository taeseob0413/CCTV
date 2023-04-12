package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

public interface ChildBoardService {
	void insert();
	
	List<ChildBoardVO> getChild();
	
	ChildBoardVO getChildId(Long id);
	
	public void insert(ChildBoardVO child);
	
}
