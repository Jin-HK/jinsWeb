package com.koreait.fcs.dto;

public class CartDTO {

	private int cartNo, pNo, cartQuantity, cValidate;
	private String mId, cSize;

	public CartDTO() {	}

	public CartDTO(int cartNo, int pNo, int cartQuantity, int cValidate, String mId, String cSize) {
		super();
		this.cartNo = cartNo;
		this.pNo = pNo;
		this.cartQuantity = cartQuantity;
		this.cValidate = cValidate;
		this.mId = mId;
		this.cSize = cSize;
	}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
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




}
