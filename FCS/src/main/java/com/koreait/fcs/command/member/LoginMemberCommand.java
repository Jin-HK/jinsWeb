package com.koreait.fcs.command.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.MemberDAO;
import com.koreait.fcs.dto.MemberDTO;

public class LoginMemberCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		MemberDTO loginDTO = mDAO.login(mId, mPw);

		HttpSession session = null;
		try {
			if(loginDTO != null) {
				session = request.getSession();
				session.setAttribute("loginDTO", loginDTO); //로그인에 성공하면 회원정보가 session에 저장된다.
			}else {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out;

				out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('제출된 정보와 일치하는 회원이 없습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
