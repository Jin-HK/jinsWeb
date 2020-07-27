<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" />

<div class="visual"><img src="resources/images/1.jpg" alt=""></div>
</header>
</head>
<body>
	
	<form action="updateCategory">
		<table>
			<caption>카테고리 수정</caption>
			<tbody>
				<tr>
					<td>
						카테고리 번호
					</td>
					<td>
						<input type="text" name="cNo" value="${param.cNo }">
					</td>
				</tr>
				<tr>
					<td>
						카테고리 이름
					</td>
					<td>
						<input type="text" name="cName" value="${param.cName }">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정완료"/>
						<input type="button" value="돌아가기" onclick="history.back()"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
		
<%@ include file="../template/footer.jsp" %>