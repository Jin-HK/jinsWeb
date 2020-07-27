

package com.koreait.fcs.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.command.product.ProductDeleteCommand;
import com.koreait.fcs.command.product.ProductDetailImageUpdateCommand;
import com.koreait.fcs.command.product.ProductInsertCommand;
import com.koreait.fcs.command.product.ProductInsertWithNoDetailImageCommand;
import com.koreait.fcs.command.product.ProductInsertWithNoThumbnailCommand;
import com.koreait.fcs.command.product.ProductListCommand;
import com.koreait.fcs.command.product.ProductThumbnailUpdateCommand;
import com.koreait.fcs.command.product.ProductTotalListCommand;
import com.koreait.fcs.command.product.ProductUpdateCommand;
import com.koreait.fcs.command.product.ProductUpdateWithNoImageCommand;
import com.koreait.fcs.command.product.SelectProductDetailCommand;
import com.koreait.fcs.command.product.UpdateProductQuantityCommand;

@Controller
public class ProductController {
	// Field
	@Autowired
	private SqlSession sqlSession;
	private Command productCommand;

	@RequestMapping("productInsertPage")
	public String goUploadPage() {
		return "product/productInsertPage";
	}

	// 관리자 - 제품 업데이트 페이지로 이동
	@RequestMapping("productUpdatePage")
	public String goProductUpdatePage(HttpServletRequest request, Model model) {

		model.addAttribute("request", request);
		productCommand = new SelectProductDetailCommand();
		productCommand.execute(sqlSession, model);
		return "product/productUpdatePage";

	}

	// 일반 사용자 - 제품 상세 페이지로 이동
	@RequestMapping("productDetailViewPage")
	public String goProductViewPage(HttpServletRequest request, Model model) {

		model.addAttribute("request", request);
		productCommand = new SelectProductDetailCommand();
		productCommand.execute(sqlSession, model);
		return "product/productDetailViewPage";

	}

	// 제품 리스트 페이지
	@RequestMapping("productListPage")
	public String productListPage(HttpServletRequest request,Model model) {
		model.addAttribute("request", request);
		productCommand = new ProductListCommand();
		productCommand.execute(sqlSession, model);
		return "product/productListPage";
	}


	@RequestMapping(value="productInsert", method=RequestMethod.POST)
	public String productInsert(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		productCommand = new ProductInsertCommand();
		productCommand.execute(sqlSession, model);
		return "redirect:/";
	}
	@RequestMapping(value="insertProductWithNoThumbnail", method=RequestMethod.POST)
	public String insertProductWithNoThumbnail(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		productCommand = new ProductInsertWithNoThumbnailCommand();
		productCommand.execute(sqlSession, model);
		return "redirect:/";
	}
	@RequestMapping(value="insertProductWithNoDetailImage", method=RequestMethod.POST)
	public String insertProductWithNoDetailImage(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		productCommand = new ProductInsertWithNoDetailImageCommand();
		productCommand.execute(sqlSession, model);
		return "redirect:/";
	}


	@RequestMapping(value="productUpdate", method=RequestMethod.POST)
	public String productUpdate(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		productCommand = new ProductUpdateCommand();
		productCommand.execute(sqlSession, model);
		model.addAttribute("pCategory", mr.getAttribute("pCategory"));
		return "redirect:/";
	}
	@RequestMapping(value="productUpdateWithNoImage", method=RequestMethod.POST)
	public String productUpdateWithNoImage(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		productCommand = new ProductUpdateWithNoImageCommand();
		productCommand.execute(sqlSession, model);
		return "redirect:/";
	}
	@RequestMapping(value="productDetailImageUpdate", method=RequestMethod.POST)
	public String productDetailImageUpdate(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		productCommand = new ProductDetailImageUpdateCommand();
		productCommand.execute(sqlSession, model);
		return "redirect:/";
	}
	@RequestMapping(value="productThumbnailUpdate", method=RequestMethod.POST)
	public String productThumbnailUpdate(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		productCommand = new ProductThumbnailUpdateCommand();
		productCommand.execute(sqlSession, model);
		return "redirect:/";
	}

	@RequestMapping(value="productDelete")
	public String productDelete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productCommand = new ProductDeleteCommand();
		productCommand.execute(sqlSession, model);
		return "redirect:selectTotalProductList";
	}

	@RequestMapping("prevPage")
	public String prevPage(HttpServletRequest request) {
		String prevPage = request.getParameter("prevPage");
		return "redirect:"+prevPage;
	}

	@RequestMapping("selectTotalProductList")
	public String selectTotalProductList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		productCommand = new ProductTotalListCommand();
		productCommand.execute(sqlSession, model);
		return "product/totalProductListPage";
	}

	@RequestMapping("goUpdateProductQuantityPage")
	public String goUpdateProductQuantityPage(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		model.addAttribute("request", request);
		productCommand = new SelectProductDetailCommand();
		productCommand.execute(sqlSession, model);
		return "product/updateProductQuantityPage";
	}

	@RequestMapping("updateProductQuantity")
	public void updateProductQuantity(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		model.addAttribute("request", request);
		UpdateProductQuantityCommand command = new UpdateProductQuantityCommand();
		command.execute(sqlSession, response, model);
	}
}

