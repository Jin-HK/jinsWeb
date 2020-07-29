<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp">
	<jsp:param value="로그인" name="title" />
</jsp:include>
<style>
	
	td:nth-of-type(2){width:350px;height: 40px; text-align:center;}
	td:nth-of-type(3){width:350px;height: 40px; text-align:center;}
	td:nth-of-type(4){width:350px;height: 40px; text-align:center;}
	tbody tr:nth-child(1) { background-color: black; height: 60px; color: white; font-size: 40px;}
</style>

<div class="visual"><img src="resources/images/black.png" alt=""></div>
</header>
<main>
	  
	<div class="contents" >
	 <h2 class="h2">FCS 관리자 페이지</h2>
     <p style="font-size: 35px;">사이트 관리</p>
     <p style="font-size: 20px; text-align:center;"><a href="memberViewPage?mNo=${loginDTO.mNo }">관리자 정보 변경</a></p>
		<div class="content">
			<table border="1">
				<tr>
					<td>번호</td>
					<td>아이디</td>
					<td>이름</td>
					<td>탈퇴여부</td>
				</tr>
				<c:forEach var="mDTO" items="${list }">
					<tr>
						<td>${mDTO.mNo }</td>
						<c:if test="${mDTO.mValidate eq '0' }">
							<td><a href="memberViewPage?mNo=${mDTO.mNo }">${mDTO.mId }</a></td>
						</c:if>
						<c:if test="${mDTO.mValidate eq '1' }">
							<td>${mDTO.mId }</td>
						</c:if>
						<td>${mDTO.mName }</td>
						<td>${mDTO.mValidate == '1' ? 'O' : 'X' }
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</main>	
<%@ include file="../template/footer.jsp" %>