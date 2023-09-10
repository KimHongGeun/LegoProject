package com.lego.project.admin.adminLogin.vo;

import lombok.Data;

@Data
public class AdminLoginVo {
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
	private String managerCheck;
}
