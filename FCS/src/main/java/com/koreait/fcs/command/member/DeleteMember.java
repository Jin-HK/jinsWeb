package com.koreait.fcs.command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.MemberDAO;

public class DeleteMember implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int mNo = Integer.parseInt(request.getParameter("mNo"));
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		mDAO.deleteMember(mNo);
	}

}
