package com.koreait.fcs.command.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.NoticeDAO;
import com.koreait.fcs.dto.NoticeDTO;

public class NoticeViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String page = request.getParameter("page");
		int nNo = Integer.parseInt(request.getParameter("nNo"));
		NoticeDAO nDAO = sqlSession.getMapper(NoticeDAO.class);
		NoticeDTO nDTO = nDAO.noticeView(nNo);
		
		HttpSession session = request.getSession();
		String open = (String) session.getAttribute("open");
		if(open==null) {
			session.setAttribute("open", "yes");
			nDAO.updatenHit(nNo);
		}
		
		model.addAttribute("nDTO", nDTO);
		model.addAttribute("page", page);
		
	}

}
