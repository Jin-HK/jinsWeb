<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../template/header.jsp">
   <jsp:param value="Order" name="title" />
</jsp:include>
<link href="resources/css/totalOrderList.css" media="all" rel="stylesheet" type="text/css"/>
<div class="visual"><img src="resources/images/1.jpg" alt=""></div>
</header>

<body>
<script type="text/javascript">
	
</script>
</head>
<body>
	
	<div class="contents" style="height:auto;">
		<div class="h-title"><h3>FCS 전체 구매 리스트(전체 매출액: <fmt:formatNumber value="${total }" pattern="#,##0" />원)</h3></div>
		<div class="content" style="height:auto;">
			<div class="productTable">
				<table class="pt" border="1">
					<thead>
						<tr>
							<th class="left-white-line">주문번호</th>
							<th class="left-white-line">구매자</th>
							<th class="left-white-line">상품번호</th>
							<th class="left-white-line">상품이름</th>
							<th class="left-white-line">옵션</th>
							<th class="left-white-line">구매수량</th>
							<th class="left-white-line">결제금액</th>
							<th class="left-white-line">주문날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="oList" items="${orderList}">
							<tr>
								<td>${oList.oNo}</td>
								<td>${oList.oName}</td>
								<td>${oList.pNo}</td>
								<td>${oList.pName}</td>
								<td>${oList.cSize}</td>
								<td>${oList.cartQuantity}ea</td>
								<td><fmt:formatNumber value="${oList.cartQuantity * oList.pPrice}" pattern="#,##0" /></td>
								<td>${oList.oDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
	</div>
	</div>

	
	
</body>
 <%@ include file="../template/footer.jsp" %>
</html>