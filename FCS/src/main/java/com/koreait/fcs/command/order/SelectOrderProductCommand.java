package com.koreait.fcs.command.order;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.dao.CartDAO;
import com.koreait.fcs.dao.OrderDAO;
import com.koreait.fcs.dao.ProductDAO;
import com.koreait.fcs.dto.CartDTO;
import com.koreait.fcs.dto.CartListDTO;
import com.koreait.fcs.dto.ProductDTO;

public class SelectOrderProductCommand {

	// 장바구니를 통하지 않고 바로 구매하기를 눌렀을 경우
	public void execute(SqlSession sqlSession, HttpServletResponse response, Model model) throws Exception{
		
		// request 받아오기
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		OrderDAO oDAO = sqlSession.getMapper(OrderDAO.class);
		CartDAO cDAO = sqlSession.getMapper(CartDAO.class);
		
		String mId = request.getParameter("mId");
		ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
		// 1. 단일 상품의 사이즈, 수량, 총금액을 받아온다. 
		int pNo = Integer.parseInt(request.getParameter("pNo")); // 상품정보를 불러오기 위한 pNo 
		String cSize = request.getParameter("cSize"); // 상품뷰에서 선택한 cSize 받아오기 String
		int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity")); // 주문할 상품의 수량 받아오기(장바구니에 넣음)
		int total=0;
		int pPrice = Integer.parseInt(request.getParameter("pPrice"));
		// 장바구니 통하지 않고 바로 주문하기 했을 경우, 장바구니에 해당 품목 insert 해준다. 
		// 단, 해당 장바구니에 같은 품목이 있으면 수량 + 해준다.  
		// 그리고 같은 품목이 있으면 알려준다. 
		
		// 2. 같은 품목이 특정 회원의 장바구니에 있는지 확인한다. 
		CartDTO cDTO = oDAO.checkCartProduct(mId, cSize, pNo); // 같은 품목이 있으면 해당 데이터를 cDTO에 담아둔다.
		if (cDTO != null) {
			int cartNo = cDTO.getCartNo();
			oDAO.updateCartQuantity(cartQuantity, cartNo);
			cDTO = oDAO.checkCartProduct(mId, cSize, pNo);
			model.addAttribute("cDTO", cDTO);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('장바구니에 같은 상품이 있습니다. 수량이 추가됩니다.')");
			out.println("</script>");
			out.flush();
		} else {
			cDAO.cartInsert(mId, pNo, cSize, cartQuantity);
			cDTO = oDAO.checkCartProduct(mId, cSize, pNo);
			model.addAttribute("cDTO", cDTO);
		}
		
		total = (pPrice * cDTO.getCartQuantity());
		// 2. 결제페이지에서 주문 내역을 확인할 수 있도록 상품정보 불러오기
		// 주문하기 페이지에서 상품정보(이름, 설명, 가격)을 받아오기 위해 pNo을 넘겨서 해당 정보 pDTO에 저장
		// DAO메소드는 ProductDAO 재활용(단순 상품정보불러오므로) 
		// 상품번호를 파라미터로 넘겨서 pDTO에 상품정보를 담는다. 
		
		model.addAttribute("pDTO", pDAO.selectProductBypNo(pNo));
		model.addAttribute("total", total);
		
	}

}
