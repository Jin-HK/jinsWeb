package com.koreait.fcs.command.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.NoticeDAO;

public class NoticeInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String page = request.getParameter("page");
		String nTitle = request.getParameter("nTitle");
		String nContent = request.getParameter("nContent");
		String mId = request.getParameter("mId");
		NoticeDAO nDAO = sqlSession.getMapper(NoticeDAO.class);
		int result = nDAO.insertNotice(nTitle, nContent, mId);
		model.addAttribute("page",page);
		if (result > 0) {
		} else {
			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out;
				out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('게시글이 등록되지 않았습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
