package com.firstclass.childrenctv.ChildBoard;

import java.util.List;

import org.springframework.stereotype.Service;
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
   
   @Override
   public List<ChildBoardVO> matching(String child_name, String child_gender, Long child_age){
	   Long top_age = child_age+10;
	   Long bottom_age = child_age-10;
	   System.out.println("서비스단에서 정보!!!" +child_name+child_gender +top_age+bottom_age );
	   return mapper.matching(child_name, child_gender, top_age, bottom_age);
   }

}