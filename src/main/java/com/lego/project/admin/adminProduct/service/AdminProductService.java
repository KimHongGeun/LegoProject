package com.lego.project.admin.adminProduct.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lego.project.admin.adminProduct.dao.AdminProductDao;
import com.lego.project.admin.adminProduct.vo.AdminFileVo;
import com.lego.project.admin.adminProduct.vo.AdminProductListVo;
import com.lego.project.admin.adminProduct.vo.AdminProductVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // 의존성 주입 받는 걸 "생성자주입" 이라고 표현한다
public class AdminProductService {
	@Autowired
	private final AdminProductDao adminProductDao;

	// 파일 이름 중복검사
	public String adminProductNameCheck(AdminProductVo adminProductVo) {
		System.out.println("adminProductNameCheck name : " + adminProductVo.getProductName());
		String result = adminProductDao.adminProductNameCheck(adminProductVo);
		System.out.println("파일이름 중복검사 result : " + result);
		return result;
	}

	// 관리자 상품 등록
	public int adminProductInfo(AdminProductVo adminProductVo, Integer productSeq) {
		System.out.println("관리자 service 상품 등록");
		System.out.println("adminProductVo name : " + adminProductVo.getProductName());
		int result = adminProductDao.adminProductInfo(adminProductVo, productSeq);
		return result;
	}

	// 관리자 파일 등록
	public int adminFileInfo(AdminFileVo adminFileVo, Integer productSeq) {
		System.out.println("관리자 service 파일 등록");
		System.out.println("adminFileVo name : " + adminFileVo.getFileName());
		System.out.println("file productSeq : " + productSeq);
		adminFileVo.setProductSeq(productSeq);
		int result = adminProductDao.adminFileInfo(adminFileVo);
		return result;
	}

	// 상품 전체 수 조회
	public int adminProductCount() {
		System.out.println("상품 전체 수 조회하는 service");
		int productCount = adminProductDao.adminProductCount();
		System.out.println("상품 전체 수 조회하는 service productCount : " + productCount);
		return productCount;
	}

	// 상품 목록 조회
	public List<AdminProductVo> adminProductList(AdminProductVo adminProductVo, AdminProductListVo adminProductListVo) {
		System.out.println("상품 정보 조회 service의 adminProductVo : " + adminProductVo);
		List<AdminProductVo> productList = adminProductDao.adminProductList(adminProductVo, adminProductListVo);
		return productList;
	}

	// 상품 삭제
	public int productDel(String selProduct) {
		System.out.println("상품삭제 service의 selProduct : " + selProduct);
		return adminProductDao.productDel(selProduct);
	}

}