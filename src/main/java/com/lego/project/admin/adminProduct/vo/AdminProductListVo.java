package com.lego.project.admin.adminProduct.vo;

import lombok.Data;

@Data
public class AdminProductListVo {
	private int productCount;
	private int productSize;
	private int productRow;
	private int pageSize;
	private int pageCount;
	private int curPageStr;
	private int curPage;
	private int startPage;
	private int endPage;
	private int startIndex;
	private int endIndex;
}
