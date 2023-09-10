package com.lego.project.user.prooduct.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.lego.project.user.prooduct.service.UserProductService;
import com.lego.project.user.prooduct.vo.UserProductVo;

import lombok.RequiredArgsConstructor;

@Controller 
@RequiredArgsConstructor
public class UserProductController {

	private final UserProductService userProductService;

	@GetMapping("/product")
	public String product() {
		return "product/product.user";
	}

	@GetMapping("/car1")
	public UserProductVo car1(String car) {
		System.out.println("car1에 들어옴");
		car = "car";
		List<UserProductVo> result = userProductService.car1(car);
		UserProductVo userProductVo = result.get(0);
		System.out.println("controller result : " + result);

		if (!result.isEmpty()) {

			System.out.println("controller result : " + result);
			System.out.println("seq : " + userProductVo.getProductSeq());
			System.out.println("name : " + userProductVo.getProductName());
			System.out.println("classfi : " + userProductVo.getProductClassification());

			if (userProductVo.getProductClassification() != "car") {
				System.out.println("성공");
				return userProductVo;
			} else {
				System.out.println("실패");
				return userProductVo;
			}
		}
		System.out.println("result 비어있음");
		return userProductVo;
	}

	@GetMapping("/car2")
	public String car2() {
		return "product/car2.user";
	}

	@GetMapping("/car3")
	public String car3() {
		return "product/car3.user";
	}

	@GetMapping("/car4")
	public String car4() {
		return "product/car4.user";
	}

	@GetMapping("/car5")
	public String car5() {
		return "product/car5.user";
	}

	@GetMapping("/car6")
	public String car6() {
		return "product/car6.user";
	}
}

