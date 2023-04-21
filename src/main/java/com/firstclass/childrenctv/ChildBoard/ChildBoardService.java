
package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ChildBoardService {
		
	List<ChildBoardVO> getChildAddr(String child_location);
	
	List<ChildBoardVO> getChild();
	
	ChildBoardVO getChildId(Long id);
	
	//List<ChildBoardVO> getList(Criteria cri); //목록
	
	public void register(ChildBoardVO child);
	
	void insert(ChildBoardVO child);
}
