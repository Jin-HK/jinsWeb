<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!Doctype html>
<jsp:include page="../template/header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fn_boardDelete(f){
		f.action = 'noticeDelete';
		f.submit();
	}
	
	
</script>

<style>


	tr , td{
		font-size: 22px;
	
	}

	pre{
		font-size:50px;
		text-align: left;
		white-space: normal;
		
		display: inherit;
	}
	
</style>

<div class="visual"><img src="resources/images/qna.jpg" alt=""></div>
</header>

<body>

<div class="contents">

	<h2 class="h2">${nDTO.nNo }번 게시물</h2>
	
	<div class="content">
		<form method="POST">
			<table >
				<tbody>
					<tr style="border-bottom: 1px solid black;">
						<td>작성자</td>
						<td>${nDTO.mName}</td>
					</tr>
					<tr style="border-bottom: 1px solid black;">
						<td>제목</td>
						<td>${nDTO.nTitle }</td>
					</tr>
					<tr style="border-bottom: 1px solid black;">
						<td>작성일</td>
						<td>${nDTO.nRegdate }</td>
					</tr>
					<tr style="border-bottom: 1px solid black;">
						<td>조회수</td>
						<td>${nDTO.nHit }</td>
					</tr>
					<tr >
						<td colspan="2" >
							<pre style="width: 900px; height: 300px; font-size:25px; border: 1px solid black; margin: auto; ">${nDTO.nContent }</pre>
						</td>
					</tr>
				</tbody>
				
				
			</table>
			<div class="btn_center" style="margin-top: 50px;">
              <input type="button" class="btn3"  value="목록으로이동하기" onclick="location.href='noticeList?page=${page}'" />
							<c:if test="${loginDTO.mId eq 'admin' }">
								<input type="button" class="btn4" value="삭제하기" onclick="fn_boardDelete(this.form)">
							</c:if>
							<input type="hidden" name="page" value="${page}" />
							<input type="hidden" name="nNo" value="${param.nNo }">
            </div>
				
			
		</form>
	</div>
</div>


<%@ include file="../template/footer.jsp" %>