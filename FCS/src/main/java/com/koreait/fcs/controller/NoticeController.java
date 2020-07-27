package com.koreait.fcs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.command.notice.NoticeDeleteCommand;
import com.koreait.fcs.command.notice.NoticeInsertCommand;
import com.koreait.fcs.command.notice.NoticeListCommand;
import com.koreait.fcs.command.notice.NoticeViewCommand;
import com.koreait.fcs.command.notice.QueryNoticeListCommand;

@Controller
public class NoticeController {
	
	@Autowired
	   private SqlSession sqlSession;
	   private Command noticeCommand;
	
	@RequestMapping("noticeList")
	public String noticeList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		noticeCommand = new NoticeListCommand();
		noticeCommand.execute(sqlSession, model);
		return "notice/noticeList";
	}
	
	@RequestMapping("noticeInsertPage")
	public String noticeInsertPage(HttpServletRequest request, Model model) {
		 model.addAttribute("page",request.getParameter("page"));
		return "notice/noticeInsertPage";
	}
	
	@RequestMapping(value="insertNotice", method=RequestMethod.POST)
	public String insertNotice(HttpServletRequest request,HttpServletResponse response, Model model) {
		model.addAttribute("request",request);
		model.addAttribute("response", response);
		noticeCommand = new NoticeInsertCommand();
		noticeCommand.execute(sqlSession, model);
		return "redirect:noticeList";
	}
	
	@RequestMapping("noticeViewPage")
	public String noticeViewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		noticeCommand = new NoticeViewCommand();
		noticeCommand.execute(sqlSession, model);
		return "notice/noticeViewPage";
	}
	
	@RequestMapping(value="noticeDelete", method=RequestMethod.POST)
	public String noticeDelete(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		noticeCommand = new NoticeDeleteCommand();
		noticeCommand.execute(sqlSession, model);
		return "redirect:noticeList";
	}
	
	@RequestMapping("queryBoardListPage")
	public String queryBoardListPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		noticeCommand = new QueryNoticeListCommand();
		noticeCommand.execute(sqlSession, model);
		return "notice/noticeList";
	}
	
	
}











