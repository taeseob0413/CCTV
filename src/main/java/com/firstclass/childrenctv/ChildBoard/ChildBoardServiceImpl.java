package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ChildBoardServiceImpl implements ChildBoardService {
   
   @Autowired
   private ChildBoardMapper mapper;

   @Override
   public List<ChildBoardVO> getChildAddr(String addr) {
	   return mapper.getChildAddr(addr);

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