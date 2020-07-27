package com.koreait.fcs.command.member;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.ui.Model;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.dao.MemberDAO;
import com.koreait.fcs.dto.MemberDTO;

public class EmailAuthCommand implements Command {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpServletResponse response = (HttpServletResponse)map.get("response");
		String mId = request.getParameter("mId");
		String mEmail = request.getParameter("mEmail");
		
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		MemberDTO mDTO = mDAO.findPw(mId, mEmail);
		long authKey;
		if(mDTO!=null) {
			try {
					//SimpleMailMessage 클래스가 이메일 내용을 작성한다.
					SimpleMailMessage message = new SimpleMailMessage();
					JavaMailSender mailSender = (JavaMailSender) map.get("mailSender");
					
					//보내는 사람
					message.setFrom("admin@gmail.com"); //보내는 사람의 메일 주소
					message.setTo(mEmail); //받는 사람의 메일주소
					message.setSubject("인증메일입니다."); //제목
					authKey = (long)(Math.random() * 100000000)+123456789; //자유롭게 인증키 생성
					message.setText("다음 인증 번호를 입력하세요");
					message.setText("인증번호 : " + authKey);
					
					//mailSender 는 send() 메소드로 이메일을 보낸다.
					mailSender.send(message);
					
					//authKey 를 emailAuthConfirm.jsp로 보낸다
					model.addAttribute("authKey", authKey);
					model.addAttribute("mId", mId);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}	
		else {
			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out;
				out = response.getWriter();
				out.println("<script type='text/javascript'>");
				out.println("alert('제출된 정보와 일치하는 회원이 없습니다.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
