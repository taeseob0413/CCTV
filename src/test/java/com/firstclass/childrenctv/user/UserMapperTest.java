package com.firstclass.childrenctv.user;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.firstclass.childrenctv.familyRelation.FamilyRelationMapper;
import com.firstclass.childrenctv.familyRelation.FamilyRelationVO;
import com.firstclass.childrenctv.reportBoard.ReportBoardMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@SpringBootTest
class UserMapperTest {

    @Autowired
    private UserMapper userMapper;
    
    @Autowired
    private ReportBoardMapper reportMapper;
    
    @Autowired
    private FamilyRelationMapper familyMapper;
    
	/* 실종알림 테스트 */
   /* @Test
    void testGetfamilyList() {    	
    	
    	// System.out.println("Hello JUnitTest");
    	    	
    	Long user_Id = 21L; // success scenario
    	
    	//String user_loginId = "hsm" ; // fail scenario    	

    	List<FamilyRelationVO> list = familyMapper.findRelationByUser(user_Id); // mapper -> sql -> data access
    	
    	log.info(list.get(0)); 
    	//log.info(list.get(1));
    	//log.info(list.get(2));
    	 
    	//return list;
    }
    */
	/* 실종알림 삭제 테스트 */
    /* @Test
     void testdeleteFamilyRelationVO() {
     	
     	Long id = 2L;
     	familyMapper.delete(id);    	
     
     }
    */

   /* @Test
    void testGetReportList() {    	
    	
    	// System.out.println("Hello JUnitTest");
    	    	
    	String user_loginId = "test"; // success scenario
    	
    	//String user_loginId = "hsm" ; // fail scenario    	

    	List<ReportBoardVO> list = reportMapper.getReportList(user_loginId); // mapper -> sql -> data access
    	
    	log.info(list.get(0)); 
    	//log.info(list.get(1));
    	//log.info(list.get(2));
    	 
    	//return list;
    }
    */
    
   /* @Test
    void testDeleteReportBoardVO() {
    	
    	Long report_id = 5L;
    	reportMapper.deleteReportBoardVO(report_id);    	
    }*/
    
    
   

//    @Test
//    void create() {
//        UserVO userVO = new UserVO(5L, "s", "s", "s", "s", 13, "ss", "s", "dd");
//        userMapper.create(userVO);
//    }

    /*
    @Test
    void create() {
        //UserVO userVO = new UserVO(2L, "chang dae jun", "eowns1209@gmail.com", "testId", "1234", 13, "ss", "s", "dd");
        //userMapper.create(userVO);
    }


    @Test
    void existIDPASSWORD(){
        UserVO is = userMapper.existUserByIdAndPassword("s2", "s");
        System.out.println(is);
    }

    //동일한 이름과 이메일을 가진 데이터가 있으면 데이터가 2개 불러와져서 오류 발생
    @Test
    void existNameAndEmail(){
        UserVO userVO = userMapper.existUserByNameAndEmail("s", "s");
        System.out.println(userVO);
    }*/
}