package com.koreait.fcs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.command.cart.CartDeleteCommand;
import com.koreait.fcs.command.cart.CartInsertCommand;
import com.koreait.fcs.command.cart.CartListCommand;
import com.koreait.fcs.dao.CartDAO;

@Controller
public class CartController {

	// Field
	@Autowired
	private SqlSession sqlSession;
	private Command cartCommand;

	// List
	@RequestMapping("cartListPage")
	public String cartListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		cartCommand = new CartListCommand();
		cartCommand.execute(sqlSession, model);
		return "cart/cartListPage";
	}

	// Delete
	@RequestMapping("cartDelete")
	public String cartDelete(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		cartCommand = new CartDeleteCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:cartListPage";
	}

	// quantityDown
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("quantityDown")
	public String quantityUp(HttpServletRequest request) {
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
		int pPrice = Integer.parseInt(request.getParameter("pPrice"));
		int total;
		JSONObject obj = new JSONObject();
		if(cartQuantity <= 1) {
			obj.put("result", "FAIL");
		} else {
			CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
			cDAO.quantityDown(cartNo);
			obj.put("result", "SUCCESS");
			obj.put("value", cartQuantity-1);
			obj.put("cartNo",cartNo);
			total = pPrice * (cartQuantity-1);
			obj.put("total", total);
		} 
		return obj.toJSONString();
	}

	// quantityUp
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("quantityUp")
	public String quantityDown(HttpServletRequest request) {
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
		int pStock1 = Integer.parseInt(request.getParameter("pStock1"));
		int pStock2 = Integer.parseInt(request.getParameter("pStock2"));
		int pStock3 = Integer.parseInt(request.getParameter("pStock3"));
		int pPrice = Integer.parseInt(request.getParameter("pPrice"));
		int total;
		String cSize = request.getParameter("cSize");
		JSONObject obj = new JSONObject();
		CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
		if(cSize.equals("S")) {
			if(cartQuantity > pStock1) {
				obj.put("result", "FAIL");
			}else {
				cDAO.quantityUp(cartNo);
				obj.put("result", "SUCCESS");
				obj.put("value", cartQuantity+1);
				obj.put("cartNo",cartNo);
				total = pPrice * (cartQuantity+1);
				obj.put("total", total);
			}
		} else if (cSize.equals("M")) {
			if(cartQuantity > pStock2) {
				obj.put("result", "FAIL");
			}else {
				cDAO.quantityUp(cartNo);
				obj.put("result", "SUCCESS");
				obj.put("value", cartQuantity+1);
				obj.put("cartNo",cartNo);
				total = pPrice * (cartQuantity+1);
				obj.put("total", total);
			}
		} else {
			if(cartQuantity > pStock3) {
				obj.put("result", "FAIL");
			}else {
				cDAO.quantityUp(cartNo);
				obj.put("result", "SUCCESS");
				obj.put("value", cartQuantity+1);
				obj.put("cartNo",cartNo);
				total = pPrice * (cartQuantity+1);
				obj.put("total", total);
			}
		}
		return obj.toJSONString();
	}

	// cartInsert
	@RequestMapping("cartInsert")
	public String cartInsert(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		cartCommand = new CartInsertCommand();
		cartCommand.execute(sqlSession, model);
		return "redirect:cartListPage";
	}






















}























