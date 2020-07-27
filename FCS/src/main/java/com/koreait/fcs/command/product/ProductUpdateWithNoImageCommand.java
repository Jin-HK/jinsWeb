package com.koreait.fcs.command.product;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.ProductDAO;

public class ProductUpdateWithNoImageCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) map.get("mr");
		
		int pNo = Integer.parseInt(mr.getParameter("pNo"));
		String pName = mr.getParameter("pName");
		int pPrice = Integer.parseInt(mr.getParameter("pPrice"));
		int pCategory = Integer.parseInt(mr.getParameter("pCategory"));
		int pGender = Integer.parseInt(mr.getParameter("pGender"));
		int pStock1 = Integer.parseInt(mr.getParameter("pStock1"));	// s사이즈
		int pStock2 = Integer.parseInt(mr.getParameter("pStock2"));	// m사이즈
		int pStock3 = Integer.parseInt(mr.getParameter("pStock3"));	// l사이즈
		String pCompany = mr.getParameter("pCompany");
		String pDescription = mr.getParameter("pDescription");
		
		mr.setAttribute("pCategory", pCategory);
			
		ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
		
		pDAO.productUpdateWithNoImage(pName, pPrice, pCategory, pGender, pCompany, pDescription, pStock1, pStock2, pStock3, pNo);
		model.addAttribute("pCategory", pCategory);
	}

}
