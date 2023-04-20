
package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.springframework.stereotype.Service;

@Service
public interface ChildBoardService {
		
	// List<ChildBoardVO> getChildAddr(String child_location);
	
	List<ChildBoardVO> getList(Criteria cri); //목록
	
	ChildBoardVO get(Long child_id); //상세
	
	//void insert(List<ChildBoardVO> childEntityList);
}
