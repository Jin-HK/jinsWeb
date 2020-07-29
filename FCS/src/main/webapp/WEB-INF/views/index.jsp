<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="./template/header.jsp" />

<div class="visual"><img src="resources/images/black.png" alt=""></div>
</header>
<!-- 헤더영역 끝 -->
<!-- 본문영역 -->
<main>
	<div class="contents" style=" height: 1500px; width: 1500px;" >
		<h2	class="h2">FCS 이달의 신상</h2>
	   <div class="content" style=" height: 1200px;" > 
			<section class="info_box" style=" height: 1000px;" >
				<ul class="clear">
				<c:forEach var="pDTO" items="${list}" begin="0" end="7" step="1">
				<li>
					<a href="productDetailViewPage?pNo=${pDTO.pNo }">
						<em style="height:190px"><img src="${pageContext.request.contextPath}/resources/storage/${pDTO.pThumbnail}" alt="${pDTO.pThumbnail}"></em>
						<div>
							<h3>${pDTO.pName}</h3>
							<p>
								${pDTO.pDescription}
								
							</p>
							
							<div><fmt:formatNumber value="${pDTO.pPrice }" pattern="#,##0" />원</div>
						</div>
					</a>
				</li>
				</c:forEach>
	                
				</ul>
			</section>
			<section class="guide_box clear"  >
				<article class="guide">
					<h2>고객<br>가이드</h2>
					<ul>
					<li><a href="">고객문의</a></li>
					<li><a href="">FAQ</a></li>
					<li><a href="">이벤트</a></li>
					<li><a href="noticeList">공지사항</a></li>
					</ul>
				</article>
				<article class="phone">
					<div>
						<h2>문의전화</h2>
						<span>02.123.4567</span>
					</div>
					<div>
						<h2>평일</h2>
						<p>AM 09:00 ~ PM 06:00</p>
						<div>(토, 일, 공휴일 휴무)</div>
					</div>
				</article>
			</section>
		<!-- </div> -->
	</div>
</main>
		
	<!-- <a href="listPage">공지사항</a>
	<h3><a href="qnaList?pNo=10000">상품문의 게시판</a></h3> -->
	
	<%@ include file="./template/footer.jsp" %>
	
	