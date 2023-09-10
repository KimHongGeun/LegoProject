package com.lego.project.user.prooduct.vo;

import lombok.Data;

@Data
public class UserProductVo {
	private int productSeq;
	private String productName;
	private int productPrice;
	private int productQuantity;
	private String productContent;
	private String productClassification;

}
