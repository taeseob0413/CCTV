package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class ChildBoardServiceImpl implements ChildBoardService {
	
	private ChildBoardMapper mapper;

	@Override
	public void insert() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<ChildBoardVO> getChild() {
		// TODO Auto-generated method stub
		return mapper.getChild();
	}

	@Override
	public ChildBoardVO getChildId(Long id) {
		// TODO Auto-generated method stub
		return mapper.getChildId(id);
	}

	@Override
	public void insert(ChildBoardVO child) {
		mapper.insert(child);

	}

}
