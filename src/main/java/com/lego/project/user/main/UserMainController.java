package com.lego.project.user.main;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserMainController {
	//메인화면
	@GetMapping("/")
	public String mainPage() {
		return "main/main.user";
		
	}
}
