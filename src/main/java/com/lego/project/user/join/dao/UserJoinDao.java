package com.lego.project.user.join.dao;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lego.project.user.join.vo.UserMemberVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor // 의존성 주입 SqlsessionTempte
public class UserJoinDao {
	// UserJoinDao 는 DB와 연관된 클래스다. 중간의 프레임워크는 mybatis를 사용
		// mybatis의 쿼리들을 호출해주고 매개변수가 있다면 넘겨주고, 리턴값이 있다면 리턴해주는 게 userJoinDao의 역할이다.
	@Autowired
	private DataSource dataSource;
	
	private final SqlSessionTemplate sql;
	
	
	// 회원가입 정보 전달
	public int userInfo(UserMemberVo userMemberVo) {
		System.out.println("회원가입 dao의 userMemberVo = " + userMemberVo );
		return sql.insert("UserJoinDao.userInfo", userMemberVo);
	}
	// 회원가입 전 아이디 중복검사+
		public String userIdCheck(String userId) {
			System.out.println("dao 안에 들어옴 userId = " + userId);
			return sql.selectOne("UserJoinDao.userIdChecking", userId);

		}
}
