package com.koreait.fcs.command.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.ReviewDAO;

public class ReviewDeleteCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String page1 = request.getParameter("page1");
		String page2 = request.getParameter("page2");
		int rNo = Integer.parseInt(request.getParameter("rNo"));

		ReviewDAO rDAO = sqlSession.getMapper(ReviewDAO.class);
		rDAO.reviewDelete(rNo);

		model.addAttribute("pNo",pNo);
		model.addAttribute("page1",page1);
		model.addAttribute("page2",page2);

	}

}
