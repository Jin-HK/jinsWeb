package com.koreait.fcs.command.order;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.OrderDAO;
import com.koreait.fcs.dto.OrderListDTO;

public class SelectMyOrderListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
				
		String mId = request.getParameter("mId");
		String mName = request.getParameter("mName");
		OrderDAO oDAO = sqlSession.getMapper(OrderDAO.class);
		ArrayList<OrderListDTO> oList =  oDAO.selectMyOrderList(mId);
		model.addAttribute("oList", oList);
		
		// 주문일자만 불러오기
		ArrayList<String> oDatelist = oDAO.selectOrderDate(mId);
		model.addAttribute("oDatelist", oDatelist);
		model.addAttribute("mName", mName);
		
	}

}
