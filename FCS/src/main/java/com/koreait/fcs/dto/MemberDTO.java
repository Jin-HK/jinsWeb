package com.koreait.fcs.dto;

import java.sql.Date;

public class MemberDTO {
	private int mNo;
	private String mId, mName, mPw, mMobile1, mMobile2, mMobile3, mEmail, mBirth, mPost, mAddr1, mAddr2, mAddr3, mValidate;
	private Date mRegdate;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}


	public String getmAddr1() {
		return mAddr1;
	}


	public void setmAddr1(String mAddr1) {
		this.mAddr1 = mAddr1;
	}


	public String getmAddr2() {
		return mAddr2;
	}


	public void setmAddr2(String mAddr2) {
		this.mAddr2 = mAddr2;
	}


	public String getmAddr3() {
		return mAddr3;
	}


	public void setmAddr3(String mAddr3) {
		this.mAddr3 = mAddr3;
	}


	public MemberDTO(int mNo, String mId, String mName, String mPw, String mMobile1, String mMobile2, String mMobile3,
			String mEmail, String mBirth, String mPost, String mAddr1, String mAddr2, String mAddr3, String mValidate, Date mRegdate) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mName = mName;
		this.mPw = mPw;
		this.mMobile1 = mMobile1;
		this.mMobile2 = mMobile2;
		this.mMobile3 = mMobile3;
		this.mEmail = mEmail;
		this.mBirth = mBirth;
		this.mPost = mPost;
		this.mAddr1 = mAddr1;
		this.mAddr2 = mAddr2;
		this.mAddr3 = mAddr3;
		this.mValidate = mValidate;
		this.mRegdate = mRegdate;
	}


	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmMobile1() {
		return mMobile1;
	}

	public void setmMobile1(String mMobile1) {
		this.mMobile1 = mMobile1;
	}

	public String getmMobile2() {
		return mMobile2;
	}

	public void setmMobile2(String mMobile2) {
		this.mMobile2 = mMobile2;
	}

	public String getmMobile3() {
		return mMobile3;
	}

	public void setmMobile3(String mMobile3) {
		this.mMobile3 = mMobile3;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmBirth() {
		return mBirth;
	}

	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}

	public String getmPost() {
		return mPost;
	}

	public void setmPost(String mPost) {
		this.mPost = mPost;
	}

	public Date getmRegdate() {
		return mRegdate;
	}

	public String getmValidate() {
		return mValidate;
	}


	public void setmValidate(String mValidate) {
		this.mValidate = mValidate;
	}


	public void setmRegdate(Date mRegdate) {
		this.mRegdate = mRegdate;
	}
	
	
}
