package com.koreait.fcs.command.cart;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.CartDAO;
import com.koreait.fcs.dto.ProductDTO;

public class CartListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String mId = request.getParameter("mId");
		
		CartDAO pDAO = sqlSession.getMapper(CartDAO.class);
		ArrayList<ProductDTO> list = pDAO.selectBymId(mId);
		
		int total=0;
		for (ProductDTO productDTO : list) {
			total+=(productDTO.getpPrice() * productDTO.getCartQuantity());
		}
		
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		model.addAttribute("mId", mId);
		model.addAttribute("total", total);
		
	}

}