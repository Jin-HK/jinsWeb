package com.koreait.fcs.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.command.category.SelectProductListCommand;
import com.koreait.fcs.command.product.SelectNewProductCommand;
import com.koreait.fcs.command.product.SelectProductDetailCommand;

@Controller
public class CategoryController {
	
	// Field
	@Autowired
	private SqlSession sqlSession;
	
	private Command categoryCommand;
	
	@RequestMapping("/")
	public String goIndex(Model model) {
	
		new SelectNewProductCommand().execute(sqlSession, model);
		return "index";
	}
/*	
	// 관리자 - 카테고리 리스트 페이지로 이동
	@RequestMapping("categoryListPage")
	public String categoryListPage(Model model) {
		categoryCommand = new CategoryListCommand();
		categoryCommand.execute(sqlSession, model);
		return "category/categoryListPage";
	}
	
	// 관리자 - 카테고리 삽입
	@RequestMapping("insertCategory")
	public String insertCategory(RedirectAttributes rttr, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		categoryCommand = new CategoryInsertCommand();
		categoryCommand.execute(sqlSession, model);
		return "redirect:categoryListPage";
	}
	

	// 관리자 - 카테고리 수정
	@RequestMapping("updateCategory")
	public String updateCategory(RedirectAttributes rttr, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		categoryCommand = new CategoryUpdateCommand();
		categoryCommand.execute(sqlSession, model);
		return "redirect:categoryListPage";
	}
	
	// 관리자 - 카테고리 수정 페이지로 이동
	@RequestMapping("updateCategoryPage")
	public String updateCategoryPage() {
		return "category/updateCategoryPage";
	}
	
	// 관리자 - 카테고리 삭제
	@RequestMapping("deleteCategory")
	public String deleteCategory(RedirectAttributes rttr, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("rttr", rttr);
		categoryCommand = new CategoryDeleteCommand();
		categoryCommand.execute(sqlSession, model);
		return "redirect:categoryListPage";
	}*/
	
	/*
	 * // 남성 브랜드별 카테고리 가져오기
	 * 
	 * @RequestMapping("selectProductByMaleBrand") public String
	 * selectProductByMaleBrand(HttpServletRequest request, Model model) {
	 * model.addAttribute("request", request); categoryCommand = new
	 * SelectProductListByMaleBrandCommand(); categoryCommand.execute(sqlSession,
	 * model); return "product/productListPage"; }
	 * 
	 * // 여성 브랜드별 카테고리 가져오기
	 * 
	 * @RequestMapping("selectProductByFemaleBrand") public String
	 * selectProductByFemaleBrand(HttpServletRequest request, Model model) {
	 * model.addAttribute("request", request); categoryCommand = new
	 * SelectProductListByFemaleBrandCommand(); categoryCommand.execute(sqlSession,
	 * model); return "product/productListPage"; }
	 * 
	 * // 남성 의류 카테고리 가져오기
	 * 
	 * @RequestMapping("selectProductByMaleCategory") public String
	 * selectProductByMaleCategory(HttpServletRequest request, Model model) {
	 * model.addAttribute("request", request); categoryCommand = new
	 * SelectProductByMaleCategoryCommand(); categoryCommand.execute(sqlSession,
	 * model); return "product/productListPage"; }
	 * 
	 * // 여성 의류 카테고리 가져오기
	 * 
	 * @RequestMapping("selectProductByFemaleCategory") public String
	 * selectProductByFemaleCategory(HttpServletRequest request, Model model) {
	 * model.addAttribute("request", request); categoryCommand = new
	 * SelectProductByFemaleCategoryCommand(); categoryCommand.execute(sqlSession,
	 * model); return "product/productListPage"; }
	 * 
	 * // 잡화 카테고리 가져오기
	 * 
	 * @RequestMapping("selectProductEtc") public String
	 * selectProductEtc(HttpServletRequest request, Model model) {
	 * model.addAttribute("request", request); categoryCommand = new
	 * SelectProductEtcCommand(); categoryCommand.execute(sqlSession, model); return
	 * "product/productListPage"; }
	 */
	
	// 상세 페이지 가져오기
	@RequestMapping("selectProductDetail")
	public String selectProductDetail(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		categoryCommand = new SelectProductDetailCommand();
		categoryCommand.execute(sqlSession, model);
		return "product/productViewPage";
	}
	
	// 카테고리별 상품 가져오기
	@RequestMapping("selectProductList")
	public String selectProductList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		categoryCommand = new SelectProductListCommand();
		categoryCommand.execute(sqlSession, model);
		return "product/productListPage";
	}
}
