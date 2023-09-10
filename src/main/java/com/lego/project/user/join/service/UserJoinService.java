package com.lego.project.user.join.service;

import org.springframework.stereotype.Service;

import com.lego.project.user.join.dao.UserJoinDao;
import com.lego.project.user.join.vo.UserMemberVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserJoinService {
	private final UserJoinDao userJoinDao;
	
	public int userInfo(UserMemberVo userMemberVo) {
		System.out.println("회원가입 service의 userMemberVo = " + userMemberVo);
		return userJoinDao.userInfo(userMemberVo);
	}
	public String userIdCheck(String userId) {
		System.out.println("service 들어옴 : " + userId);
		String userIdChecking = userJoinDao.userIdCheck(userId);
		System.out.println("dao 안의 userIdChecking = " + userIdChecking);
		return userJoinDao.userIdCheck(userId);
	}

}
