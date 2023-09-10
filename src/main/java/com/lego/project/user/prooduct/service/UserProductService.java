package com.lego.project.user.prooduct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lego.project.user.prooduct.dao.UserProductDao;
import com.lego.project.user.prooduct.vo.UserProductVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor// 의존성 주입 받는걸 "생성자주입" 이라고 표현한다
public class UserProductService {
	private final UserProductDao userProductDao;
	
	// 상세페이지 bread1
	public List<UserProductVo> car1(String car) {
		System.out.println("service car불러옴");
		List<UserProductVo> result =userProductDao.car1(car);
		System.out.println("service result : " + result);
		return result;
		
	}

}
