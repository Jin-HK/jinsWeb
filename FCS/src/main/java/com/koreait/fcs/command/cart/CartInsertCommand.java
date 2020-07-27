package com.koreait.fcs.command.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.CartDAO;
import com.koreait.fcs.dao.OrderDAO;
import com.koreait.fcs.dto.CartDTO;

public class CartInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String mId = request.getParameter("mId");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String cSize = request.getParameter("cSize");
		int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
		
		OrderDAO oDAO = sqlSession.getMapper(OrderDAO.class);
		CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
		
		// 같은 품목이 특정 회원의 장바구니에 있는지 확인한다. 
		CartDTO cDTO = oDAO.checkCartProduct(mId, cSize, pNo); // 같은 품목이 있으면 해당 데이터를 cDTO에 담아둔다.
		if (cDTO != null) {
			int cartNo = cDTO.getCartNo();
			oDAO.updateCartQuantity(cartQuantity, cartNo);
			cDTO = oDAO.checkCartProduct(mId, cSize, pNo);
			model.addAttribute("cDTO", cDTO);
		} else {
			cDAO.cartInsert(mId, pNo, cSize, cartQuantity);
			cDTO = oDAO.checkCartProduct(mId, cSize, pNo);
			model.addAttribute("cDTO", cDTO);
		}
				
		model.addAttribute("mId", mId);	
	}

}
