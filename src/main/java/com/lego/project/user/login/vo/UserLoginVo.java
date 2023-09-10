package com.lego.project.user.login.vo;

import lombok.Data;
// 로그인 정보 
@Data
public class UserLoginVo {
	private int userSeq;
	private String userId;
	private String userPw;
	private String userName;
	private String userAddrPostal;
	private String userAddr;
	private String userAddrDetail;
	private String userGender;
	private String userBirth;
	private String userCheck;
}
