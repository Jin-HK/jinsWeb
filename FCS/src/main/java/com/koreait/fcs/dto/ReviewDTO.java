package com.koreait.fcs.dto;

import java.sql.Date;

public class ReviewDTO {
	int rNo, pNo, rScore;
	String mId, rTitle, rContent, rFilename;
	Date rRegdate;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int rNo, int pNo, int rScore, String mId, String rTitle, String rContent, String rFilename,
			Date rRegdate) {
		super();
		this.rNo = rNo;
		this.pNo = pNo;
		this.rScore = rScore;
		this.mId = mId;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rFilename = rFilename;
		this.rRegdate = rRegdate;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getrScore() {
		return rScore;
	}

	public void setrScore(int rScore) {
		this.rScore = rScore;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrFilename() {
		return rFilename;
	}

	public void setrFilename(String rFilename) {
		this.rFilename = rFilename;
	}

	public Date getrRegdate() {
		return rRegdate;
	}

	public void setrRegdate(Date rRegdate) {
		this.rRegdate = rRegdate;
	}
	
	
}
