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
import com.koreait.fcs.command.qna.QNABoardDeleteCommand;
import com.koreait.fcs.command.qna.QNABoardInsertCommand;
import com.koreait.fcs.command.qna.QNABoardListCommand;
import com.koreait.fcs.command.qna.QNABoardViewCommand;
import com.koreait.fcs.command.qna.QNAMyBoardListCommand;
import com.koreait.fcs.command.qna.QNAReplyInsertCommand;

@Controller
public class QNABoardController {
   @Autowired
   private SqlSession sqlSession;
   private Command qnaBoardCommand; //@Autowired로 처리되는 대상이 아니다
   
   @RequestMapping("qnaBoardInsertPage")
   public String qnaBoardInsertPage(HttpServletRequest request, Model model) {
	   model.addAttribute("pNo",request.getParameter("pNo"));
	   model.addAttribute("page",request.getParameter("page"));
	   return "qna/qnaBoardInsertPage";
   }
   
   @RequestMapping("qnaList")
   public String qnaList(HttpServletRequest request, Model model) {
      model.addAttribute("request", request);   
      qnaBoardCommand = new QNABoardListCommand();
      qnaBoardCommand.execute(sqlSession, model);
      return "qna/qnaBoardList";
   }
   
   @RequestMapping(value="qnaInsertBoard", method=RequestMethod.POST)
   public String qnaInsertBoard(HttpServletRequest request, HttpServletResponse response, Model model) {
	   model.addAttribute("request",request);
	   model.addAttribute("response", response);
	   qnaBoardCommand = new QNABoardInsertCommand();
	   qnaBoardCommand.execute(sqlSession, model);
	   return "redirect:qnaList";
   }
   
   @RequestMapping("qnaBoardViewPage")
   public String qnaBoardViewPage(HttpServletRequest request, Model model) {
	   model.addAttribute("request", request);
	   qnaBoardCommand = new QNABoardViewCommand();
	   qnaBoardCommand.execute(sqlSession, model);
	   return "qna/qnaBoardViewPage";
   }
   
   @RequestMapping(value="replyInsertPage", method=RequestMethod.POST)
   public String replyInsertPage(HttpServletRequest request, Model model) {
	   model.addAttribute("pNo",request.getParameter("pNo"));
	   model.addAttribute("page", request.getParameter("page"));
	   return "qna/replyInsertPage";
   }
   
   @RequestMapping(value="qnaBoardDelete", method=RequestMethod.POST)
   public String qnaBoardDelete(HttpServletRequest request, HttpServletResponse response, Model model) {
	   model.addAttribute("request",request);
	   model.addAttribute("response", response);
	   qnaBoardCommand = new QNABoardDeleteCommand();
	   qnaBoardCommand.execute(sqlSession, model);
	   return "redirect:qnaList";
   }
   
   @RequestMapping(value="replyInsert", method=RequestMethod.POST)
   public String replyInsert(HttpServletRequest request, HttpServletResponse response, Model model) {
	   model.addAttribute("request", request);
	   model.addAttribute("response", response);	   
	   qnaBoardCommand = new QNAReplyInsertCommand();
	   qnaBoardCommand.execute(sqlSession, model);
	   return "redirect:qnaList";
   }
   
   @RequestMapping(value="myBoardListPage")
   public String myBoardListPage(HttpServletRequest request, Model model) {
	   model.addAttribute("request", request);
	   qnaBoardCommand = new QNAMyBoardListCommand();
	   qnaBoardCommand.execute(sqlSession, model);
	   return "qna/qnaBoardList";
   }

}
