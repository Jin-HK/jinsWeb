<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp">
	<jsp:param value="회원정보 수정" name="title" />
</jsp:include>
<div class="visual"><img src="resources/images/2.jpg" alt=""></div>
<style>

	table{
		width: 700px;
	}

	.user{
		text-align: center;
		font-size: 30px;
		
	}
	td:nth-of-type(1){width:350px;height: 40px; text-align:center;}
	
	.user-input{
		width: 350px;
		height: 45px;
		margin: 5px;
	}
	
</style>
<script type="text/javascript">
	function fn_memberDelete(f){
		if(confirm('탈퇴시키겠습니까?')){		
			f.action = 'deleteByAdmin';
			f.submit();
		}
	}
	function fn_changePw(f){
		f.action='checkPwPage';
		f.submit();
}
</script>
</header>

<body>
	<div class="contents">
		<h2 class="h2">FCS 관리자 페이지</h2>
	    <p style="font-size: 35px;">회원 정보 관리</p>
	<div class="input_group" >
		<form  class="user" action="updateByAdmin" method="post"  >
			<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" class="user-input" value="${mDTO.mId }" name="mId" readonly></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" class="user-input" value="${mDTO.mName }" name="mName"></td>
				</tr>
				<c:if test="${mDTO.mId ne 'admin' }">
				<tr>
					<td>이메일</td>
					<td> <input type="text" class="user-input" value="${mDTO.mEmail }" name="mEmail" readonly></td>
				</tr>
					<tr style="height: 100px;">
						<td colspan="2"><a href="selectMyOrderList?mId=${mDTO.mId }&mName=${mDTO.mName }" style="font-size: 35px;">구매내역보기</a></td>
					</tr>
				</c:if>
				<c:if test="${mDTO.mId eq 'admin' }">
					<tr>
						<td>이메일</td>
						<td> <input type="text" class="user-input" value="${mDTO.mEmail }" name="mEmail"></td>
					</tr>
					<tr>
						
						<td colspan="2">
							<input class="btn_type2" type="button" value="비밀번호 변경하기" onclick="fn_changePw(this.form)" />
						</td>
					</tr>
				</c:if>
			</tbody>
			</table><br/><br/>			
			
			<div class="btn_center">		
			<input type="hidden" value="${mDTO.mNo }" name="mNo">						
			<input type="submit" class="btn_type2" value="수정하기">
			<c:if test="${mDTO.mId ne 'admin' }">
				<input type="button" class="btn_type2" value="삭제하기" onclick="fn_memberDelete(this.form)">
			</c:if>
			<input type="button" class="btn_type2" value="전체목록보기" onclick="location.href='userManagementPage'">	
			</div>
		</form>
		
	</div>	
	</div>
<%@ include file="../template/footer.jsp" %>

