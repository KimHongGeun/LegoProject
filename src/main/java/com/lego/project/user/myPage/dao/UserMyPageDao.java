package com.lego.project.user.myPage.dao;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lego.project.user.myPage.vo.UserUpdateVo;
import com.lego.project.user.myPage.vo.UserWithdrawalVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor // 의존성 주입 받는다. sqlSessionTemplate
public class UserMyPageDao {
	//UserJoinDao는 DB와 연관된 클래스다. 중간의 프레임워크는 mybatis를 사용
	//mybatis의 쿼리들을 호출해주고 매개변수가 있다면 넘겨주고, 리턴값이 있다면 리턴해주는게 userJoinDao의 역활이다.
	
	@Autowired
	private DataSource  dataSource;
	
	private final SqlSessionTemplate sql;
	
	// 회원정보 수정 전달
	public int updateInfo(UserUpdateVo userUpdateVo){
		System.out.println("정보전달 dao의 userUpdateVo : " + userUpdateVo);
		System.out.println("------updateDao 중간점검 -------");
		return sql.update("UserJoinDao.updateInfo", userUpdateVo);
	}
	
	public int withdrawalInfo(UserWithdrawalVo userWithdrawalVo) {
		System.out.println("회원탈퇴의 dao에 들어옴");
		return sql.delete("UserJoinDao.withdrawalInfo", userWithdrawalVo);
	}
	
	
}
