package com.koreait.fcs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.command.review.ReviewDeleteCommand;
import com.koreait.fcs.command.review.ReviewInsertCheckCommand;
import com.koreait.fcs.command.review.ReviewInsertCommand;
import com.koreait.fcs.command.review.ReviewInsertWithImageCommand;
import com.koreait.fcs.command.review.ReviewListCommand;

@Controller
public class ReviewController {

	@Autowired
	private SqlSession sqlSession;
	private Command reviewCommand;

	@RequestMapping("reviewList")
	public String reviewList(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		reviewCommand = new ReviewListCommand();
		reviewCommand.execute(sqlSession, model);
		return "review/reviewListPage";
	}

	@RequestMapping(value="insertReview", method=RequestMethod.POST)
	public String insertReview(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		reviewCommand = new ReviewInsertCommand();
		reviewCommand.execute(sqlSession, model);
		return "redirect:reviewList";
	}

	@RequestMapping(value="insertReviewWithImage", method=RequestMethod.POST)
	public String insertReviewWithImage(MultipartHttpServletRequest mr, Model model) {
		model.addAttribute("mr", mr);
		reviewCommand = new ReviewInsertWithImageCommand();
		reviewCommand.execute(sqlSession, model);
		return "redirect:reviewList";
	}

	@RequestMapping("deleteReview")
	public String deleteReview(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		reviewCommand = new ReviewDeleteCommand();
		reviewCommand.execute(sqlSession, model);
		return "redirect:reviewList";
	}

	@RequestMapping("reviewInsertPage")
	public String reviewInsertPage(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		reviewCommand = new ReviewInsertCheckCommand();
		reviewCommand.execute(sqlSession, model);
		return "review/reviewInsertPage";
	}
}
