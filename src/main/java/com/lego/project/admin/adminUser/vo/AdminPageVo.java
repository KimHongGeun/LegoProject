package com.lego.project.admin.adminUser.vo;

import lombok.Data;

@Data

public class AdminPageVo {
	private int userCount;
	private int userSize;
	private int userRow;
	private int pageSize;;
	private int pageCount;
	private int curPageStr;
	private int curPage;
	private int startPage;
	private int endPage;
	private int startIndex;
	private int endIndex;
}
