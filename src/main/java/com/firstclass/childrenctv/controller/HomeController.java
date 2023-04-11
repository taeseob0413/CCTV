package com.firstclass.childrenctv.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/home")
	public String home() {
		System.out.println("return home");
		return "home";
	}

	
	
}