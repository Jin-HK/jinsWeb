<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" />

<div class="visual"><img src="resources/images/1.jpg" alt=""></div>
<link href="resources/css/updateProductInfo.css" media="all" rel="stylesheet" type="text/css"/>
</header>
</head>
<body>
<script type="text/javascript">

	function fn_productUpdate(f){
		if(f.pThumbnail.value !='' && f.pFilename.value != ''){
			f.action = 'productUpdate';
			f.submit();
			
			
		}else if(f.pThumbnail.value != ''){
			f.action = 'productThumbnailUpdate';
			f.submit();
		}else if(f.pFilename.value != ''){
			f.action = 'productDetailImageUpdate';
			f.submit();
			
			
		}else{
			f.action = 'productUpdateWithNoImage';
			f.submit();
			
		}
	}
	function fn_productDelete(f){
		if(confirm('정말 삭제하시겠습니까?')){
			f.action = 'productDelete';
			f.submit();
		}else{
			return;
		}
	}

</script>
<div class="wrap">
	<form method="post" enctype="multipart/form-data">
		<div class="prod-info">
			<div class="h-title"><h2>상품 정보 수정</h2></div>
			<div class="infoTableBox">
				<div class="infoTable">
					<table class="if-tb">
						<tbody>
							<tr>
								<td class="colName">
									상품번호							
								</td>
								<td class="colValue">
									${pDTO.pNo }
								</td>
							</tr>
							<tr>
								<td class="colName">상품이름</td>
								<td class="colValue"><input type="text" name="pName" value="${pDTO.pName }"/></td>
							</tr>
							<tr>
								<td class="colName">상품가격</td>
								<td class="colValue"><input type="text" name="pPrice" value="${pDTO.pPrice }"/></td>
							</tr>
							<tr>
								<td class="colName">카테고리분류</td>
								<td class="colValue"><input type="text" name="pCategory" value="${pDTO.pCategory }"/></td>
							</tr>
							<tr>
								<td class="colName">상품성별</td>
								<td class="colValue">남<input type="radio" name="pGender" value="1"/>&nbsp;&nbsp;여<input type="radio" name="pGender" value="2"/>
								&nbsp;&nbsp;공용<input type="radio" name="pGender" value="3" checked/></td>
							</tr>
							<tr>
								<td class="colName">제조회사</td>
								<td class="colValue">
									<select id="select" name="pCompany">
										<option value="ROGUE">ROGUE</option>
										<option value="NOIR">NOIR</option>
										<option value="BLANC">BLANC</option>
										<option value="VERT">VERT</option>
										<option value="ARGENT">ARGENT</option>
									</select>
								</td>
							</tr>
							<tr>
								<td class="colName">썸네일이미지</td>
								<td class="colValue">${pDTO.pThumbnail }<input type="file" name="pThumbnail"/></td>
							</tr>
							<tr>
								<td class="colName">제품상세이미지</td>
								<td class="colValue">${pDTO.pFilename }<input type="file" name="pFilename"/></td>
							</tr>
							<tr>
								<td class="colName">상품 설명</td>
								<td class="colValue"><textarea name="pDescription" rows="5" cols="50" >${pDTO.pDescription }</textarea></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<td class="button-row" colspan="2">
									<input type="hidden" name="pNo" value="${pDTO.pNo }"/>
									<input type="hidden" name="pStock1" value="${pDTO.pStock1}"/>
									<input type="hidden" name="pStock2" value="${pDTO.pStock2}"/>
									<input type="hidden" name="pStock3" value="${pDTO.pStock3}"/>
									<input id="updateButton" type="button" value="수정하기" onclick="fn_productUpdate(this.form)"/>
									<input id="cancelButton" type="button" value="돌아가기" onclick="history.back()"/>
									<input id="deleteButton" type="button" value="제품 삭제하기" onclick="fn_productDelete(this.form)"/>
								</td>
							</tr>
						</tfoot>
				</table>
			</div>
		</div>
	</div>	
</form>
</div>
<%@ include file="../template/footer.jsp" %>