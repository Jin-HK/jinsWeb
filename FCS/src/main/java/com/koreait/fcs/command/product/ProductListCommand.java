package com.koreait.fcs.command.product;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.ProductDAO;
import com.koreait.fcs.dto.ProductDTO;

public class ProductListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int pCategory = Integer.parseInt(request.getParameter("pCategory"));	// 카테고리 번호를 통한 검색
		ArrayList<ProductDTO> list = pDAO.selectProductListByCategory(pCategory);
		model.addAttribute("list", list);
		model.addAttribute("totalCount", list.size());
	}

}
