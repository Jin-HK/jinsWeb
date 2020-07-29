<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../template/header.jsp">
   <jsp:param value="Order" name="title" />
</jsp:include>
<link href="resources/css/order.css" media="all" rel="stylesheet" type="text/css"/>
<div class="visual"><img src="resources/images/black.png" alt=""></div>
</header>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<body>
<script type="text/javascript">
	
$(document).ready(function(){
	
	$('#oName').val('${loginDTO.mName}');
	$('#oEmail').val('${loginDTO.mEmail}');
	$('#oMobile1').val('${loginDTO.mMobile1}');
	$('#oMobile2').val('${loginDTO.mMobile2}');
	$('#oMobile3').val('${loginDTO.mMobile3}');
	$('#oPost').val('${loginDTO.mPost}');
	$('#oAddr1').val('${loginDTO.mAddr1}');
	$('#oAddr2').val('${loginDTO.mAddr2}');
	$('#oAddr3').val('${loginDTO.mAddr3}');

	// 체크되어 있다
	$('#resetInfo').change(function(){
		if ( $('#resetInfo').is(':checked') ) {
			$('#oName').val('${loginDTO.mName}');
			$('#oEmail').val('${loginDTO.mEmail}');
			$('#oMobile1').val('${loginDTO.mMobile1}');
			$('#oMobile2').val('${loginDTO.mMobile2}');
			$('#oMobile3').val('${loginDTO.mMobile3}');
			$('#oPost').val('${loginDTO.mPost}');
			$('#oAddr1').val('${loginDTO.mAddr1}');
			$('#oAddr2').val('${loginDTO.mAddr2}');
			$('#oAddr3').val('${loginDTO.mAddr3}');
		} else {
				$('#oName').val('');
				$('#oEmail').val('');
				$('#oMobile1').val('');
				$('#oMobile2').val('');
				$('#oMobile3').val('');
				$('#oPost').val('');
				$('#oAddr1').val('');
				$('#oAddr2').val('');
				$('#oAddr3').val('');
			// 체크해제되어 있다.

		}
		
	});
});
	
	
	//주소 api
	function execDaumPostcode() {
	     new daum.Postcode({
	         oncomplete: function(data) {
	             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	             var roadAddr = data.roadAddress; // 도로명 주소 변수
	             var extraRoadAddr = ''; // 참고 항목 변수
	
	             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                 extraRoadAddr += data.bname;
	             }
	             // 건물명이 있고, 공동주택일 경우 추가한다.
	             if(data.buildingName !== '' && data.apartment === 'Y'){
	                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	             }
	             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	             if(extraRoadAddr !== ''){
	                 extraRoadAddr = ' (' + extraRoadAddr + ')';
	             }
	
	             // 우편번호와 주소 정보를 해당 필드에 넣는다.
	             document.getElementById('oPost').value = data.zonecode;
	             document.getElementById("oAddr1").value = roadAddr;
	             document.getElementById("oAddr2").value = data.jibunAddress;
	           
	         }
	     }).open();
	 }
	
	function fn_submitOrderFromCart(f) {
			
			if (f.oName.value == '') {
				alert('이름을 입력하세요');
				f.oName.focus();
				return;
			} else if (f.oEmail.value == '') {
				alert('이메일을 입력하세요');
				f.oEmail.focus();
				return;
			} else if (f.oMobile2.value == '' || f.oMobile3.value == '') {
				alert('전화번호를 입력하세요');
				f.oMobile2.focus();
				return;
			} else if (f.oAddr3.value == '') {
				alert('상세주소를 입력하세요');
				f.oAddr3.focus();
				return;
			} else if (f.oAddr1.value == '' || f.oAddr2.value == '' || f.oPost.value == '') {
				alert('우편번호 검색 버튼을 눌러 주소를 찾아주세요');
				f.oAddr1.focus();
				return;
			}
		
		f.action = 'submitOrderFromCart';
		f.submit();
	}
	
