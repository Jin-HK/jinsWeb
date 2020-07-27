package com.koreait.fcs.command.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.common.ReviewPageMaker1;
import com.koreait.fcs.common.ReviewPageMaker2;
import com.koreait.fcs.dao.ReviewDAO;
import com.koreait.fcs.dto.ReviewDTO;

public class ReviewListCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		
		String page1 = request.getParameter("page1");
		if(page1==null || page1.isEmpty()) {
			page1="1";
		}
		String page2 = request.getParameter("page2");
		if(page2==null || page2.isEmpty()) {
			page2="1";
		}
		
		int recordPerPage1 = 5; //board, bbs, guestbook, member 등 모두 
		int beginRecord1 = (Integer.parseInt(page1)-1)*recordPerPage1+1;
		int endRecord1 = beginRecord1+recordPerPage1-1;

		int recordPerPage2 = 5; //board, bbs, guestbook, member 등 모두 
		int beginRecord2 = (Integer.parseInt(page2)-1)*recordPerPage2+1;
		int endRecord2 = beginRecord2+recordPerPage2-1;
		
		ReviewDAO rDAO = sqlSession.getMapper(ReviewDAO.class);
		List<ReviewDTO> list1 = rDAO.reviewList(beginRecord1, endRecord1, pNo); //사진이 없는 리뷰
		List<ReviewDTO> list2 = rDAO.reviewListWithImage(beginRecord2, endRecord2, pNo); //사진이 있는 리뷰
		
		int totalRecord1 = rDAO.getTotalRecord(pNo);
		int totalRecord2 = rDAO.getTotalRecordWithImage(pNo);
		String pageView1 = ReviewPageMaker1.getPageView("reviewList", Integer.parseInt(page1), Integer.parseInt(page2), recordPerPage1, totalRecord1, pNo);
		String pageView2 = ReviewPageMaker2.getPageView("reviewList", Integer.parseInt(page1), Integer.parseInt(page2), recordPerPage2, totalRecord2, pNo);
		
		model.addAttribute("page1", page1);
		model.addAttribute("list1", list1);
		model.addAttribute("totalRecord1", totalRecord1);
		model.addAttribute("pageView1", pageView1);
		model.addAttribute("list2", list2);
		model.addAttribute("totalRecord2", totalRecord2);
		model.addAttribute("pageView2", pageView2);
		model.addAttribute("pNo", pNo);
	}

}
