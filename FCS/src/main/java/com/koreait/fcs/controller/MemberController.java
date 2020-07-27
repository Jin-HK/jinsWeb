package com.koreait.fcs.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.fcs.command.Command;
import com.koreait.fcs.command.member.DeleteMember;
import com.koreait.fcs.command.member.EmailAuthCommand;
import com.koreait.fcs.command.member.ListMember;
import com.koreait.fcs.command.member.LoginMemberCommand;
import com.koreait.fcs.command.member.LogoutMemberCommand;
import com.koreait.fcs.command.member.MemberViewByAdminPage;
import com.koreait.fcs.command.member.UpdateByAdmin;
import com.koreait.fcs.dao.MemberDAO;
import com.koreait.fcs.dto.MemberDTO;

@Controller
public class MemberController {
	@Autowired
	private SqlSession sqlSession;
	private Command memberCommand; //@Autowired로 처리되는 대상이 아니다
	
	/*
	//단순이동
	@RequestMapping("/")
	public String goIndex() {
		return "index";
	}
	*/
	
	@RequestMapping("index")
	public String index() {
		return "redirect:/";
	}
	
	@RequestMapping("insertPage")
	public String insertPage() {
		return "member/insertPage";
	}
	
	@RequestMapping(value="loginPage")
	public String loginPage(HttpServletRequest request) {
		if(request.getParameter("pInfo")!=null) {
			String pInfo = request.getParameter("pInfo");
			HttpSession session = request.getSession();
			session.setAttribute("pInfo", pInfo);
		}
		return "member/loginPage";
	}

	@RequestMapping(value="findIdPage")
	public String findIdPage() {
		return "member/findIdPage";
	}

	@RequestMapping(value="findPwPage")
	public String findPwPage() {
		return "member/findPwPage";
	}
	
	@RequestMapping(value="changePwPage", method=RequestMethod.POST)
	public String changePw() {
		return "member/changePwPage";
	}
	@RequestMapping(value="checkPwPage", method=RequestMethod.POST)
	public String checkPwPage() {
		return "member/checkPwPage";
	}
	
