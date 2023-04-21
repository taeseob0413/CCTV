
package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

public interface ChildBoardService {
	List<ChildBoardVO> getChildAddr(String child_location);
	
	List<ChildBoardVO> getChild();
	
	ChildBoardVO getChildId(Long id);
	
	void insert(ChildBoardVO child);
	
	public void register(ChildBoardVO child);
	
	public List<ChildBoardVO> matching(String child_name, String child_gender, Long child_age);
}
