package com.lego.project.user.myPage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lego.project.user.myPage.service.UserMyPageService;
import com.lego.project.user.myPage.vo.UserUpdateVo;
import com.lego.project.user.myPage.vo.UserWithdrawalVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class UserMyPageController {

	private final UserMyPageService userMypageService;
	
	//MyPage 
	@GetMapping("/myPage")
	public String myPage(){
		return "myPage/myPage.user";
	}
	
	// 정보수정
	@GetMapping("/update")
	public String update(UserUpdateVo userUpdateVo, HttpSession session) {
		System.out.println("--------update--------");
		String userId = (String) session.getAttribute("userId");
		String userPw = (String) session.getAttribute("userPw");
		String userName = (String) session.getAttribute("userName");
		String userAddrPostal = (String) session.getAttribute("userAddrPostal");
		String userAddr = (String) session.getAttribute("userAddr");
		String userAddrDetail = (String) session.getAttribute("userAttrbute");
		System.out.println("userId : "+ userId);
		System.out.println("userPw : "+ userPw);
		System.out.println("userName : "+ userName);
		System.out.println("userAddrPostal : " + userAddrPostal);
		System.out.println("userAddr : " + userAddr);
		System.out.println("userAddrDetail : " + userAddrDetail);
		System.out.println("----update페이지로 이동한다----");
		
		return "myPage/update.uesr";
	}
	
	// 정보수정 정보 전달
	@PostMapping("/updateInfo")
	@ResponseBody//ajax 사용하기위해 쓰는 어노테이션
	public Map<String, Object> updateInfo(@ModelAttribute UserUpdateVo userUpdateVo){
		System.out.println("userMyPageVo / userPw : "+ userUpdateVo.getUserPw() + "userName : "
				+ userUpdateVo.getUserName() + "userAddrPostal : " + userUpdateVo.getUserAddrPostal() + "userAddr : "
				+ userUpdateVo.getUserAddr() + "userAddrDetail : " + userUpdateVo.getUserAddrDetail());
		
		int updateResult = userMypageService.updateInfo(userUpdateVo);
		System.out.println("updateResult :" + updateResult);
		
		Map<String, Object> result =new HashMap<>();
		result.put("updateResult", updateResult);
		System.out.println("controller result : "+ result);
		return result;
	
		}
	//회원 탈퇴
	@GetMapping("/withdrawal")
	public String withdrawal() {
		System.out.println("회원탈퇴 확인");
		return "myPage/withdrawal.user";
	}
	//회원탈퇴 정보 전달
	@PostMapping("/withdrawalInfo")
	@ResponseBody
	public int withdrawalInfo(@ModelAttribute UserWithdrawalVo userWithdrawalVo, HttpSession session) {
		System.out.println("widthdrawalInfo controller 에 들어옴 ");
		int result = userMypageService.withdrawalInfo(userWithdrawalVo);
		if(result == 1) {
			session.invalidate();
		}else {
			
		}
		return result;
	}
	
	
	
	}
	
	

