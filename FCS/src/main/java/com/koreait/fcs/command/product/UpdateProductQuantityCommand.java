package com.koreait.fcs.command.product;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.dao.ProductDAO;

public class UpdateProductQuantityCommand {

	public void execute(SqlSession sqlSession, HttpServletResponse response, Model model) throws IOException {

		ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		int pNo = Integer.parseInt(request.getParameter("pNo"));
		int pStock1 = Integer.parseInt(request.getParameter("pStock1"));
		int pStock2 = Integer.parseInt(request.getParameter("pStock2"));
		int pStock3 = Integer.parseInt(request.getParameter("pStock3"));

		int result = 0;
		result = pDAO.updateProductQuantity(pStock1, pStock2, pStock3, pNo);
		if (result > 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('재고가 수정되었습니다.');");
			out.println("location.href='selectTotalProductList'");
			out.println("</script>");
			out.close();
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('재고가 수정되지 않았습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}



	}

}
