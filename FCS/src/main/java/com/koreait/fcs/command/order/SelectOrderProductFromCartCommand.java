package com.koreait.fcs.command.order;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.OrderDAO;
import com.koreait.fcs.dto.CartListDTO;

public class SelectOrderProductFromCartCommand implements Command{
	// 장바구니에서 주문하기를 눌렀을 경우

	public void execute(SqlSession sqlSession, Model model){
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		OrderDAO oDAO = sqlSession.getMapper(OrderDAO.class);
	
		String mId = request.getParameter("mId");
		ArrayList<CartListDTO> cartList = oDAO.selectCartListBymId(mId);
		
		int totalPrice = 0;
		for (CartListDTO cartListDTO : cartList) {
			totalPrice += (cartListDTO.getpPrice() * cartListDTO.getCartQuantity());
		}
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("size", cartList.size());
		model.addAttribute("total", totalPrice);
		
	
		
	}

}
