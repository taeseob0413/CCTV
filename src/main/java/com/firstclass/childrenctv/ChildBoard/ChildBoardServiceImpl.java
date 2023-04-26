package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.springframework.stereotype.Service;

import com.firstclass.childrenctv.Paging.Criteria;

import lombok.AllArgsConstructor;


import org.springframework.beans.factory.annotation.Autowired;



@Service
@AllArgsConstructor
public class ChildBoardServiceImpl implements ChildBoardService {
   
   @Autowired
   private ChildBoardMapper mapper;

   @Override
   public List<ChildBoardVO> getChildAddr(String child_location) {
      return mapper.getChildAddr(child_location);

   }

   @Override
   public List<ChildBoardVO> getChild() {
      // TODO Auto-generated method stub
      return mapper.getChild();
   }

   @Override
   public ChildBoardVO getChildId(long id) {
      // TODO Auto-generated method stub
      return mapper.getChildId(id);
   }

   @Override
   public void insert(List<ChildBoardVO> childList) {
      for(ChildBoardVO entity:childList) {
         mapper.insert(entity);
      }
   }

   @Override
   public List<ChildBoardVO> getChildList(Criteria cri) {
      return mapper.getChildWithPaging(cri);
   
   }

   @Override
   public int getTotal(Criteria cri) {
      return mapper.getTotal(cri);
   }

}