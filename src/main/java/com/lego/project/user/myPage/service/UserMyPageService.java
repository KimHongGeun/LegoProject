package com.lego.project.user.myPage.service;

import org.springframework.stereotype.Service;

import com.lego.project.user.myPage.dao.UserMyPageDao;
import com.lego.project.user.myPage.vo.UserUpdateVo;
import com.lego.project.user.myPage.vo.UserWithdrawalVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor// 의존성 주입 받는걸 "생성자주입"이라고말한다.
public class UserMyPageService {
	private final UserMyPageDao userMyPageDao;
	
	// 회원정보 수정 전달
	public int updateInfo(UserUpdateVo userUpdateVo) {
		System.out.println("정보수정 service의 userUpdateVo : " + userUpdateVo);
		int updateInfo = userMyPageDao.updateInfo(userUpdateVo);
		System.out.println("데이터 확인 updateInfo : "+updateInfo );
		System.out.println("-----updateService 중간점검 -------");
		return userMyPageDao.updateInfo(userUpdateVo);
	}
	// 회원탈퇴 
	public int withdrawalInfo(UserWithdrawalVo userWithdrawalVo) {
		System.out.println("service의 회원탈퇴");
		int withdrawalInfo = userMyPageDao.withdrawalInfo(userWithdrawalVo);
		System.out.println("withdrawalInfo : "+ withdrawalInfo);
		return userMyPageDao.withdrawalInfo(userWithdrawalVo);
	}
}
