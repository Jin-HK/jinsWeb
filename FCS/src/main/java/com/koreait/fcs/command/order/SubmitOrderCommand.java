package com.koreait.fcs.command.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.dao.OrderDAO;
import com.koreait.fcs.dto.MemberDTO;

// 결제하기를 눌렀을 때
public class SubmitOrderCommand{

	public void execute(SqlSession sqlSession, HttpServletResponse response, Model model) throws IOException {
		
		// request 불러오기
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		OrderDAO oDAO = sqlSession.getMapper(OrderDAO.class);
		
	
		
		// 주문자 정보 저장하기
		String mId = request.getParameter("mId");
		String mName = request.getParameter("mName");
		String oName = request.getParameter("oName");
		String oMobile1 = request.getParameter("oMobile1");
		String oMobile2 = request.getParameter("oMobile2");
		String oMobile3 = request.getParameter("oMobile3");
		String oEmail = request.getParameter("oEmail");
		String oPost = request.getParameter("oPost");
		String oAddr1 = request.getParameter("oAddr1");
		String oAddr2 = request.getParameter("oAddr2");
		String oAddr3 = request.getParameter("oAddr3");
		
		
		int pNo = Integer.parseInt(request.getParameter("pNo")); // 상품정보를 불러오기 위한 pNo String
		int cartNo = Integer.parseInt(request.getParameter("cartNo"));
		String cSize = request.getParameter("cSize"); // 'S'
		int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
		
		// 주문테이블에 주문정보 저장하기
		int result = oDAO.insertOrder(mId, oName, oMobile1, oMobile2, oMobile3, oEmail, oPost, oAddr1, oAddr2, oAddr3, cartNo);
		// 장바구니에서 구매한 상품임을 알 수 있는 cValidate 값을 1로 바꿔준다.
		oDAO.updateCartValidate(cartNo);
		// pNo과 pSize를 전달해서 상품 재고를 업데이트 한다. 
		oDAO.updateProductStock(cSize, cartQuantity, pNo);
		if (result > 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('결제가 완료되었습니다.');");
			out.println("location.href='selectMyOrderList?mId="+mId+"&mName="+mName+"'");
			out.println("</script>");
			out.close();
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('결제에 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		
		
		
	}

}
