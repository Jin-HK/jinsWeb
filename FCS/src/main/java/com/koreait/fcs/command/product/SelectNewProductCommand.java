package com.koreait.fcs.command.product;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.ProductDAO;
import com.koreait.fcs.dto.ProductDTO;

public class SelectNewProductCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
		ArrayList<ProductDTO> list = pDAO.selectNewProductList();
		model.addAttribute("list", list);
		model.addAttribute("listSize", list.size());

	}

}
