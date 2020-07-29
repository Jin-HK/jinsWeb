<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp" />
<style>

.btn3 { display: inline-block; width: 120px; height:45px; background: #000; text-align: center; line-height: 45px; color:#fff; font-size: 13px; border: 1px solid black; }
.btn4 { display: inline-block; width: 120px; height:45px; background: #FFF; text-align: center; line-height: 45px; color:#000; font-size: 13px; border: 1px solid black; }
.qna_btn_center2 { text-align: center;  margin: auto; width: 390px; height: 60px; margin-top: 15px;}
td{ border: 1px solid black;}
td:nth-of-type(1){ width: 300px;}
td:nth-of-type(2){width: 300px;	 text-align: center;}
td:nth-of-type(3){width: 150px;}
</style>

<div class="visual"><img src="resources/images/black.png" alt=""></div>


<script type="text/javascript">
	function fn_boardListPage(f) {
		f.action = 'noticeList';
		f.submit();
	}
	// 새 게시글 작성 페이지로 이동
	function fn_boardInsertPage(f) {
		f.action = 'noticeInsertPage';
		f.submit();
	}
	// 검색 결과 보기
	function fn_queryBoardList(f) {
		f.action = 'queryBoardListPage';
		f.submit();
	}
</script>

</header>

<div class="contents">

    	<h2 class="h2">FCS notice</h2>
        <p>Fun하고 Cool 하고 Sexy하게</p>
	
	


	<div class="lefted" style="margin-left: 150px; margin-bottom: 20px;">전체 ${totalRecord}개</div>
	<table style="border: 1px solid black;">
		<thead>
			<tr>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td style="text-align:center;" colspan="4">작성된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="nDTO" items="${list}">
					<tr>
						<td>
							<a href="noticeViewPage?nNo=${nDTO.nNo}&page=${page}">${nDTO.nTitle}</a>
						</td>
						<td>${nDTO.mName}</td>
						<td>${nDTO.nRegdate}</td>
						<td>${nDTO.nHit}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
			
				<td colspan="4">${pageView}</td>
			</tr>
		</tfoot>
	</table>
	</div>
	

<br/><br/>

<div class="qna_btn_center2" >
		<form>
		<!-- 검색 -->
		<select name="column" style="height: 30px;">
			<option value="NTITLE">제목</option>
			<option value="NCONTENT">내용</option>
			<option value="BOTH">제목+내용</option>
		</select>
		<input type="text" name="query" style="width: 200px; height: 30px;"/>
		<input type="button" value="검색"  style="height: 30px; width: 50px;" onclick="fn_queryBoardList(this.form)" />
		
		
		
	</div>
		
	<div class="qna_btn_center" >			
		<!-- 로그인하면 게시글을 작성할 수 있다. -->
		<c:if test="${loginDTO.mId eq 'admin'}">
			<input type="button" class="btn3" value="새 게시글 작성하기" onclick="fn_boardInsertPage(this.form)" />
		</c:if>
		<input type="hidden" name="page" value="${page}" />
		<input type="button" class="btn4" value="전체목록보기" onclick="fn_boardListPage(this.form)" />
	
	</div>
	</form>
</div>

<%@ include file="../template/footer.jsp" %>