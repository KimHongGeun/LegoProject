package com.lego.project.user.join.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lego.project.user.join.service.UserJoinService;
import com.lego.project.user.join.vo.UserMemberVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor //의존성 주입
public class UserjoinController {
	private final UserJoinService userJoinService;
	
	
	
	@GetMapping("/join")
	public String joinForm() {
		System.out.println("joinform확인");
		return "join/join.user";
	}
	
	// 회원가입 정보 전달
		@PostMapping("/joinInfo")
		@ResponseBody
		public Map<String, Object> userInfo(@ModelAttribute UserMemberVo userMeberVo) {

			System.out.println("회원가입정보 userId: " + userMeberVo.getUserId() + " / userPw: " + userMeberVo.getUserPw()
					+ " / userName: " + userMeberVo.getUserName() + " / userAddrPostal: " + userMeberVo.getUserAddrPostal()
					+ " / userAddr: " + userMeberVo.getUserAddr() + " / userAddrDetail: " + userMeberVo.getUserAddrDetail()
					+ " / userGender: " + userMeberVo.getUserGender() + " / userBirth: " + userMeberVo.getUserBirth() + " / userCheck: "
					+ userMeberVo.getUserCheck());

			int joinResult = userJoinService.userInfo(userMeberVo);
			System.out.println("controller joinResult : " + joinResult);

			Map<String, Object> result = new HashMap<>();
			result.put("joinResult", joinResult);
			System.out.println("controller result : " + result);
			return result;
		};

		// 회원가입 전 아이디 중복체크
		// join.jsp(ajax)->controller->service->dao->mapper->
		// dao->service->controller(service의 결과를 변수에 담음)->join.jsp(ajax)
		@PostMapping("/userIdCheck")
		@ResponseBody
		public String userIdCheck(@RequestParam("userId") String userId) {
			System.out.println("controller userId : " + userId);
			String userIdChecking = userJoinService.userIdCheck(userId);
			System.out.println("controller의 userIdChecking = " + userIdChecking);
			return userIdChecking;
		}

//		@ResponseBody
//		@RequestMapping(value = "idCheck.do", method = RequestMethod.GET)
//		public void idCheck(String userId, UserMemberVo userJoinVo, HttpServletRequest request) {
//			System.out.println("idCheck 들어옴");
//			System.out.println(request.getParameter("userId = " + userId));
//		}

}
