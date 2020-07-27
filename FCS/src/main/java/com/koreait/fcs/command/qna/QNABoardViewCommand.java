package com.koreait.fcs.command.qna;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.QNABoardDAO;
import com.koreait.fcs.dto.QNABoardDTO;

public class QNABoardViewCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		String page = request.getParameter("page");
		QNABoardDAO qDAO = sqlSession.getMapper(QNABoardDAO.class);
		QNABoardDTO qDTO = qDAO.selectByqNo(qNo);
		model.addAttribute("qDTO", qDTO);
		model.addAttribute("page", page);
	}

}
