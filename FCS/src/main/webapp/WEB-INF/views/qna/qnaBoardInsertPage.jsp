<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp" />
<style>
.qna{width: 600px; height:400px; border:1px solid black; }
td:nth-of-type(1){height: 70px;  }
td:nth-of-type(2){width: 450px; text-align: center; }
tbody tr:nth-child(1){text-align: center; width: 200px;  height: 60px;}
tbody tr:nth-child(2){text-align: center; width: 200px;  height: 60px;}
tbody tr:nth-child(3){text-align: center; width: 200px;  height: 60px;}
    tfoot{text-align: center; width: 200px;  height: 70px;}
    
    
td{ border:1px solid black; }
.btn3 { display: inline-block; width: 120px; height:45px; background: #000; text-align: center; line-height: 45px; color:#fff; font-size: 13px; border: 1px solid black; }
   .text-box{ width: 350; height: 50; font-size: 20px;}    
</style>
<div class="visual"><img src="resources/images/qna.jpg" alt=""></div>

<script type="text/javascript">
	function fn_insertBoard(f) {
		if (f.qTitle.value == '') {
			alert('제목을 입력하세요.');
			f.bTitle.focus();
			return;
		}
		f.action = 'qnaInsertBoard';
		f.submit();
	}
</script>
</header>
<main>


<div class="contents">
<h2 class="h2">FCS 게시글 작성하기</h2>
<div class="contents">
	<form method="POST">
		<table class="qna">
			<tbody>
				<tr>
					<td>작성자</td>
					<td>${loginDTO.mName}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input class="text-box" type="text" name="qTitle" autofocus /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input class="text-box" type="password" name="qPw" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="qContent" rows="15" cols="80" placeholder="내용" style="font-size: 18px;"></textarea>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="hidden" name="pNo" value="${pNo}" />
						<input type="button" class="btn3" value="등록하기" onclick="fn_insertBoard(this.form)" />
						<input type="reset" class="btn3" value="다시작성하기" />
						<input type="button" class="btn3" value="목록으로이동하기" onclick="location.href='qnaList?pNo=${pNo}&page=${page }'" />
						<input type="hidden" name="page" value="${page}" />
						<input type="hidden" name="mId" value="${loginDTO.mId }">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>	
</div>
</main>
<%@ include file="../template/footer.jsp" %>