</script>
</head>
<body>
	<div class="wrap">
		<div class="h-title"><h3>주문상품</h3></div>
		<div class="orderProductList">
			<div class="productTable">
				<table class="pt" border="1">
			<thead>
				<tr>
					<th class="left-white-line">상품정보</th>
					<th>가격</th>
					<th>수량</th>
					<th class="right-white-line">총금액</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${cartList eq null }">
					<tr>
						<td colspan="4">
							없음
						</td>
					</tr>
				</c:if>
				<c:if test="${cartList ne null }">
					<c:forEach var="cart" items="${cartList}">
						<tr>
							<td class="left-white-line">(상품번호: ${cart.pNo})<br/>[${cart.pCompany}]${cart.pName }(사이즈:${cart.cSize})</td>
							<td><fmt:formatNumber value="${cart.pPrice }" pattern="#,##0" />원</td>
							<td>${cart.cartQuantity}ea</td>
							<td class="right-white-line"><fmt:formatNumber value="${cart.pPrice * cart.cartQuantity }" pattern="#,##0" />원</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	<div class="totalPrice">총 <fmt:formatNumber value="${total }" pattern="#,##0" />원</div>
	</div>
	</div>
	
	<div class="order-info">
	<div class="infoTableBox">
   <form id='f'  method="POST">
       <div id="checkBox">
	           <p><span id="titleBold">주문자 정보&nbsp;&nbsp;</span>주문자 정보와 다를 경우 체크를 해제해주세요. <input id="resetInfo" type="checkbox" name="resetInfo" value="true" checked/></p>
	   </div>
	    <div class="infoTable">
     	 <table class="if-tb">
	         <tbody>
	            <tr>
	               <td class="colName">성명</td>
	               <td class="colValue"><input type="text" id="oName" name="oName" value=""/></td>
	            </tr>
	            <tr>
	               <td class="colName">이메일</td>
	               <td class="colValue">
	                  <input id="oEmail" type="text" name="oEmail"/>
	               </td>
	            </tr>
	            <tr>
	               <td class="colName">전화번호</td>
	               <td class="colValue">
	                  <select id="oMobile1" name="oMobile1">
	                     <option>010</option>
	                     <option>011</option>
	                     <option>016</option>
	                     <option>019</option>
	                  </select>
	                  -
	                  <input id="oMobile2" type="number" name="oMobile2"/>
	                  -
	                  <input id="oMobile3" type="number" name="oMobile3"/>         
	               </td>
	            </tr>
	            <tr>
	               <td class="colName">우편번호</td>
	               <td class="colValue"><input type="text" id="oPost" name="oPost">&nbsp;&nbsp;&nbsp;<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br></td>
	            </tr>
	            <tr>
	               <td class="colName">도로명주소</td>
	               <td class="colValue"><input type="text" id="oAddr1" name="oAddr1"  placeholder="도로명주소"></td>
	            </tr>
	            <tr>
	               <td class="colName">지번주소</td>
	               <td class="colValue">
	                  <input type="text" id="oAddr2" name="oAddr2" placeholder="지번주소">
	                  <span id="guide" style="color:#999;display:none"></span>
	               </td>
	            </tr>
	            <tr>
	               <td class="colName">상세주소</td>
	               <td class="colValue"><input type="text" id="oAddr3" name="oAddr3" placeholder="상세주소"></td>
	            </tr>
	         </tbody>
	         <tfoot>
	            <tr>
	               <td class="button-row" colspan="2">
	                  <!-- 사이즈 변수를 받아와서 mapper 에서 if 문으로 s일 경우, m일 경우, l일 경우를 구분하여 재고 업데이트 -->
	                  <input type="hidden" name="cSize" value="${cDTO.cSize}" />
	                  <input type="hidden" name="pNo" value="${pDTO.pNo}" />
		              <input type="hidden" name="mName" value="${loginDTO.mName}" />
	                  <input type="hidden" name="pName" value="${pDTO.pName}" />
	                  <input type="hidden" name="pDescription" value="${pDTO.pDescription}" />
	                  <input type="hidden" name="cartQuantity" value="${cDTO.cartQuantity}" />
	                  <input type="hidden" name="pPrice" value="${pDTO.pPrice}" />
	                  <input type="hidden" name="totalPrice" value="${total}" />
	                  <input type="hidden" name="mId" value="${loginDTO.mId}" />
	                  <input id="cancelOrder" type="button" value="결제취소"  onclick="history.back()"/>
	                  <input id="submitOrder" type="button" value="결제하기" onclick="fn_submitOrderFromCart(this.form)"/>
	               </td>
	            </tr>
	         </tfoot>
	      </table>
	      </div>
   </form>
   </div>
   </div>
</div>
	
</body>
 <%@ include file="../template/footer.jsp" %>
</html>