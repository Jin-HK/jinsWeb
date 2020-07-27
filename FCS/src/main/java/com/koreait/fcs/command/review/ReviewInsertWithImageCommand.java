package com.koreait.fcs.command.review;

import java.io.File;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.ReviewDAO;

public class ReviewInsertWithImageCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) map.get("mr");
		int pNo = Integer.parseInt(mr.getParameter("pNo"));
		MultipartFile file = mr.getFile("file");
		String mId = mr.getParameter("mId");
		String rTitle = mr.getParameter("rTitle");
		String rContent = mr.getParameter("rContent");
		int rScore = Integer.parseInt(mr.getParameter("rScore"));
		String originFilename = file.getOriginalFilename();
		String extName = originFilename.substring(originFilename.lastIndexOf(".")+1);
		String saveFilename = null;

		try {

			saveFilename = originFilename.substring(0,originFilename.lastIndexOf("."))+
					"_"+System.currentTimeMillis()+
					"."+extName;

			String realPath = mr.getSession().getServletContext().getRealPath("/resources/storage");

			File directory = new File(realPath);
			if(!directory.exists()) {
				directory.mkdirs(); 
			}
			File saveFile = new File(realPath, saveFilename); 

			file.transferTo(saveFile);

			ReviewDAO rDAO = sqlSession.getMapper(ReviewDAO.class);
			rDAO.reviewInsertWithImage(pNo, rTitle, rContent, mId, rScore, saveFilename);
			model.addAttribute("pNo",pNo);

		} catch(Exception e) {
			e.printStackTrace();
		}
	}

}
