package com.lego.project.user.login.dao;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lego.project.user.login.vo.UserFindIdVo;
import com.lego.project.user.login.vo.UserFindPwVo;
import com.lego.project.user.login.vo.UserLoginVo;

import lombok.RequiredArgsConstructor;

@Repository //Dao를 필수 어노테이션
@RequiredArgsConstructor //사용자 생성
public class UserLoginDao {
	
	@Autowired // this를 안쓰기위해 
	private DataSource dataSource;
	
	private final SqlSessionTemplate sql;
	
	
	// 회원가입 정보 전달
	public UserLoginVo loginInfo(UserLoginVo userLoginVo) {
		System.out.println("로그인 dao의 userLoginVo ="+ userLoginVo);
		return sql.selectOne("UserJoinDao.login",userLoginVo);
	}
	
	// 아이디 찾기 정보 전달
	public String findIdConfirm(UserFindIdVo userFindIdVo){
		System.out.println("아이디 찾기 dao의 userFindIdVo = " + userFindIdVo);
		return sql.selectOne("UserJoinDao.findIdConfirm", userFindIdVo);
	}
	// 비밀번 찾기 정보 전달
	public String findPwConfirm(UserFindPwVo userFindPwVo){
		System.out.println("비밀번 찾기 dao의 userFindPwVo = " + userFindPwVo);
		return sql.selectOne("UserJoinDao.findPwConfirm", userFindPwVo);
	} 
}
