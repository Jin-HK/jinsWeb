package com.koreait.fcs.command.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.ReviewDAO;

public class ReviewInsertCheckCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String mId = request.getParameter("mId");
		ReviewDAO rDAO = sqlSession.getMapper(ReviewDAO.class);
		int result = rDAO.InsertCheck(pNo, mId);
		model.addAttribute("pNo",pNo);
		if (result > 0) {
			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out;
				out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('해당 상품에 대한 리뷰를 이미 작성하셨습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			
		}
	}

}
