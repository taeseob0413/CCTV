package com.firstclass.childrenctv;



import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.firstclass.childrenctv.ChildBoard.ChildBoardService;
import com.firstclass.childrenctv.ChildBoard.ChildBoardVO;

@SpringBootTest
public class ChildBoardTest {
   
    @Autowired
   private ChildBoardService service;
   
   @Test
   public void testInsert() {
      ChildBoardVO child=new ChildBoardVO();
      child.setChild_curage(25L);
      child.setChild_occage(20L);
      child.setChild_feature("ㄴㄴ");
      child.setChild_gender("ㅇㅇ");
      child.setChild_img("ㅇㅇ");
      child.setChild_location("ㅇㅇ");
      child.setChild_name("Kim");
      child.setChild_outfit("노란 옷");
      child.setChild_time("11시");
      
      service.insert(child);
      
   }
   
   
}