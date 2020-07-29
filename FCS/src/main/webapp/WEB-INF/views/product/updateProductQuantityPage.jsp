<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="../template/header.jsp">
   <jsp:param value="Order" name="title" />
</jsp:include>
<link href="resources/css/updateProductQuantity.css" media="all" rel="stylesheet" type="text/css"/>
<div class="visual"><img src="resources/images/black.png" alt=""></div>
</header>

<body>
<script type="text/javascript">
	function fn_updateProductQuantity(f) {
		if(confirm('재고를 수정하시겠습니까?')) {
			f.action = 'updateProductQuantity';
			f.submit();
		} else {
			return;
		}
	}
</script>
</head>
<body>
	
	<div class="contents">
		<div class="h-title"><h2>상품 관리(재고 수정)</h2></div>
		<div class="main">
			<div class="content">
				<form>
					<table class="pt" border="1">
						<thead>
							<tr>
								<th>상품번호</th>
								<th>상품이름</th>
								<th>제조회사</th>
								<th>가격</th>
								<th>재고(S)</th>
								<th>재고(M)</th>
								<th>재고(L)</th>
								<th>상품등록일</th>
							</tr>
						</thead>
						<tbody>
								<tr>
									<td>${pDTO.pNo}</td>
									<td>${pDTO.pName}</td>
									<td>${pDTO.pCompany}</td>
									<td><fmt:formatNumber value="${pDTO.pPrice}" pattern="#,##0" /></td>
									<td><input type="text" name="pStock1" value="${pDTO.pStock1}"/></td>
									<td><input type="text" name="pStock2" value="${pDTO.pStock2}"/></td>
									<td><input type="text" name="pStock3" value="${pDTO.pStock3}"/></td>
									<td>${pDTO.pRegdate}</td>
								</tr>
						</tbody>
						<tfoot>
							<tr>
								<td class="button-row" colspan="8"><input id="updateQuantity" type="button" value="재고 수정하기" onclick="fn_updateProductQuantity(this.form)" />
								&nbsp;&nbsp;<input id="deleteProduct" type="button" value="상품 삭제하기" onclick="location.href='productDelete?pNo=${pDTO.pNo}'" />
									<input type="hidden" name="pNo"	value="${pDTO.pNo }" />
									<input type="hidden" name="pStock1"	value="${pStock1 }" />
									<input type="hidden" name="pStock2"	value="${pStock2 }" />
									<input type="hidden" name="pStock3"	value="${pStock3 }" />
								</td>
							</tr>
						</tfoot>
					</table>
				</form>
		</div>
	</div>
	</div>

	
	
</body>
 <%@ include file="../template/footer.jsp" %>
</html>