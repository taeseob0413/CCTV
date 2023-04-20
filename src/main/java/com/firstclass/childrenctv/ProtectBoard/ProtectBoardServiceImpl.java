package com.firstclass.childrenctv.ProtectBoard;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProtectBoardServiceImpl implements ProtectBoardService {

	private ProtectBoardMapper mapper;
	
	@Override
	public void insert(ProtectBoardVO board) {
		
		mapper.insert(board);
	}

	@Override
	public void update(ProtectBoardVO board) {
		
		mapper.update(board);
	}

	@Override
	public ProtectBoardVO get(Long protect_id) {
		
		return mapper.get(protect_id);
	}

	@Override
	public List<ProtectBoardVO> getAll() {
		
		return mapper.getAll();
	}

	@Override
	public List<ProtectBoardVO> getByUser(String user_loginId) {
		
		return mapper.getByUser(user_loginId);
	}

	@Override
	public List<ProtectBoardVO> getByAddress(String address) {
		
		return mapper.getByAddress(address);
	}

	@Override
	public void delete(Long protect_id) {
		
		mapper.delete(protect_id);
	}

}
