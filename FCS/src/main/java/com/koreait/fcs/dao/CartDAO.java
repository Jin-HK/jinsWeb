package com.koreait.fcs.dao;

import java.util.ArrayList;

import com.koreait.fcs.dto.ProductDTO;

public interface CartDAO {

	// List
	public ArrayList<ProductDTO> selectBymId(String mId);
	
	// Delete
	public void cartDelete(int cartNo);
	
	// QuantityUp
	public void quantityUp(int cartNo);
		
	// QuantityDown
	public void quantityDown(int cartNo);
	
	// Insert
	public void cartInsert(String mId, int pNo, String cSize, int cartQuantity);
	
}
