<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../template/header.jsp">
   <jsp:param value="장바구니" name="title" />
</jsp:include>
<link href="resources/css/cartList.css" media="all" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div class="visual"><img src="resources/images/beads.jpg" alt=""></div>
</header>

	<body>
<script type="text/javascript">
	var i;
	function fn_delete(f) {
		f.action = 'cartDelete';
		f.submit();
	}
	/* function fn_quantityDown(f) {
		f.action = 'quantityDown';
		f.submit();
	} */
	function fn_quantityUp(f) {
		f.action = 'quantityUp';
		f.submit();
	}
</script>

<div class="wrap" style="height:auto;">
	<div class="head"><h2>${mId}님의 장바구니</h2></div>
	<div id="main">
			<div id="table">
					<table class="pt" border="1">
						<thead>
							<tr>
									<th>품목</th>
									<th>상품정보</th>
									<th>상품가격</th>
									<th>수량</th>
									<th>총 가격</th>
									<th>삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty list}">
									<tr>
										<td colspan="8">목록이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty list }">
									<c:forEach var="pDTO" items="${list}">
										<form id="f${pDTO.cartNo}">
											<c:if test="${pDTO.cValidate eq 0}">
												<tr>
													<td><img style="width: 100px; height: 70px;"id="thumbnail" src="${pageContext.request.contextPath}/resources/storage/${pDTO.pThumbnail}" alt="Thumbnail"></td>
													<td>
														(상품번호: ${pDTO.pNo})<br/>[${pDTO.pCompany}]${pDTO.pName }(사이즈:${pDTO.cSize})
													</td>
													<td>
														<fmt:formatNumber value="${pDTO.pPrice}" />원<br/>
													</td>
													<td>
														<input type="hidden" name="cartNo" value="${pDTO.cartNo}" />
														<input type="hidden" name="mId" value="${mId}" />
														<input type="hidden" name="pPrice" value="${pDTO.pPrice}" />
														<input type="hidden" name="cSize" value="${pDTO.cSize}" />
														<input type="hidden" name="pStock1" value="${pDTO.pStock1}" />
														<input type="hidden" name="pStock2" value="${pDTO.pStock2}" />
														<input type="hidden" name="pStock3" value="${pDTO.pStock3}" />
														<!-- <input type="button" value="-" onclick="fn_quantityDown(this.form)" /> -->
														<input style="width: 20px;" id="quantityDownBtn${pDTO.cartNo}" type="button" value="-"/>
														<input class="inputBox" id="cartQuantity${pDTO.cartNo }" type="text" name="cartQuantity" value="${pDTO.cartQuantity}" readonly />
														<input style="width: 20px;" id="quantityUpBtn${pDTO.cartNo}" type="button" value="+"/>
													</td>			
													<td>
														<input class="inputBox" id="price${pDTO.cartNo}" value="${pDTO.pPrice * pDTO.cartQuantity}" readonly>원<br/>
													</td>
													<td style="width:8%;">
														<button onclick="fn_delete(this.form)"><i class="fas fa-trash-alt"></i></button>
													</td>												
														<!-- <input id="deleteButton" type="button" value="제거" onclick="fn_delete(this.form)" /> -->											
												</tr>
											</c:if>
										</form>
<!-- 여기부터 ajax -->
<script type="text/javascript">
$(document).ready(function(){
	   
	   var totalPrice = ${total};
	   $('#quantityDownBtn${pDTO.cartNo}').click(function(){
	      totalPrice -= ${pDTO.pPrice};
	        $.ajax({
	           url: 'quantityDown',
	           type: 'GET',
	           dataType: 'JSON',
	           data: $('#f${pDTO.cartNo}').serialize(),
	           success: function(responseObject){
	              if(responseObject.result == 'SUCCESS'){
	                $('#cartQuantity'+responseObject.cartNo).val(responseObject.value);
	                $('#price'+responseObject.cartNo).val(responseObject.total);
	                $('#totalPrice').text(totalPrice);
	              }else{
	                 alert('최소 주문 수량은 1개입니다.');
	              }
	           },
	           error:function(){
	              alert('AJAX 통신이 실패했습니다.');
	           }
	        });
	     });
	   
	   $('#quantityUpBtn${pDTO.cartNo}').click(function(){
	      totalPrice += ${pDTO.pPrice};
	        $.ajax({
	           url: 'quantityUp',
	           type: 'GET',
	           dataType: 'JSON',
	           data: $('#f${pDTO.cartNo}').serialize(),
	           success: function(responseObject){
	              if(responseObject.result == 'SUCCESS'){
	                $('#cartQuantity'+responseObject.cartNo).val(responseObject.value);
	                $('#price'+responseObject.cartNo).val(responseObject.total);
	                $('#totalPrice').text(totalPrice);
	              }else{
	                 alert('재고가 부족합니다.');
	              }
	           },
	           error:function(){
	              alert('AJAX 통신이 실패했습니다.');
	           }
	        });
	     });
	});

</script>
<!-- 여기까지 ajax -->
									</c:forEach>
								</c:if>
							</tbody>
					</table>
					</div>
				</div>
		</div>
			<div class="order-info">
				<div id="infoTableBox">
					<form action="orderPageFromCart" method="POST">		
						<div class="showTotalPrice">
							<div class="total">상품합계(${count} 품목):&nbsp;<span id="totalPrice" class="total"><fmt:formatNumber value="${total}" /></span>원</div>
						</div>
						<div class="sendOrder">
							<input type="hidden" name="list" value="${list}">
							<input type="hidden" name="total" value="${total}" />
							<input type="hidden" name="mId" value="${mId}" />
							<input id="orderButton" type="submit" value="주문하기"/>&nbsp;&nbsp;&nbsp;
							<input id="goMain" type="button" value="계속 쇼핑하기" onclick="history.back()"/>
						</div>		
					</form>	
				</div>
			</div>
	</body>
 <%@ include file="../template/footer.jsp" %>
 </html>