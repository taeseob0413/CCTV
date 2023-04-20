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


  // @Override
  // public List<ChildBoardVO> getChildAddr(String child_location) {
	//   return mapper.getChildAddr(child_location);

  // }

   @Override
   public List<ChildBoardVO> getList(Criteria cri) {
      // TODO Auto-generated method stub
      return mapper.getListWithPaging(cri);
   }

	
   @Override
   public ChildBoardVO get(Long child_id) {
      // TODO Auto-generated method stub
      return mapper.read(child_id);
   }
   
   //@Override
   //public void insert(List<ChildBoardVO> childEntityList) {
     // mapper.insert(childEntityList);
      
   

}