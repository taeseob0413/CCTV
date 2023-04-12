package com.firstclass.childrenctv.ChildBoard;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class ChildBoardController {
	
	@Autowired
	private ChildBoardService childBoardService;

}