	@RequestMapping("myPage")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("adminPage")
	public String adminPage() {
		return "member/adminPage";
	}
	
	
	
	
	//ajax
	//아이디 중복 조회
	@ResponseBody
	@RequestMapping(value="idCheck", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	public String idCheck(@RequestParam("mId") String mId) {
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		MemberDTO mDTO = mDAO.selectBymId(mId);
		JSONObject obj = new JSONObject();
		if(mDTO != null) {
			obj.put("result", "YES");
		}else {
			obj.put("result", "NO");
		}
		return obj.toJSONString();
	}
	
	
	//이메일 중복 조회
	@ResponseBody
	@RequestMapping(value="emailCheck", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	public String emailCheck(@RequestParam("mEmail") String mEmail) {
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		MemberDTO mDTO = mDAO.selectBymEmail(mEmail);
		JSONObject obj = new JSONObject();
		if(mDTO != null) {
			obj.put("result", "YES");
		}else {
			obj.put("result", "NO");
		}
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="signUp", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	public String sigUp(HttpServletRequest request) {
		JSONObject obj = new JSONObject();
		String mId = request.getParameter("mId");
		String mName = request.getParameter("mName");
		String mPw = request.getParameter("mPw");
		String mMobile1 = request.getParameter("mMobile1");
		String mMobile2 = request.getParameter("mMobile2");
		String mMobile3 = request.getParameter("mMobile3");
		String mEmail = request.getParameter("mEmail");
		String mBirth = request.getParameter("mBirth");
		String mPost = request.getParameter("mPost");
		String mAddr1 = request.getParameter("mAddr1");
		String mAddr2 = request.getParameter("mAddr2");
		String mAddr3 = request.getParameter("mAddr3");
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		int result = mDAO.signUpMember(mId, mName, mPw, mMobile1, mMobile2, mMobile3, mEmail, mBirth, mPost, mAddr1, mAddr2, mAddr3);
		if(result>0) {
			obj.put("result", "SUCCESS");
		}else {
			obj.put("result", "FAIL");			
		}
		return obj.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findId(HttpServletRequest request) {
		String mEmail = request.getParameter("mEmail");
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		MemberDTO mDTO = mDAO.selectBymEmail(mEmail);
		String responseText = null;
		if (mDTO != null) {
			responseText = mDTO.getmId();
		} else {
			responseText = "NO";  
		}
		return responseText;
	}
	
	@ResponseBody
	@RequestMapping(value="changePw", method=RequestMethod.POST)
	public String changePw(HttpServletRequest request) {
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		int result = mDAO.updateMemberPw(mPw, mId);
		HttpSession session = request.getSession();
		String responseText = null;
		if(result>0) {
			session.invalidate();
			responseText = "SUCCESS";
		}else {
			responseText = "FAIL";
		}
		return responseText;
	}
	
	@ResponseBody
	@RequestMapping(value="updateMember", produces="application/json; charset=utf-8", method=RequestMethod.POST)
	public String updateMember(HttpServletRequest request, Model model) {
		JSONObject obj = new JSONObject();
		String mId = request.getParameter("mId");
		String mName = request.getParameter("mName");
		String mMobile1 = request.getParameter("mMobile1");
		String mMobile2 = request.getParameter("mMobile2");
		String mMobile3 = request.getParameter("mMobile3");
		String mEmail = request.getParameter("mEmail");
		String mBirth = request.getParameter("mBirth");
		String mPost = request.getParameter("mPost");
		String mAddr1 = request.getParameter("mAddr1");
		String mAddr2 = request.getParameter("mAddr2");
		String mAddr3 = request.getParameter("mAddr3");
		MemberDAO mDAO = sqlSession.getMapper(MemberDAO.class);
		int result = mDAO.updateMember(mName, mMobile1, mMobile2, mMobile3, mEmail, mBirth, mPost, mAddr1, mAddr2, mAddr3, mId);
		if(result>0) {
			HttpSession session = request.getSession();
			session.removeAttribute("loginDTO");
			MemberDTO loginDTO = mDAO.selectBymId(mId);
			session.setAttribute("loginDTO", loginDTO);
			obj.put("result", "SUCCESS");
		}else {
			obj.put("result", "FAIL");			
		}
		return obj.toJSONString();
	}
	
	
	//command 호출
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		memberCommand = new LoginMemberCommand();
		memberCommand.execute(sqlSession, model);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("pInfo")!=null) {
			String pInfo = (String) session.getAttribute("pInfo");
			return "redirect:"+pInfo;
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);
		model.addAttribute("response", response);
		memberCommand = new LogoutMemberCommand();
		memberCommand.execute(sqlSession, model);
		return "redirect:/";
	}
	
	@Autowired
	private JavaMailSender mailSender; //root-context.xml의 빈 자동 생성
	
	@RequestMapping(value="emailAuth", method=RequestMethod.POST)
	public String emailAuth(HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("request", request);		
		model.addAttribute("response",response);
		model.addAttribute("mailSender", mailSender);
		memberCommand = new EmailAuthCommand();
		memberCommand.execute(sqlSession, model);
		return "member/emailAuthConfirm";
	}
	
	@RequestMapping("userManagementPage")
	public String userManagement(HttpServletRequest request, Model model) {		
		memberCommand = new ListMember();
		memberCommand.execute(sqlSession, model);
		return "member/userManagementPage";
	}
	
	@RequestMapping("memberViewPage")
	public String memberViewPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberCommand = new MemberViewByAdminPage();
		memberCommand.execute(sqlSession, model);
		return "member/memberViewPage";
	}
	
	@RequestMapping(value="deleteByAdmin", method=RequestMethod.POST)
	public String deleteByAdmin(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberCommand = new DeleteMember();
		memberCommand.execute(sqlSession, model);
		return "redirect:userManagementPage";
	}
	
	@RequestMapping(value="updateByAdmin", method=RequestMethod.POST)
	public String updateByAdmin(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		memberCommand = new UpdateByAdmin();
		memberCommand.execute(sqlSession, model);
		return "redirect:memberViewPage?mNo="+request.getParameter("mNo");
	}
	
	@RequestMapping(value="deleteMember", method=RequestMethod.POST)
	public String deleteMember(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		memberCommand = new DeleteMember();
		memberCommand.execute(sqlSession, model);
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
}

























