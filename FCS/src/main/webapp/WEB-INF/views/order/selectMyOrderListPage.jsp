<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../template/header.jsp">
   <jsp:param value="Order" name="title" />
</jsp:include>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link href="resources/css/orderList.css" media="all" rel="stylesheet" type="text/css"/>
<div class="visual"><img src="resources/images/1.jpg" alt=""></div>
<style>

.wrap {
	width: 100%;
}

.main {
	width: 100%;
}

.contents {
	width: 70%;
	margin: auto;
}

.head {
	text-align: center;
	padding: 20px;
}
#date {
	font-size: 23px;
    font-weight: bold;
    color: chocolate;
    padding-left: 10px;
    border-bottom: 1px solid lightgray;
    padding-top: 5px;
    padding-bottom: 5px;
}

.table {
	display: table;
	width: 100%;
}
.thead {
	display: table-row;
	width: 100%;
	font-size: 20px;
    font-weight: bold;
}

.tcell {
	display: table-cell;
	text-align: center;
    padding-left: 25px;
    padding-right: 25px;
    padding-top: 10px;
    padding-bottom: 5px;
    vertical-align: middle;
}

.tbody {
	display: table-row;
	width: 100%;
	font-size: 17px;
}
.tbcell {
	display: table-cell;
	text-align: center;
    padding-left: 25px;
    padding-right: 25px;
    padding-top: 10px;
    padding-bottom: 10px;
	border-collapse: collapse;
	vertical-align: middle;
}


.thead div:nth-of-type(1) {width: 15%; border-right: 1px solid lightgray;}
.thead div:nth-of-type(2) {width: 15%; border-right: 1px solid lightgray;}
.thead div:nth-of-type(3) {width: 30%; border-right: 1px solid lightgray;}
.thead div:nth-of-type(4) {width: 10%; border-right: 1px solid lightgray;}
.thead div:nth-of-type(5) {width: 15%; border-right: 1px solid lightgray;}
.thead div:nth-of-type(6) {width: 15%;}

.tbody div:nth-of-type(1) {width: 15%; border-top: 1px solid lightgray; border-right: 1px solid lightgray;}
.tbody div:nth-of-type(2) {width: 15%; border-right: 1px solid lightgray; border-top: 1px solid lightgray;}
.tbody div:nth-of-type(3) {width: 30%; border-right: 1px solid lightgray;  border-top: 1px solid lightgray;}
.tbody div:nth-of-type(4) {width: 10%; border-right: 1px solid lightgray;  border-top: 1px solid lightgray;}
.tbody div:nth-of-type(5) {width: 15%; border-right: 1px solid lightgray; border-top: 1px solid lightgray;}
.tbody div:nth-of-type(6) {width: 15%; border-top: 1px solid lightgray;}

</style>
</header>
</head>

<body>

<div class="wrap">
	<div class="head"><h1>${mName }님의 주문 리스트</h1></div>
	<div class="main">
		<div class="contents">		
			<c:forEach var="orderDate" items="${oDatelist}">
					<div id="date" >주문일 : ${orderDate }</div>
					<div class="table">
						<div class="thead">
							<div class="tcell">주문번호</div>
							<div class="tcell">주문자</div>
							<div class="tcell">상품정보</div>
							<div class="tcell">수량</div>
							<div class="tcell">결제금액</div>
							<c:if test="${loginDTO.mId ne 'admin' }">
								<div class="tcell" style="width:15%;">리뷰 작성</div>
							</c:if>
						</div>
					</div>
						<div class="table">
					<c:forEach var="olist" items="${oList}" >
						<c:if test="${orderDate eq olist.oDate}">
							<div class="tbody">
								<div class="tbcell">${olist.oNo }</div> 
								<div class="tbcell">${olist.oName }</div> 
								<div class="tbcell">${olist.pName }(사이즈:${olist.cSize })</div> 
								<div class="tbcell">${olist.cartQuantity }</div> 
								<div class="tbcell"><fmt:formatNumber value="${olist.pPrice * olist.cartQuantity }" pattern="#,##0" />원</div>
								<c:if test="${loginDTO.mId ne 'admin' }">
									<div class="tbcell"><button onclick="location.href='reviewInsertPage?pNo=${olist.pNo}&mId=${loginDTO.mId }'"><i class="fas fa-edit"></i></button></div>
								</c:if>
							</div>
						</c:if>
					</c:forEach>
						</div>
			</c:forEach>
		</div >		
	</div>
</div>
</body>
 <%@ include file="../template/footer.jsp" %>
</html>