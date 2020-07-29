<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function fn_replyInsertPage(f){
		f.action = 'replyInsertPage';
		f.submit();
	}
	
	function fn_boardDelete(f){
		var qPw = '${qDTO.qPw}';
		var mId = '${loginDTO.mId}';
		if(mId == 'admin'){
			f.action = 'qnaBoardDelete';
			f.submit();
		}else{
			if(f.qPw.value==''){
				alert('삭제 비밀번호를 입력하세요.');
				f.qPw.focus();
				return;
			}
			if(f.qPw.value != qPw){
				alert('삭제 비밀번호를 확인하세요.');
				return;
			}
			f.action = 'qnaBoardDelete';
			f.submit();
		}
	}
	
	
</script>
<style>

	td:nth-last-child(4) {
		background: black;
}

	
</style>
<div class="visual"><img src="resources/images/black.png" alt=""></div>
</header>
<body>
<div class="contents">
	
	<h2 class="h2">${qDTO.qNo }번 게시물</h2>
<div class="content">
	<form method="POST">
		<table style="border:1px solid black; ">
			<tbody>
				<tr style="border-bottom: 1px solid black;">
					<td>작성자</td>
					<td>${qDTO.mId}</td>
				</tr>
				<tr style="border-bottom: 1px solid black;">
					<td>제목</td>
					<td>${qDTO.qTitle }</td>
				</tr>
				<tr >
					<td>작성일</td>
					<td>${qDTO.qRegdate }</td>
				</tr>
				<tr >
					<td colspan="2" style="font-size: 19px;" >
						<pre style="width: 900px; height: 300px; font-size:18px; border: 1px solid black; margin: auto;">${qDTO.qContent }</pre>
					</td>
				</tr>
			
			
				<tr >
					<td colspan="2">
						
					</td>
				</tr>
			</tbody>
		</table>
	<div class="btn_center" style="margin-top: 50px;">
	<!-- 로그인을 해야만 글을 쓸 수 있다. 원글에만 댓글을 달 수 있다. -->
						<c:if test="${loginDTO.mId eq 'admin' and qDTO.qDepth eq 0 }">
							<input type="button" class="btn4" value="답글달기" onclick="fn_replyInsertPage(this.form)">
						</c:if>
						<input type="button" class="btn4" value="목록으로이동하기" onclick="location.href='qnaList?pNo=${qDTO.pNo}&page=${page}'" />
						<!-- 로그인을 해야만 글을 삭제할 수 있다. -->
						<c:if test="${loginDTO ne null }">
							<input type="button" class="btn4" value="삭제하기" onclick="fn_boardDelete(this.form)">
							삭제비밀번호 <input type="password" name="qPw" size="5">
						</c:if>
						<input type="hidden" name="pNo" value="${qDTO.pNo }">
						<input type="hidden" name="page" value="${page}" />
						<input type="hidden" name="qNo" value="${param.qNo }">
	 </div>
	</form>
</div>
</div>

<%@ include file="../template/footer.jsp" %>