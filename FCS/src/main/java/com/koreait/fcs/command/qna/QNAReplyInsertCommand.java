package com.koreait.fcs.command.qna;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.QNABoardDAO;
import com.koreait.fcs.dto.QNABoardDTO;

public class QNAReplyInsertCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		String qTitle = request.getParameter("qTitle");
		String qPw = request.getParameter("qPw");
		String qContent = request.getParameter("qContent");
		String mId = request.getParameter("mId");
		String page = request.getParameter("page");
		int qNo = Integer.parseInt(request.getParameter("qNo"));

		QNABoardDAO qDAO = sqlSession.getMapper(QNABoardDAO.class);
		QNABoardDTO qDTO = qDAO.selectByqNo(qNo);
		int qRef = qDTO.getqRef();
		int qDepth = qDTO.getqDepth()+1;
		int qStep = qDTO.getqStep()+1;

		qDAO.updateqStep(qRef);
		int result = qDAO.insertReply(pNo, qTitle, qPw, qContent, mId, qRef, qStep, qDepth);
		model.addAttribute("pNo", pNo);
		model.addAttribute("page", page);

		if(result > 0) {

		}else {
			try {				
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('댓글이 등록되지 않았습니다.);'");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
