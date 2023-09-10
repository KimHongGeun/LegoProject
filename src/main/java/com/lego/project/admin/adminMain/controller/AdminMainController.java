package com.lego.project.admin.adminMain.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminMainController {
	
	//메인페이지
	@GetMapping("adminMain")
	public String adminMain(HttpSession session) {
		System.out.println("관리자 메인페이지 들어옴");
		String userId = (String)session.getAttribute("userId");
		if(userId != null && userId.contentEquals("admin")) {
			return "admin/main/adminMain";
		}else {
			System.out.println("로그인 후 이용이 가능합니다.");
			return "admin/login/adminLogin";
			
		}
		
	}
}
