package com.koreait.fcs.command.notice;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.common.PageMaker;
import com.koreait.fcs.dao.NoticeDAO;
import com.koreait.fcs.dto.NoticeDTO;

public class NoticeListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String page = request.getParameter("page");
		if(page == null || page.isEmpty()) {
			page = "1";
		}
		
		int recordPerPage = 10; 
		int beginRecord = (Integer.parseInt(page) - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		
		NoticeDAO nDAO = sqlSession.getMapper(NoticeDAO.class);
		List<NoticeDTO> list = nDAO.noticeList(beginRecord, endRecord);
		int totalRecord = nDAO.getTotalRecord();
		String pageView = PageMaker.getPageView("noticeList", Integer.parseInt(page), recordPerPage, totalRecord);
		
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("pageView", pageView);
		
		HttpSession session = request.getSession();
		session.removeAttribute("open");
	}

}
