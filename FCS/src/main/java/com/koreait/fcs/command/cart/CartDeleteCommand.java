package com.koreait.fcs.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.CartDAO;

public class CartDeleteCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		
		CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
		cDAO.cartDelete(cartNo);
		
		model.addAttribute("mId", request.getParameter("mId"));
	}

}
