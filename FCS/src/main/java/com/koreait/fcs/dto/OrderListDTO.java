package com.koreait.fcs.dto;

import java.sql.Date;

public class OrderListDTO {

	private int oNo;
	private String oName,  oEmail, oPost, oAddr1, oAddr2, oAddr3;
	private char oMobile1, oMobile2, oMobile3;
	private Date oDate;

	private int cartNo, cartQuantity, cValidate;
	private String mId, cSize;

	private int pNo, pPrice, pCategory, pGender, pStock1, pStock2, pStock3;
	private String pName, pCompany, pThumbnail, pFilename, pDescription;
	private Date pRegdate;

	public OrderListDTO() {	}

	public OrderListDTO(int oNo, String oName, String oEmail, String oPost, String oAddr1, String oAddr2, String oAddr3,
			char oMobile1, char oMobile2, char oMobile3, Date oDate, int cartNo, int cartQuantity, int cValidate,
			String mId, String cSize, int pNo, int pPrice, int pCategory, int pGender, int pStock1, int pStock2,
			int pStock3, String pName, String pCompany, String pThumbnail, String pFilename, String pDescription,
			Date pRegdate) {
		super();
		this.oNo = oNo;
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
		this.cartNo = cartNo;
		this.cartQuantity = cartQuantity;
		this.cValidate = cValidate;
		this.mId = mId;
		this.cSize = cSize;
		this.pNo = pNo;
		this.pPrice = pPrice;
		this.pCategory = pCategory;
		this.pGender = pGender;
		this.pStock1 = pStock1;
		this.pStock2 = pStock2;
		this.pStock3 = pStock3;
		this.pName = pName;
		this.pCompany = pCompany;
		this.pThumbnail = pThumbnail;
		this.pFilename = pFilename;
		this.pDescription = pDescription;
		this.pRegdate = pRegdate;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
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

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public int getcValidate() {
		return cValidate;
	}

	public void setcValidate(int cValidate) {
		this.cValidate = cValidate;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getcSize() {
		return cSize;
	}

	public void setcSize(String cSize) {
		this.cSize = cSize;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public int getpCategory() {
		return pCategory;
	}

	public void setpCategory(int pCategory) {
		this.pCategory = pCategory;
	}

	public int getpGender() {
		return pGender;
	}

	public void setpGender(int pGender) {
		this.pGender = pGender;
	}

	public int getpStock1() {
		return pStock1;
	}

	public void setpStock1(int pStock1) {
		this.pStock1 = pStock1;
	}

	public int getpStock2() {
		return pStock2;
	}

	public void setpStock2(int pStock2) {
		this.pStock2 = pStock2;
	}

	public int getpStock3() {
		return pStock3;
	}

	public void setpStock3(int pStock3) {
		this.pStock3 = pStock3;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpCompany() {
		return pCompany;
	}

	public void setpCompany(String pCompany) {
		this.pCompany = pCompany;
	}

	public String getpThumbnail() {
		return pThumbnail;
	}

	public void setpThumbnail(String pThumbnail) {
		this.pThumbnail = pThumbnail;
	}

	public String getpFilename() {
		return pFilename;
	}

	public void setpFilename(String pFilename) {
		this.pFilename = pFilename;
	}

	public String getpDescription() {
		return pDescription;
	}

	public void setpDescription(String pDescription) {
		this.pDescription = pDescription;
	}

	public Date getpRegdate() {
		return pRegdate;
	}

	public void setpRegdate(Date pRegdate) {
		this.pRegdate = pRegdate;
	}



}
