package com.koreait.fcs.dto;

import java.sql.Date;

public class NoticeDTO {

	private int nNo, nHit;
	private String mId, nTitle, nContent, mName;
	private Date nRegdate;

	public NoticeDTO() {	}

	public NoticeDTO(int nNo, String mId, int nHit, String nTitle, String nContent, Date nRegdate, String mName) {
		super();
		this.nNo = nNo;
		this.mId = mId;
		this.nHit = nHit;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nRegdate = nRegdate;
		this.mName = mName;
	}
	public int getnNo() {
		return nNo;
	}
	public void setnNo(int nNo) {
		this.nNo = nNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getnHit() {
		return nHit;
	}
	public void setnHit(int nHit) {
		this.nHit = nHit;
	}
	public String getnTitle() {
		return nTitle;
	}
	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}
	public String getnContent() {
		return nContent;
	}
	public void setnContent(String nContent) {
		this.nContent = nContent;
	}
	public Date getnRegdate() {
		return nRegdate;
	}
	public void setnRegdate(Date nRegdate) {
		this.nRegdate = nRegdate;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}

}
