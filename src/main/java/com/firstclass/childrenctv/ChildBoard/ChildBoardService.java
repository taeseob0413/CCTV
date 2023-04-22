
package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

public interface ChildBoardService {
	List<ChildBoardVO> getChildAddr(String child_location);
	
	List<ChildBoardVO> getChild();
	
	ChildBoardVO getChildId(Long id);
	
	void insert(ChildBoardVO child);
	
	public void register(ChildBoardVO child);
}
