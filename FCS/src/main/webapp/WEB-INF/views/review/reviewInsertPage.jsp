<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<jsp:include page="../template/header.jsp">
   <jsp:param value="리뷰작성" name="title" />
</jsp:include>

<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="resources/js/star-rating.js" type="text/javascript"></script>

<script type="text/javascript">
	function fn_insert(f){
		if(f.file.value==''){		
			f.action = 'insertReview';
		}else{
			f.action = 'insertReviewWithImage';
		}
		if(f.rScore.value == ''){
			alert('별점을 입력하세요');
			return;
		}
		f.submit();
	}
</script>
<script>
$(document).ready(function(){
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  document.getElementById("rScore").innerHTML = '';
		  return false;
		});
});
jQuery(document).ready(function () {
    $('.rb-rating').rating({
        'showCaption': false,
        'stars': '5',
        'min': '0',
        'max': '5',
        'step': '1',
        'size': 'xs',
    });
});
</script>
<style type="text/css">
	* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	.review-write {
		width: 100%;
		margin: auto;
	}
	tfoot td { text-align: center; }
</style>
<div class="visual"><img src="resources/images/black.png" alt=""></div>
</header>
<main>
   
	<div class="review-write">
		<form method="POST" enctype="multipart/form-data">
		<input type="hidden" name="pNo" value="${pNo }" />
		<input type="hidden" name="mId" value="${loginDTO.mId }"/><br/>
		<table>
			<tbody>
			<tr>
				<td>별점</td>
				<td><input required class="rb-rating" type="text" value="1" title="" name="rScore"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${loginDTO.mId }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="rTitle"></td>
			</tr>
			<tr>	
				<td>상품평</td>
				<td><textarea name="rContent" rows="2" cols="50"></textarea></td>
			</tr>
			<tr>
				<td>사진첨부</td>
				<td><input type="file" name="file"></td>
			</tr>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="2">
					<input class="btn_type1" type="button" value="리뷰 등록하기" onclick="fn_insert(this.form)">
					<input class="btn_type2" type="reset" value="다시 작성하기">
				</td>
			</tr>
			</tfoot>
		</table>
		</form>
	</div>
 <%@ include file="../template/footer.jsp" %>






