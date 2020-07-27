package com.koreait.fcs.dao;

import java.sql.Date;
import java.util.ArrayList;

import com.koreait.fcs.dto.CartDTO;
import com.koreait.fcs.dto.CartListDTO;
import com.koreait.fcs.dto.OrderListDTO;

public interface OrderDAO {

	// 장바구니에 담겨진 상품정보 가져오기
	public ArrayList<CartListDTO> selectCartListBymId(String mId);
	
	// 장바구니 통하지 않고 바로 주문 시, 주문 건 장바구니에 넣기
	public void insertOrderToCart(String cSize, String mId, int pNo, int cartQuantity);
	
	// 장바구니 통하지 않고 바로 주문 시, 동일한 상품이 있는지 확인하기
	public CartDTO checkCartProduct(String mId, String cSize, int pNo);
	
	// 장바구니 통하지 않고 바로 주문 시, 장바구니에 동일한 상품이 있을 경우 해당 cartQuantity 수량 늘리기
	public void updateCartQuantity(int cartQuantity, int cartNo);
	
	// 주문 시 주문테이블에 데이터 삽입
	public int insertOrder(String mId, String oName, String oMobile1, String oMobile2, String oMobile3, String oEmail, String oPost, String oAddr1, String oAddr2, String oAddr3, int cartNo);
	
	// 주문 시 상품테이블에서 재고 업데이트
	public void updateProductStock(String cSize, int cartQuantity, int pNo);
	
	// 결제 완료 시 장바구니 테이블에서 validate 값 바꿔주기
	public void updateCartValidate(int cartNo);
	
	// 주문일만 불러오기
	public ArrayList<String> selectOrderDate(String mId);
	
	// 주문일별 주문리스트 불러오기
	public ArrayList<OrderListDTO> selectOrderListByOdate(String mId, Date date);
	
	// 나의 주문내역(상품정보) 확인
	public ArrayList<OrderListDTO> selectMyOrderList(String mId);
	
	// 관리자용 - 전체 주문내역 확인
	public ArrayList<OrderListDTO> selectTotalOrderList();
}
