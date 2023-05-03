package com.firstclass.childrenctv.familyRelation;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.firstclass.childrenctv.childBoard.ChildBoardVO;
import com.firstclass.childrenctv.reportBoard.ReportBoardVO;
import com.firstclass.childrenctv.user.UserVO;

import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class FamilyRelationController1 {

    private final FamilyRelationService familyRelationService;
    
  // 목록 가져오기
  		@RequestMapping(value = "/mypage/register", method = RequestMethod.GET)
  		public String myWrite(Model model, HttpSession session) {

  			log.info("---------------start my write -----------------");

  			UserVO user = (UserVO) session.getAttribute("user");

  			List<FamilyRelationVO> familyList = familyRelationService.findRelationByUser(user.getUser_id()); // 제보글 목록 가져오기 mapper.sml
  																									// -> sql명령문 ->DB data
  																									// acess
  			List<ChildBoardVO> children = familyRelationService.getChildrenByUser(user.getUser_id());
			log.info("---------familyList[0]: " + familyList.get(0));
			log.info("---------first child[0]: " + children.get(0));
			
			//ChildBoardVO child0 = children.get(0);
			
			//log.info("---------first child id: " + child0.getChild_id());
			//log.info("---------first child name: " + child0.getChild_name());
			
//			for (ChildBoardVO child : children) {
//  				log.info("child " + child); // 4
//  			} 
			
  			// log.info(reportList.get(0));
  			// log.info(reportList.get(1));
  			// log.info(reportList.get(2)); // 3개의 정보를 가져오기

//  			for (FamilyRelationVO family : familyList) {
//  				family.setChild_name("test");
//  				log.info(family);
//  			} // 이거는 전부가져오기
//  			
  			for(int i=0; i<children.size(); i++) {
  				familyList.get(i).setChild_name(children.get(i).getChild_name());
  			}
  	        
  			log.info("---------------end my write -----------------");
  			// jsp에 뿌려줄 데이터를 넘기기 위해서 mapping
  			// model ==data
  			
  			model.addAttribute("familyList", familyList); // 배열

  			return "/mypage/register";
  			// return "fake";
  		}
    
    

  		// 삭제하기 
  		@RequestMapping(value = "/mypage/register/delete" , method = RequestMethod.GET )
  		public String deleteFamilyRelationVO(@RequestParam("id") Long id) {
  			log.info("---------------start delete family  -----------------");
  			
  			//  1. JSP로부터 report_id 전달받기 
  			log.info("*********************id****************************: " + id );
  			
  			// 2, DB에서 삭제 
  			familyRelationService.unregister(id);
  			
  		
  			log.info("---------------end delete family -----------------");
  			
  			// 3. refresh 된 list 보여주기
  			//return "redirect:/mypage/register/delete?id=" + id;		
  			return "redirect:/mypage/register";
  		}
    
    
  		
    
    /*@GetMapping("/mypage/register")
    public void addchild(FamilyRelationVO family, HttpSession session) {    	
    	UserVO user = (UserVO)session.getAttribute("user_id");
    	family.setUser_id(user.getUser_id());    	
    	familyRelationService.addchild(family);  
    }
    
    @PostMapping("/mypage/register")
	public String mypageregister() {
		return "/mypage/register";
    }*/
}
