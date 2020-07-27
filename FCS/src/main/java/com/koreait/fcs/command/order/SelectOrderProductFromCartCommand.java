package com.koreait.fcs.command.order;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.OrderDAO;
import com.koreait.fcs.dto.CartListDTO;
import com.koreait.fcs.dto.MemberDTO;

public class SelectOrderProductFromCartCommand implements Command{
	// 장바구니에서 주문하기를 눌렀을 경우

	public void execute(SqlSession sqlSession, Model model){
		
		// request 받아오기
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		OrderDAO oDAO = sqlSession.getMapper(OrderDAO.class);
	
		// 장바구니에 담긴 리스트를 받아온다. 
		// session에서 로그인 정보를 받아온다. 
		/*
		 * HttpSession session = request.getSession(); MemberDTO loginDTO =
		 * (MemberDTO)session.getAttribute("loginDTO"); // loginDTO 로그인 정보가 저장되어 있을 경우
		 * session에서 해당 정보 불러옴 // loginDTO 로그인 정보가 저장되어 있을 경우 session에서 해당 정보 불러옴 String
		 * mId = loginDTO.getmId();
		 */
		String mId = request.getParameter("mId");
		ArrayList<CartListDTO> cartList = oDAO.selectCartListBymId(mId);
		
		int total=0;
		for (CartListDTO cartListDTO : cartList) {
			total+=(cartListDTO.getpPrice() * cartListDTO.getCartQuantity());
		}
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("size", cartList.size());
		model.addAttribute("total", total);
		
	
		
	}

}
