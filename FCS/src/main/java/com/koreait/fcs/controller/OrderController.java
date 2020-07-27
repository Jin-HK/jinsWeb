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

import com.koreait.fcs.command.Command;
import com.koreait.fcs.command.order.SelectMyOrderListCommand;
import com.koreait.fcs.command.order.SelectOrderProductCommand;
import com.koreait.fcs.command.order.SelectOrderProductFromCartCommand;
import com.koreait.fcs.command.order.SelectTotalOrderListCommand;
import com.koreait.fcs.command.order.SubmitOrderCommand;
import com.koreait.fcs.command.order.SubmitOrderFromCartCommand;

@Controller
public class OrderController {
	
	@Autowired
	private SqlSession sqlSession;
	private Command command;
	
	// 바로 주문하기
	@RequestMapping("orderPage")
	public String goOrderPage(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
		model.addAttribute("request", request);
		SelectOrderProductCommand command = new SelectOrderProductCommand();
		command.execute(sqlSession, response, model);
		return "order/orderPage";
	} 
	
	// 장바구니에서 주문하기
	@RequestMapping("orderPageFromCart")
	public String goOrderPageFromCart(HttpServletRequest request, Model model){
		model.addAttribute("request", request);
		command = new SelectOrderProductFromCartCommand();
		command.execute(sqlSession, model);
		return "order/orderPageFromCart";
	}
	
	// 그냥 결제하기
	@RequestMapping(value="submitOrder", method=RequestMethod.POST)
	public void submitOrder(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		model.addAttribute("request", request);
		SubmitOrderCommand command = new SubmitOrderCommand();
		command.execute(sqlSession, response, model);
	}
	
	// 장바구니에서 결제하기
	@RequestMapping(value="submitOrderFromCart", method=RequestMethod.POST)
	public void submitOrderFromCart(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		model.addAttribute("request", request);
		SubmitOrderFromCartCommand command = new SubmitOrderFromCartCommand();
		command.execute(sqlSession, response, model);
	}
	
	// 나의 주문내역 확인
	@RequestMapping("selectMyOrderList")
	public String selectMyOrderList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SelectMyOrderListCommand();
		command.execute(sqlSession, model);
		return "order/selectMyOrderListPage";
	}
	
	// 쇼핑몰 전체 주문 내역 확인
	@RequestMapping("selectTotalOrderList")
	public String selectTotalOrderList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		command = new SelectTotalOrderListCommand();
		command.execute(sqlSession, model);
		return "order/totalOrderListPage";
	}

}
