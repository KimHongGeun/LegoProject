package com.lego.project.admin.adminLogin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lego.project.admin.adminLogin.dao.AdminLoginDao;
import com.lego.project.admin.adminLogin.service.AdminLoginService;
import com.lego.project.admin.adminLogin.vo.AdminLoginVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminLoginController {

	private final AdminLoginDao adminLoginDao;
	private final AdminLoginService adminLoginService;
	
	//로그인
	@GetMapping("/adminLogin")
	public String adminLogin() {
		System.out.println("관리자 로그인 들어옴");
		return "admin/login/adminLogin";
	}
	
	// 로그인 정보 전달하는 메소드
	@PostMapping("/adminLoginInfo")
	@ResponseBody
	public boolean loginInfo(@ModelAttribute AdminLoginVo adminLoginVo, HttpSession session) {
		System.out.println("---------------로그인메소드--------------------");

		AdminLoginVo loginResult = adminLoginService.loginInfo(adminLoginVo);
		if (loginResult != null) {
			session.setAttribute("loggedIn", true);
			session.setAttribute("userId", loginResult.getUserId());
			return true;
		} else {
			session.setAttribute("loggedIn", false);
			System.out.println("controller의 else를 타고 있음");
			return false;
		}

	}
	
	//로그아웃
	@PostMapping("/adminLogut")
	@ResponseBody
	public String adminLogout(HttpSession session) {
		System.out.println("관리자 로그아웃 들어옴");
		session.invalidate();
		return "admin/login/adminLgoin";
	}
}
