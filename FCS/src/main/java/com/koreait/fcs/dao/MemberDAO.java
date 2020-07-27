package com.koreait.fcs.dao;

import java.util.ArrayList;

import com.koreait.fcs.dto.MemberDTO;

public interface MemberDAO {
	
	//아이디 체크
	public MemberDTO selectBymId(String mId);
	
	//이메일 체크
	public MemberDTO selectBymEmail(String mEmail);
	
	//회원가입
	public int signUpMember(String mId, String mName, String mPw, String mMobile1, String mMobile2, String mMobile3, String mEmail, String mBirth, String mPost, String mAddr1, String mAddr2, String mAddr3);
	
	
	//로그인
	public MemberDTO login(String mId, String mPw);
	
	//패스워드찾기
	public MemberDTO findPw(String mId, String mEmail);
	
	//패스워드 변경
	public int updateMemberPw(String mPw, String mId);
	
	//회원정보 수정
	public int updateMember(String mName, String mMobile1, String mMobile2, String mMobile3, String mEmail, String mBirth, String mPost, String mAddr1, String mAddr2, String mAddr3, String mId);
	
	//회원 목록 불러오기
	public ArrayList<MemberDTO> memberList();
	
	//회원 정보 수정(관리자)
	public MemberDTO memberViewByAdminPage(int mNo);
	
	//회원 삭제 (관리자)
	public int deleteMember(int mNo);
	
	//회원 정보 수정 (관리자)
	public int updateByAdmin(String mName, String mId);
}










