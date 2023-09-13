package com.lego.project.user.login.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lego.project.user.login.dao.UserLoginDao;
import com.lego.project.user.login.service.UserLoginService;
import com.lego.project.user.login.vo.UserFindIdVo;
import com.lego.project.user.login.vo.UserFindPwVo;
import com.lego.project.user.login.vo.UserLoginVo;

import lombok.RequiredArgsConstructor;




@Controller
@RequiredArgsConstructor

public class UserLoginController {

	private final UserLoginDao userLoginDao;
	private final UserLoginService userLoginService;

	// 로그인 버튼 눌렀을때
	@GetMapping("/login")
	public String login() {
		System.out.println("login 들어옴");
		return "login/login.user";
	}
	
	// 로그인 정보 전달하는 메소드 
	@PostMapping("/loginInfo")
	@ResponseBody//ajax를 사용하기위해 필요한 어노테이션
	public boolean loginInfo(@ModelAttribute UserLoginVo userLoginVo, HttpSession session, String userId, String userPw) {
	System.out.println("--------로그인메소드-------");
	UserLoginVo loginResult = userLoginService.loginInfo(userLoginVo);
	System.out.println("controller userLgoinService.loginInfo(userLoginVo)"+ userLoginService.loginInfo(userLoginVo));
	if (loginResult != null) {
		session.setAttribute("loggedIn", true);
		session.setAttribute("userId", loginResult.getUserId());
		session.setAttribute("userPw", loginResult.getUserPw());
		session.setAttribute("userName", loginResult.getUserName());
		session.setAttribute("userAddrPostal", loginResult.getUserAddrPostal());
		session.setAttribute("userAddr", loginResult.getUserAddr());
		session.setAttribute("userAddrDetail", loginResult.getUserAddrDetail());
		System.out.println("loginResult.getUserCheck() : " + loginResult.getUserCheck());
		if ("Y".equals(loginResult.getUserCheck())) {
			System.out.println("로그인 가능한 회원임");
			return true;
		} else {
			session.setAttribute("loggedIn", false);
			System.out.println("탈퇴한 회원임");
			return false;
		}
	} else {
		session.setAttribute("loggedIn", false);
		System.out.println("controller의 else를 타고 있음");
		return false;
	}
	}
	

	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "login/logout.user";
}
	//아이디 찾기 
	@GetMapping("/findId")
	public String findId() {
		return "login/findId.user";
	}
	
	// 아이디 찾기에 필요한 이름, 비밀번호, 생년월일 정보 전달
	@PostMapping("/findIdConfirm")
	@ResponseBody
	public HashMap<String, String> findIdConfirm(@ModelAttribute UserFindIdVo userFindIdVo, HttpServletRequest requset){
		System.out.println("아이디찾기에 필요한 이름 비밀번호 생년 전달");
		HashMap<String, String> map = new HashMap<String, String>();
		
		String userId = userLoginDao.findIdConfirm(userFindIdVo);
		System.out.println("userId : "+userId);
		map.put("findId", userId);
		System.out.println("map : "+ map);
		return map;
		
	}
	// 아이디 찾기 페이지에 아이디 보여주기
		@GetMapping("/findIdConfirm")
		public ModelAndView findIdConfirm(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView("login/findIdConfirm.user");

			System.out.println("아이디 결과 : " + request.getParameter("findId"));
			String findId = request.getParameter("findId");
			mav.addObject("findId", findId);
			return mav;
		}
	// 비밀번호 찾기 페이지
	@GetMapping("/findPw")
	public String findPw() {
		return "login/findPw.user";
	}

	// 비밀번호 찾기에 필요한 아이디, 이름, 생년월일 정보 전달
	@PostMapping("/findPwConfirm")
	@ResponseBody
	public HashMap<String, String> findPwConfirm(@ModelAttribute UserFindPwVo userFindPwVo, HttpServletRequest request) {
		HashMap<String, String> map = new HashMap<String, String>();

		String userPw = userLoginDao.findPwConfirm(userFindPwVo);
		System.out.println("userPw : " + userPw);
		map.put("findPw", userPw);

		return map;
	}

	// 비밀번호 찾기 페이지에서 비밀번호 보여주기
	@GetMapping("/findPwConfirm")
	public ModelAndView findPwConfirm(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("login/findPwConfirm.user");

		System.out.println("아이디 결과 : " + request.getParameter("findPw"));
		String findPw = request.getParameter("findPw");
		mav.addObject("findPw", findPw);
		return mav;
	}

}
