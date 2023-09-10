package com.lego.project.admin.adminProduct.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.gson.JsonObject;
import com.lego.project.admin.adminProduct.dao.AdminProductDao;
import com.lego.project.admin.adminProduct.service.AdminProductService;
import com.lego.project.admin.adminProduct.vo.AdminFileVo;
import com.lego.project.admin.adminProduct.vo.AdminProductListVo;
import com.lego.project.admin.adminProduct.vo.AdminProductVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AdminProductController {

	@Autowired
	private AdminProductService adminProductService;
	private AdminProductVo adminProductVo;
	private AdminProductDao adminProductDao;

	// 상품관리 페이지 들어옴
	@GetMapping("/adminProduct")
	public String adminUser(HttpSession session) {
		System.out.println("상품관리 페이지 들어옴");
		String userId = (String) session.getAttribute("userId");

		if (userId != null && userId.equals("admin")) {
			return "admin/product/adminProduct";
		} else {
			System.out.println("로그인 후 이용이 가능합니다.");
			return "redirect:/adminLogin";
		}
	}

	// 상품 등록하는 팝업 들어옴
	@GetMapping(value = "/adminProductRegi")
	public String adminProductRegi(HttpSession session) {
		System.out.println("상품관리 페이지 들어옴");
		String userId = (String) session.getAttribute("userId");

		if (userId != null && userId.equals("admin")) {
			System.out.println("팝업창 true");
			return "admin/product/adminProductRegi";
		} else {
			System.out.println("로그인 후 이용이 가능합니다.");
			return "redirect:/adminLogin";
		}
	}

	// 이미지 폴더 저장 및 파일생성, 업로드
	@PostMapping(value = "/adminProductImg")
	@ResponseBody
	public String adminProductImg(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws Exception {

		System.out.println("adminProductImg 들어옴");
		JsonObject json = new JsonObject();
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null;
		MultipartFile file = multiFile.getFile("upload");
		System.out.println("multiFile : " + multiFile);
		System.out.println("file : " + file);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("---if중첩 시작");
		System.out.println("--uid : " + uid);

		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						System.out.println("---try 들어옴");
						// 파일 이름 가져오기
						String fileName = file.getOriginalFilename();
						byte[] bytes = file.getBytes();

						// 파일 경로 생성
						String uploadPath = request.getSession().getServletContext().getRealPath("/resources/ckUpload/");
						// 폴더 생성
						File folder = new File(uploadPath);
						System.out.println("folder : " + folder);
						if (!folder.exists()) {
							try {
								folder.mkdirs(); // 폴더 생성
								System.out.println("폴더생성!!");
							} catch (Exception e) {
								e.getStackTrace();
							}
						}
						String fileSave = uploadPath + uid + fileName;

						System.out.println("fileSave : " + fileSave);

						out = new FileOutputStream(new File(fileSave));
						out.write(bytes);

						// 파일 생성
						String test = "";
						test = request.getContextPath() + "/resources/ckUpload/" + uid + fileName;
						System.out.println("test : " + test);

						printWriter = response.getWriter();
						response.setContentType("text/html");

						json.addProperty("uploaded", 1);
						json.addProperty("fileName", uid + fileName);
						json.addProperty("url", test);
						printWriter.println(json);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
		return null;
	}

	// 상품 대표이미지 폴더에 저장
	@PostMapping(value = "/productRepImg")
	@ResponseBody
	public String productRepImg(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest productRepImg) throws Exception {
		System.out.println("대표이미지로gdgdgdgdgdgdgd");
		System.out.println("productRepImg : " + productRepImg);
		JsonObject json = new JsonObject();
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null;
		MultipartFile file = productRepImg.getFile("file");
		System.out.println("대표이미지로multiFile : " + productRepImg);
		System.out.println("file : " + file);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		System.out.println("-대표이미지로-if중첩 시작");
		System.out.println("--uid : " + uid);

		if (file != null) {
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {
					try {
						System.out.println("대표이미지로 들어옴");
						// 파일 이름 가져오기
						String fileName = file.getOriginalFilename();
						byte[] bytes = file.getBytes();

						// 파일 경로 생성
						String uploadPath = request.getSession().getServletContext().getRealPath("/resources/ckUpload/");
						// 폴더 생성
						File folder = new File(uploadPath);
						System.out.println("대표이미지로 folder : " + folder);
						if (!folder.exists()) {
							try {
								folder.mkdirs(); // 폴더 생성
								System.out.println("대표이미지로 폴더생성!!");
							} catch (Exception e) {
								e.getStackTrace();
							}
						}
						String fileSave = uploadPath + uid + fileName;

						System.out.println("대표이미지로 fileSave : " + fileSave);

						out = new FileOutputStream(new File(fileSave));
						out.write(bytes);

						// 파일 생성
						String test = "";
						test = request.getContextPath() + "/resources/ckUpload/" + uid + fileName;
						System.out.println("test : " + test);

						printWriter = response.getWriter();
						response.setContentType("text/html");

						json.addProperty("uploaded", 1);
						json.addProperty("fileName", uid + fileName);
						json.addProperty("url", test);
						printWriter.println(json);
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						if (out != null) {
							out.close();
						}
						if (printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
		return null;
	}

	// 상품 정보 등록
	@PostMapping(value = "/adminProductInfo")
	@ResponseBody
	public String adminProductInfo(HttpSession session, @ModelAttribute AdminProductVo adminProductVo,
			@ModelAttribute AdminFileVo adminFileVo, MultipartHttpServletRequest multiFile, Integer productSeq) {
		System.out.println("adminProductInfo 들어옴");

		String userId = (String) session.getAttribute("userId");

		if (userId != null && userId.equals("admin")) {
			// 상품명 중복 체크
			System.out.println("adminFileVo img : " + adminFileVo.getProductRepImg());
			String result = adminProductService.adminProductNameCheck(adminProductVo);
			System.out.println("상품명 중복체크 result : " + result);
			System.out.println("--------------------");
			String productNameCheck = adminProductVo.getProductName();
			System.out.println("productNameCheck : " + productNameCheck);
			System.out.println("productNameCheck의 타입: " + productNameCheck.getClass().getName());
			System.out.println("--------------------");
			if (productNameCheck.equals(result)) {
				System.out.println("name이 중복되었습니다");
				return "redirect:/adminLogin";
			} else {
				System.out.println("---adminFileVo getName " + adminFileVo.getFileName());
				System.out.println("---adminFileVo filePath " + adminFileVo.getFilePath());
				System.out.println("---!!adminFileVo productRepImg " + adminFileVo.getProductRepImg());
				UUID uuid = UUID.randomUUID();

				System.out.println("adminProductVo. name : " + adminProductVo.getProductName());
				System.out.println("adminProductVo. productPrice : " + adminProductVo.getProductPrice());
				System.out.println("adminProductVo. productQuantity : " + adminProductVo.getProductQuantity());
				System.out.println("adminProductVo. productContent : " + adminProductVo.getProductContent());
				System.out.println("adminProductVo. productClassification  : " + adminProductVo.getProductClassification());

				System.out.println("adminFileVo.getProductRepImg() : " + adminFileVo.getProductRepImg());
				System.out.println("uuid : " + uuid);
				int productResult = adminProductService.adminProductInfo(adminProductVo, productSeq);
				productSeq = adminProductVo.getProductSeq();
				System.out.println("productSeq : " + productSeq);
				int fileResult = adminProductService.adminFileInfo(adminFileVo, productSeq);
				System.out.println("fileResult : " + fileResult);

				return "상품등록 성공!";
			}

		} else {
			System.out.println("로그인 후 이용이 가능합니다.");
			return "redirect:/adminLogin";
		}
	}

	// 상품 리스트 조회 페이징
	@GetMapping(value = "/adminProductList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public List<Object> adminProductList(@ModelAttribute AdminProductListVo adminProductListVo,
			AdminProductVo adminProductVo, AdminFileVo adminFileVo, HttpSession session,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") String currentPage)
			throws JsonProcessingException {
		System.out.println("currentPage : " + currentPage);
		System.out.println("관리자 상품관리 들어옴1");

		String userId = (String) session.getAttribute("userId");
		if (userId != null && userId.contentEquals("admin")) {
			System.out.println("괸리자 상품 페이징 들어옴");
			// 상품 총 개수
			int productCount = adminProductService.adminProductCount();
			System.out.println("productCount : " + productCount);
			// 화면에 보여지는 상품 개수
			int productSize = 10;
			// 화면에 보여지는 페이지 개수
			int pageSize = 5;
			// 페이지 총 개수
			int pageCount = (productCount / productSize) + (productCount % productSize == 0 ? 0 : 1);
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
			int startIndex = (curPage - 1) * productSize + 1;

			// 마지막 인덱스 구하기
			int endIndex = curPage * productSize;

			if (startIndex == 0) {
				startIndex = 1;
			}
//			if (endIndex == 9) {
//				endIndex = 10;
//			}

			if (endPage > pageCount) {
				endPage = pageCount;
			}
			if (endIndex > productCount) {
				endIndex = productCount;
			}

			adminProductListVo.setProductCount(productCount);
			adminProductListVo.setProductSize(productSize);
			adminProductListVo.setPageSize(pageSize);
			adminProductListVo.setPageCount(pageCount);
			adminProductListVo.setCurPage(curPage);
			adminProductListVo.setStartPage(startPage);
			adminProductListVo.setEndPage(endPage);
			adminProductListVo.setStartIndex(startIndex);
			adminProductListVo.setEndIndex(endIndex);

			List<AdminProductVo> productList = adminProductService.adminProductList(adminProductVo, adminProductListVo);
			// DB에 뽑히는 리스트 만큼의 정수
			System.out.println("test productList : " + productList);
			int productRow = productList.size();
			adminProductListVo.setProductRow(productRow);
			List<AdminProductListVo> productPage = new ArrayList<>();
			List<Object> resultList = new ArrayList<>();
			productPage.add(adminProductListVo);
			resultList.add(productPage);
			resultList.add(productList);

			System.out.println("productCount : " + productCount);
			System.out.println("productSize : " + productSize);
			System.out.println("productRow : " + productRow);
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

	// 상품 삭제 버튼
	@GetMapping(value = "/productDel", produces = "application/json;charset=utf-8")
	@ResponseBody
	public int productDel(HttpSession session, @RequestParam("selProduct") String selProduct) {
		System.out.println("상품 삭제 들어옴");
		String userId = (String) session.getAttribute("userId");

		if (userId != null && userId.equals("admin")) {
			System.out.println("selProduct : " + selProduct);
			List<String> selProducts = Arrays.asList(selProduct.split(","));
			System.out.println("--selProducts : " + selProducts);
			int productDel = adminProductService.productDel(selProduct);
			System.out.println("productDel : " + productDel);
			// return productDelete;
			return productDel;
		} else {
			System.out.println("로그인 후 이용이 가능합니다.");
			return 0;
		}
	}

}
