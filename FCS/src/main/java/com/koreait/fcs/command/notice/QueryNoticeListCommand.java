package com.koreait.fcs.command.notice;

import java.util.HashMap;
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

public class QueryNoticeListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String page = request.getParameter("page");
		if(page==null || page.isEmpty()) {
			page="1";
		}
		String column = request.getParameter("column");
		String query = request.getParameter("query");  
		
		int recordPerPage = 10;  // board, bbs, guestbook, member 등 모두 다른 값을 줄 수 있다.
		int beginRecord = (Integer.parseInt(page) - 1) * recordPerPage + 1;
		int endRecord = beginRecord + recordPerPage - 1;
		
		Map<String, String> nMap = new HashMap<String, String>();
		nMap.put("beginRecord", beginRecord + "");
		nMap.put("endRecord", endRecord + "");
		nMap.put("column", column);
		nMap.put("query", query);
		
		NoticeDAO nDAO = sqlSession.getMapper(NoticeDAO.class);
		List<NoticeDTO> list = nDAO.queryNoticeList(nMap);
		
		int totalRecord = nDAO.getQueryRecord(nMap);
		String pageView = PageMaker.getPageView("noticeList", Integer.parseInt(page), recordPerPage, totalRecord);
		
		request.setAttribute("page", page);
		request.setAttribute("list", list);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("pageView", pageView);
		
		HttpSession session = request.getSession();
		session.removeAttribute("open");
	}

}
