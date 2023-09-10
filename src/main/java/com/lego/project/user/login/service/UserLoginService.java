package com.lego.project.user.login.service;

import org.springframework.stereotype.Service;

import com.lego.project.user.login.dao.UserLoginDao;
import com.lego.project.user.login.vo.UserFindIdVo;
import com.lego.project.user.login.vo.UserFindPwVo;
import com.lego.project.user.login.vo.UserLoginVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // 의존성 주입 받는 걸 "생성자주입" 이라고 표현한다.

public class UserLoginService {
	private final UserLoginDao userLoginDao;
	
	//로그인 service
	public UserLoginVo loginInfo(UserLoginVo userLoginVo) {
		System.out.println("로그인 service의 userlogin = "+ userLoginVo);
		UserLoginVo loginData = userLoginDao.loginInfo(userLoginVo);
		System.out.println("loginData : " + loginData);
		return loginData;
	}
	// 아이디 찾기 service
	public boolean findIdConfirm(UserFindIdVo userFindIdVo) {
		System.out.println("아이디 찾기 service의 userFindIdVo = " +userFindIdVo);
		String findIdData = userLoginDao.findIdConfirm(userFindIdVo);
		System.out.println("findIdData :"+ findIdData );
		if(findIdData != null){
			return true;
		}else {
			return false;
		}
		
	}
	// 비밀번호 찾기 service
		public boolean findPwConfirm(UserFindPwVo userFindPwVo) {
			System.out.println("비밀번호 찾기 service의 userFindPwVo = " +userFindPwVo);
			String findPwData = userLoginDao.findPwConfirm(userFindPwVo);
			System.out.println("findPwData :"+ findPwData );
			if(findPwData != null){
				return true;
			}else {
				return false;
			}
			
		}
}
