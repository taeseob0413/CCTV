package com.firstclass.childrenctv.ChildBoard;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.firstclass.childrenctv.protectBoard.ProtectBoardService;
import com.firstclass.childrenctv.protectBoard.ProtectBoardVO;
import com.firstclass.childrenctv.reportBoard.ReportBoardService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ChildBoardController {
	
	@Autowired
	private ChildBoardService service;
	@Autowired
	private ReportBoardService boardService;
	@Autowired
	private ProtectBoardService protectService;
	
	 @GetMapping("/child/list")
	   public String list(Criteria cri,Model model) {
	      List<ChildBoardVO> cl=service.getChildList(cri);
	      int total=service.getTotal(cri);
	      PageDTO paging=new PageDTO(cri, total);
	      model.addAttribute("list", cl);
	      model.addAttribute("pageMaker",paging);
	      
	      return "childboard/child";
	   }


	 @GetMapping("/child/get")
	 public String get(@RequestParam("child_id") Long child_id,Model model) {
		 model.addAttribute("child",service.getChildId(child_id));
		 model.addAttribute("report", boardService.getByChild(child_id));
		 //보호목록 가져오기
		 List<Long> matchProtectIDList = protectService.getProtectByChild(child_id);		//매칭 된 protect_id 가져오기
		 if(matchProtectIDList !=null) {
			 List<ProtectBoardVO> matchProtectList = new ArrayList<>();
			 for(int i=0; i<matchProtectIDList.size(); i++) {
				 matchProtectList.add(protectService.get(matchProtectIDList.get(i)));
			 }
			 model.addAttribute("protect", matchProtectList);
		 }


		 return "childboard/get";
	 }
	
}