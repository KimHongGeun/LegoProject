package com.lego.project.user.prooduct.dao;

import java.util.List;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lego.project.user.prooduct.vo.UserProductVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor // 의존성 주입 받는다. sqlSessionTemplate
public class UserProductDao {
	// UserProductDao 는 DB와 연관된 클래스다. 중간의 프레임워크는 mybatis를 사용
	// mybatis의 쿼리들을 호출해주고 매개변수가 있다면 넘겨주고, 리턴값이 있다면 리턴해주는게 UserProductDao의역활이다.
	@Autowired
	private DataSource dataSource;
	private final SqlSessionTemplate sql;
	
	//회원정보 수정 전달
	public List<UserProductVo> car1(String car){
		System.out.println("product dao 들어옴");
		List<UserProductVo> result =sql.selectList("UserJoinDao.userProduct",car);
		System.out.println("dao result :" + result);
		return result;
	}
	


}
