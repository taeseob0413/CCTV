package com.firstclass.childrenctv.ProtectBoard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProtectBoardMapper {

	public void insert(ProtectBoardVO board);
	public void update(ProtectBoardVO board);
	public ProtectBoardVO get(Long protect_id);
	public List<ProtectBoardVO> getAll();
	public List<ProtectBoardVO> getByUser(String user_loginId);
	public List<ProtectBoardVO> getByAddress(String address);
	public void delete(Long protect_id);
	
	
}
