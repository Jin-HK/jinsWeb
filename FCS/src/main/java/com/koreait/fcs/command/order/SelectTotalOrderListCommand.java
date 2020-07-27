package com.koreait.fcs.command.order;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.OrderDAO;
import com.koreait.fcs.dto.CartListDTO;
import com.koreait.fcs.dto.OrderListDTO;

public class SelectTotalOrderListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		OrderDAO oDAO = sqlSession.getMapper(OrderDAO.class);
		
		ArrayList<OrderListDTO> orderList = oDAO.selectTotalOrderList();
		
		int total=0;
		for (OrderListDTO orderListDTO : orderList) {
			total+=(orderListDTO.getpPrice() * orderListDTO.getCartQuantity());
		}
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("total", total);
		
		
	}

}
