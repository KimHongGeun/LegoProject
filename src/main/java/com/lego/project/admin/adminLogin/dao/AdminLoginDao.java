package com.lego.project.admin.adminLogin.dao;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lego.project.admin.adminLogin.vo.AdminLoginVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminLoginDao {

	@Autowired
	private DataSource dataSource;
	
	private final SqlSessionTemplate sql;
	
	// 회원가입 정보전달
	public AdminLoginVo loginInfo(AdminLoginVo adminLoginVo) {
		System.out.println("로그인 dao의 UserLoginVo = "+ adminLoginVo);
		return sql.selectOne("AminLoginDao.adminLogin",adminLoginVo);
	}
}
