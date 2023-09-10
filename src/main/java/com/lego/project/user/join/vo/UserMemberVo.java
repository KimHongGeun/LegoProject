package com.lego.project.user.join.vo;

import lombok.Data;

@Data
public class UserMemberVo {
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
