package com.koreait.fcs.command.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.ProductDAO;

public class ProductDeleteCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		//RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		ProductDAO pDAO = sqlSession.getMapper(ProductDAO.class);
		// 삭제 결과를 redirect로 넘기기 때문에
		// model을 이용하면 중간에 넘긴 값이 사라진다.
		// 그래서 model 대신 rttr을 사용한다.
		pDAO.deleteProduct(pNo);
		// 삭제 결과를 productListPage.jsp에 넘기는데, 삭제 후에만 productListPage.jsp 에서 삭제 결과를 검사할 수 있도록
		// 삭제 후에 이동한 것이라는 "변수"를 하나 더 넘겨준다.
		//rttr.addFlashAttribute("beDeleted", true);

	}

}
