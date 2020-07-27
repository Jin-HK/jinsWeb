package com.koreait.fcs.dto;

import java.sql.Date;

public class OrderDTO {
	
	private int oNo, cartNo;
	private String mId, oName,  oEmail, oPost, oAddr1, oAddr2, oAddr3;
	private char oMobile1, oMobile2, oMobile3;
	private Date oDate;
	
	public OrderDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderDTO(int oNo, int cartNo, String mId, String oName, String oEmail, String oPost, String oAddr1,
			String oAddr2, String oAddr3, char oMobile1, char oMobile2, char oMobile3, Date oDate) {
		super();
		this.oNo = oNo;
		this.cartNo = cartNo;
		this.mId = mId;
		this.oName = oName;
		this.oEmail = oEmail;
		this.oPost = oPost;
		this.oAddr1 = oAddr1;
		this.oAddr2 = oAddr2;
		this.oAddr3 = oAddr3;
		this.oMobile1 = oMobile1;
		this.oMobile2 = oMobile2;
		this.oMobile3 = oMobile3;
		this.oDate = oDate;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getoName() {
		return oName;
	}

	public void setoName(String oName) {
		this.oName = oName;
	}

	public String getoEmail() {
		return oEmail;
	}

	public void setoEmail(String oEmail) {
		this.oEmail = oEmail;
	}

	public String getoPost() {
		return oPost;
	}

	public void setoPost(String oPost) {
		this.oPost = oPost;
	}

	public String getoAddr1() {
		return oAddr1;
	}

	public void setoAddr1(String oAddr1) {
		this.oAddr1 = oAddr1;
	}

	public String getoAddr2() {
		return oAddr2;
	}

	public void setoAddr2(String oAddr2) {
		this.oAddr2 = oAddr2;
	}

	public String getoAddr3() {
		return oAddr3;
	}

	public void setoAddr3(String oAddr3) {
		this.oAddr3 = oAddr3;
	}

	public char getoMobile1() {
		return oMobile1;
	}

	public void setoMobile1(char oMobile1) {
		this.oMobile1 = oMobile1;
	}

	public char getoMobile2() {
		return oMobile2;
	}

	public void setoMobile2(char oMobile2) {
		this.oMobile2 = oMobile2;
	}

	public char getoMobile3() {
		return oMobile3;
	}

	public void setoMobile3(char oMobile3) {
		this.oMobile3 = oMobile3;
	}

	public Date getoDate() {
		return oDate;
	}

	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}

	
	

	
	
	
}
