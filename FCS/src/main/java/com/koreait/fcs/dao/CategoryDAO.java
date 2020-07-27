package com.koreait.fcs.dao;

import java.util.ArrayList;

import com.koreait.fcs.dto.CategoryDTO;
import com.koreait.fcs.dto.ProductDTO;

public interface CategoryDAO {
	
	// 관리자 - 카테고리 삽입
	public int insertCategory(int cNo, String cName);
	
	// 관리자 - 카테고리 수정
	public int updateCategory(int cNo, String cName);
	
	// 관리자 - 카테고리 삭제
	public int deleteCategory(int cNo);
	
	// 관리자 - 카테고리 목록 불러오기
	public ArrayList<CategoryDTO> selectCategoryList();
	
	// 카테고리별 상품 리스트 불러오기 - 컨트롤러 변경 버젼
	public ArrayList<ProductDTO> selectProductList1(String var, String value1, int value2, int pGender);
	public ArrayList<ProductDTO> selectProductList2(String var, String value1, int value2, int pGender, int beginRecord, int endRecord);

}
