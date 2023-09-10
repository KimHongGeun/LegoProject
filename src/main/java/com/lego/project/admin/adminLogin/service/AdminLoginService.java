package com.lego.project.admin.adminLogin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lego.project.admin.adminLogin.dao.AdminLoginDao;
import com.lego.project.admin.adminLogin.vo.AdminLoginVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor// 의존성 주입 받는 걸 "생성자주입" 이라고 표현한다
public class AdminLoginService {
	@Autowired
	private final AdminLoginDao adminLoginDao;
	
	// 로그인 service
	public AdminLoginVo loginInfo(AdminLoginVo adminLoginVo) {
		System.out.println("로그인 service의 userloginVo = " + adminLoginVo);
		AdminLoginVo loginData = adminLoginDao.loginInfo(adminLoginVo);
		System.out.println("loginData : " + loginData);
		return loginData;
	}
}
