package com.koreait.fcs.dao;

import java.util.ArrayList;

import com.koreait.fcs.dto.ProductDTO;

public interface ProductDAO {
	
	// 카테고리별 product 목록 불러오기
	public ArrayList<ProductDTO> selectProductListByCategory(int cNo);
	
	// 번호별 product 불러오기
	public ProductDTO selectProductBypNo(int pNo);
	
	// index화면에 신상품 불러오기
	public ArrayList<ProductDTO> selectNewProductList();
	
	// product 추가하기
	public int insertProduct(String pName, int pPrice, int pCategory, int pGender, String pCompany, String saveFilename1, String saveFilename2, String pDescription, int pStock1, int pStock2, int pStock3);
	public int insertProductWithNoThumbnail(String pName, int pPrice, int pCategory, int pGender, String pCompany, String saveFilename2, String pDescription, int pStock1, int pStock2, int pStock3);
	public int insertProductWithNoDetailImage(String pName, int pPrice, int pCategory, int pGender, String pCompany, String saveFilename1, String pDescription, int pStock1, int pStock2, int pStock3);
	
	// product 수정하기(썸네일, 상세이미지 둘 다 수정)
	public int updateProduct(String pName, int pPrice, int pCategory, int pGender, String pCompany, String saveFilename1, String saveFilename2, String pDescription, int pStock1, int pStock2, int pStock3, int pNo);
	
	// product 수정하기 (이미지 일부만 있을 경우)
	public int productUpdateWithNoImage(String pName, int pPrice, int pCategory, int pGender, String pCompany, String pDescription, int pStock1, int pStock2, int pStock3, int pNo);
	public int productDetailImageUpdate(String pName, int pPrice, int pCategory, int pGender, String pCompany, String pDetailImageName, String pDescription, int pStock1, int pStock2, int pStock3, int pNo);
	public int productThumbnailUpdate(String pName, int pPrice, int pCategory, int pGender, String pCompany, String pThumbnail, String pDescription, int pStock1, int pStock2, int pStock3, int pNo);
	
	// product 삭제하기
	public int deleteProduct(int pNo);
	
	// 전체 product 불러오기
	public ArrayList<ProductDTO> selectTotalProductList();
	
	// product 수량 수정하기
	public int updateProductQuantity(int pStock1, int pStock2, int pStock3, int pNo);
}
