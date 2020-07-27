package com.koreait.fcs.dto;

import java.sql.Date;

public class QNABoardDTO {
	int qNo, qRef, qStep, qDepth, qDelete, pNo;
	String qTitle, qContent, qPw, mId;
	Date qRegdate;

	public QNABoardDTO() {	}

	public QNABoardDTO(int qNo, int qRef, int qStep, int qDepth, int qDelete, int pNo, String qTitle, String qContent,
			String qPw, String mId, Date qRegdate) {
		super();
		this.qNo = qNo;
		this.qRef = qRef;
		this.qStep = qStep;
		this.qDepth = qDepth;
		this.qDelete = qDelete;
		this.pNo = pNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qPw = qPw;
		this.mId = mId;
		this.qRegdate = qRegdate;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public int getqRef() {
		return qRef;
	}

	public void setqRef(int qRef) {
		this.qRef = qRef;
	}

	public int getqStep() {
		return qStep;
	}

	public void setqStep(int qStep) {
		this.qStep = qStep;
	}

	public int getqDepth() {
		return qDepth;
	}

	public void setqDepth(int qDepth) {
		this.qDepth = qDepth;
	}

	public int getqDelete() {
		return qDelete;
	}

	public void setqDelete(int qDelete) {
		this.qDelete = qDelete;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqPw() {
		return qPw;
	}

	public void setqPw(String qPw) {
		this.qPw = qPw;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public Date getqRegdate() {
		return qRegdate;
	}

	public void setqRegdate(Date qRegdate) {
		this.qRegdate = qRegdate;
	}


}

