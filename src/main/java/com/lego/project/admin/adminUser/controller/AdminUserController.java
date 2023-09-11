package com.lego.project.admin.adminUser.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.lego.project.admin.adminUser.dao.AdminUserDao;
import com.lego.project.admin.adminUser.service.AdminUserService;
import com.lego.project.admin.adminUser.vo.AdminPageVo;
import com.lego.project.admin.adminUser.vo.AdminUserVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminUserController {
	@Autowired
	private AdminUserService adminUserService;
	private AdminUserVo adminUserVo;
	private AdminUserDao adminUserDao;
	private ObjectMapper objectMapper = new ObjectMapper();
	
	//회원관리 페이지 
	@GetMapping("/adminUser")
	public String adminUser(HttpSession session) {
		System.out.println("회원관리 페이지 들어옴");
		String userId = (String)session.getAttribute("userId");
		
		if(userId != null && userId.equals("manager")) {
			return "admin/user/adminUser";
		}else {
			System.out.println("로그인 후 이용이 가능합니다.");
			return "redirect:/adminLogin";
		}
	}
	// 회원조회 페이지 
	
	@GetMapping(value = "/adminUserInfo", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<Object> adminUserInfo(@ModelAttribute AdminUserVo adminUserVo, AdminPageVo adminPageVo,
			HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") String currentPage){
		String userId = (String) session.getAttribute("userId");
		if (userId != null && userId.equals("manager")) {
			//회원 총 인원
			int userCount = adminUserService.adminUserCount();
			System.out.println("------------ userCount : " + userCount);
			// 화면에 보여지는 회원 수
			int userSize = 10;
			// 화면에 보여지는 페이지 개수
			int pageSize = 5;
			// 페이지 총 개수
			int pageCount = (userCount / userSize) + (userCount % userSize == 0 ? 0 : 1);
			// 현재 페이지 구하기
			String curPageStr = currentPage;
			if (curPageStr == null) {
				curPageStr = "1";
			}
			int curPage = Integer.parseInt(curPageStr);
			// 시작 페이지 구하기
			int startPage = 1;
			if (curPage % pageSize == 0) {
				startPage = ((curPage / pageSize) - 1) * pageSize + 1;
			} else {
				startPage = (curPage / pageSize) * pageSize + 1;
			}
			// 끝 페이지 구하기
			int endPage = startPage + pageSize - 1;
			// 시작 인덱스 구하기
			int startIndex = (curPage - 1) * userSize + 1;
			// 마지막 인덱스 구하기
			int endIndex = curPage * userSize;
			// 시작 인덱스 제한
			if (startIndex == 0) {
				startIndex = 1;
			}
//			// 마지막 인덱스 제한
//			if (endIndex == 9) {
//				endIndex = 10;
//			}
			// 마지막 페이지 제한
			if (endPage > pageCount) {
				endPage = pageCount;
			}
			// 마지막 인덱스 제한
			if (endIndex > userCount) {
				endIndex = userCount;
			}

			adminPageVo.setUserCount(userCount);
			adminPageVo.setUserSize(userSize);
			adminPageVo.setPageSize(pageSize);
			adminPageVo.setPageCount(pageCount);
			adminPageVo.setCurPage(curPage);
			adminPageVo.setStartPage(startPage);
			adminPageVo.setEndPage(endPage);
			adminPageVo.setStartIndex(startIndex);
			adminPageVo.setEndIndex(endIndex);

			List<AdminUserVo> userList = adminUserService.adminUserInfo(adminUserVo, adminPageVo);
			// DB에 뽑히는 리스트 만큼의 정수
			System.out.println("test userList : " + userList);
			int userRow = userList.size();
			adminPageVo.setUserRow(userRow);
			List<AdminPageVo> userPage = new ArrayList<>();
			List<Object> resultList = new ArrayList<>();
			userPage.add(adminPageVo);
			resultList.add(userPage);
			resultList.add(userList);

			System.out.println("userCount : " + userCount);
			System.out.println("userSize : " + userSize);
			System.out.println("userRow : " + userRow);
			System.out.println("pageSize : " + pageSize);
			System.out.println("pageCount : " + pageCount);
			System.out.println("curPageStr : " + curPageStr);
			System.out.println("curPage : " + curPage);
			System.out.println("startPage : " + startPage);
			System.out.println("endPage : " + endPage);
			System.out.println("startIndex : " + startIndex);
			System.out.println("endIndex : " + endIndex);
			System.out.println("return resultList : " + resultList);
			return resultList;
		} else {
			System.out.println("로그인 후 이용이 가능합니다.");
			return null;
		}
	}

	// 회원 삭제 버튼
	@GetMapping(value = "/userDelete", produces = "application/json;charset=utf-8")
	@ResponseBody
	public int userDelete(HttpSession session, @RequestParam("selUserId") String selUserId) {
		System.out.println("회원삭제 들어옴");
		String userId = (String) session.getAttribute("userId");

		if (userId != null && userId.equals("manager")) {
			System.out.println("selUserId : " + selUserId);
			List<String> selUserIds = Arrays.asList(selUserId.split(","));
			System.out.println("--selUserIds : " + selUserIds);
			int userDel = adminUserService.userDelete(selUserIds);
			return userDel;
		} else {
			System.out.println("로그인 후 이용이 가능합니다.");
			return 0;
		}
	}
	}
