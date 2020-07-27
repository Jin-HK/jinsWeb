package com.koreait.fcs.command.member;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.MemberDAO;
import com.koreait.fcs.dto.MemberDTO;

public class ListMember implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		ArrayList<MemberDTO> list = mDAO.memberList();
		model.addAttribute("list", list);
	}

}
