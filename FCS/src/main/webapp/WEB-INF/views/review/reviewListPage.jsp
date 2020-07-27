<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="../template/header.jsp">
   <jsp:param value="회원가입" name="title" />
</jsp:include>
<!-- <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
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
	
	table >img{
		width:150px;
		height:100px;
	}
	#star {
		width:100px;
		height:20px;
		
	}
	.review-write {
		width: 100%;
		margin: auto;
	}
	.review-list {
		width: 60%;
		margin: auto;
		padding: 10px;
	}
	.review-list-table {
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;
		width: 100%;
		margin: auto;
		border-collapse: collapse;
	}
	.review-list-table td {
		padding: 10px;
	}
	.review-list-table tbody td:nth-of-type(1) { width: 25%; border-right: 1px solid lightgray;}
	.review-list-table tbody td:nth-of-type(2) { width: 55%; border-right: 1px solid lightgray;}
	.review-list-table tbody td:nth-of-type(3) { width: 20%; }
	tfoot td { text-align: center; }
	
	#smallSize {
		font-size: 15px;
	}
	
	#button-row {
		text-align: center;
		padding: 10px;
	}
	
	#goMain, #writeReview {
		padding-left: 10px;
    	padding-right: 10px;
		border: 1px solid gray;
    	height: 40px;
    	width: auto;
    	font-size: 17px;
	}
	
	#goMain {
		 background-color: white;
    	border: 1px solid gray;
    	width: auto;
	}
	#writeReview {
		background-color: black;
		color: white;
		font-weight: bold;
    	border: 1px solid gray;
   	 	width: auto;
	}
	#normalReview {
		width: 75%;
		text-align: left;
		border-bottom: 1px solid lightgray;
	}
	#normalContent {
		text-align: center;
		border-right: 1px solid white;
		border-bottom: 1px solid lightgray;
	}
	
	
	
</style>

<div class="visual"><img src="https://ifh.cc/g/aFF3mM.jpg" alt=""></div>
</header>

   <main>
	<div class="wrap">
		<!-- 댓글 목록 창 -->
		<div class="review-list">
			
			<form method="POST">
				<div style="padding-top: 10px; padding-bottom: 10px; font-size: 20px;"><h2>프리미엄 상품평</h2></div>
				<table class="review-list-table">
					<tbody>
						<c:if test="${empty list2 }">
							<tr style="border-bottom: 1px solid lightgray;">
								<td id="smallSize" class="centered" colspan="3">상세리뷰가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty list2 }">
							<c:forEach var="rDTO" items="${list2 }">
								<tr style="border-bottom: 1px solid lightgray;">
									<td><img alt="${rDTO.rFilename }" src="${pageContext.request.contextPath }/resources/storage/${rDTO.rFilename }"></td>
									<td>
										<span id="smallSize" style="font-weight: bold;">${rDTO.rTitle }</span><br><br/>
										<span id="smallSize">${rDTO.rContent }</span>
									</td>
									<td>
										<span id="smallSize">작성자:&nbsp;${rDTO.mId }</span><br/>
										<span id="smallSize">작성일:&nbsp;<fmt:formatDate value="${rDTO.rRegdate }" pattern="yy/MM/dd" /></span><br/>
										<c:if test="${rDTO.rScore eq '1' }">
											<img id="star" alt="fcs" src="resources/images/star1.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '2' }">
											<img id="star" alt="fcs" src="resources/images/star2.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '3' }">
											<img id="star" alt="fcs" src="resources/images/star3.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '4' }">
											<img id="star" alt="fcs" src="resources/images/star4.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '5' }">
											<img id="star" alt="fcs" src="resources/images/star5.jpg">
										</c:if>
										<c:if test="${loginDTO.mId == 'admin' or loginDTO.mId == rDTO.mId }">
												<span id="smallSize"><br><a href="deleteReview?pNo=${pNo }&rNo=${rDTO.rNo}&page2=${page2}&page1=${page1}">리뷰삭제</a></span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					<tfoot>
						<tr>
							<td colspan="3">${pageView2}</td>
						</tr>
					</tfoot>
				</table>
				<br><br><br>
				<div style="padding-top: 10px; padding-bottom: 10px; font-size: 20px;"><h2>일반 상품평</h2></div>				
				<table class="review-list-table">
					<tbody>
						<c:if test="${empty list1 }">
							<tr>
								<td id="smallSize" class="centered" colspan="3">일반리뷰가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${not empty list1 }">
							<c:forEach var="rDTO" items="${list1 }">
								<tr id="normalRow">
									<td id="normalReview">
										<span id="smallSize" style="font-weight: bold;">${rDTO.rTitle }</span><br><br/>
										<span id="smallSize">${rDTO.rContent }</span>
									</td>
									<td id="normalContent">
										<span id="smallSize">작성자:${rDTO.mId }</span><br>
										<span id="smallSize">작성일:<fmt:formatDate value="${rDTO.rRegdate }" pattern="yy/MM/dd" /></span><br>
										<c:if test="${rDTO.rScore eq '1' }">
											<img id="star" alt="fcs" src="resources/images/star1.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '2' }">
											<img id="star" alt="fcs" src="resources/images/star2.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '3' }">
											<img id="star" alt="fcs" src="resources/images/star3.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '4' }">
											<img id="star" alt="fcs" src="resources/images/star4.jpg">
										</c:if>
										<c:if test="${rDTO.rScore eq '5' }">
											<img id="star" alt="fcs" src="resources/images/star5.jpg">
										</c:if>
										<c:if test="${loginDTO.mId == 'admin' or loginDTO.mId == rDTO.mId }">
											<span id="smallSize"><br><a href="deleteReview?pNo=${pNo }&rNo=${rDTO.rNo}&page2=${page2}&page1=${page1}">리뷰삭제</a></span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3">${pageView1}</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
		<div id="button-row">
			<input id="goMain" type="button" value="메인으로 이동" onclick="location.href='index'" />&nbsp;&nbsp;
		</div>
	</div>
	</main>
<%@ include file="../template/footer.jsp" %>