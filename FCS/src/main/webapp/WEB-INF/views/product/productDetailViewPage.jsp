<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../template/header.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    @charset "utf-8";

body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,form,fieldset,p,button,table,th,td,pre{margin:0;padding:0;}
body,div,dl,dt,dd,h1,h2,h3,h4,h5,h6,form,fieldset,p,th,td,input,textarea,select,button,pre,a{font-family:'Nanum Gothic', sans-serif; font-size:16px; color:#222;}

textarea { width:100%;}
select,input,img, button {vertical-align:middle;}
ul, ol {list-style-type:none; }
.hide,legend,hr,caption span {position:absolute; left:-3000%;}
em, address { font-style:normal;}
 table { border-collapse:collapse; border-spacing:0; width:100%;} 
a { color:#666; text-decoration:none;}
a:focus,
a:hover { text-decoration:none;}
fieldset, img, button{border:0;}

input[type=text]::-ms-clear {display: none;}

select { padding:0 0 0 5px; height:38px; border:1px solid #e3e3e3;}
textarea,
input[type="file"],
input[type="password"],
input[type="text"] { text-indent:4px; border:1px solid #ccc;}
 
select:focus, textarea:focus,
input[type="password"]:focus,
input[type="file"]:focus,
input[type="text"]:focus { border:1px solid #555;}
 
textarea[readonly="readonly"],
button[readonly="readonly"],
select[readonly="readonly"],
input[readonly="readonly"],
 
textarea[disabled="disabled"],
button[disabled="disabled"],
select[disabled="disabled"],
input[disabled="disabled"] { background:#f5f5f5; border-color:#d4d4d4;}
 
input[type="password"],
input[type="file"],
input[type="text"] { height:34px; line-height:34px;}
input[type="file"] { width:100%;}
input[type="radio"] { vertical-align:text-bottom;}
 
.clear { zoom:1;clear:both;}
.clear:after { content:""; display:block; clear:both;}

.skip { position:absolute; left:0; top:-100px; z-index:1000; width:100%; height:60px; line-height:60px; text-align:center; font-size:20px; color:#fff; transition:all 0.5s; background:#666;}
.skip:focus { top:0;}

    @charset "utf-8";


.product_view { position: relative;padding: 0 0 0 395px; width: 962px; box-sizing: border-box;}
.product_view .img { position: absolute; left: 0; top: 0;}
.product_view .img > img { width: 368px; height: 370px; border:1px solid #e8e8e8; }
.product_view .img li:after { content: ""; display: block; clear: both;}
.product_view .img li { float: left; padding: 10px 10px 0 0;}
.product_view .img li.on img { border-color:#0a56a9;}
.product_view .img li img { width: 68px; height: 68px; border:1px solid #e8e8e8;}
.product_view h2 { margin: 0 0 15px; padding: 0 0 20px; border-bottom:2px solid #333; font-size:24px; color:#232323; line-height: 26px;}
.product_view table th,
.product_view table td { padding:14px 0; font-size: 15px; color:#444; text-align: left;}
.product_view table td.price { font-size: 22px;}
.product_view table td.total { font-size:19px; color:#0a56a9;}
.product_view table td.total b { font-size: 22px;}
.product_view table .length { position: relative; width: 71px; height: 32px; border:1px solid #c6c6c6;}
.product_view table .length input { width:44px; height: 30px; border:none;border-right:1px solid #c6c6c6; text-align:center; }
.product_view table .length a { overflow: hidden;position: absolute; right: 0; width: 26px; height: 16px; color:transparent;}
.product_view table .length a:nth-of-type(1) {  top: 0;background: url("../images/ico_up.png") no-repeat center;}
.product_view table .length a:nth-of-type(2) { bottom:0; background: url("../images/ico_down.png") no-repeat center; border-top:1px solid #c6c6c6;}
.product_view table select { width:100%; border:1px solid #c6c6c6; box-sizing: border-box;  background: url("../images/ico_select.png") no-repeat right 11px center;appearance:none; -webkit-appearance:none; -moz-appearance:none;}
.product_view table select::-ms-expand { display: none;}
.product_view .btns { padding: 45px 0 0; text-align: center;}
.product_view .btns > a { display: inline-block; width: 136px; height: 42px;border-radius: 2px; font-size: 16px; color:#fff; line-height: 42px; }
.product_view .btns > a.btn1 { background: #666;}
.product_view .btns > a.btn2 { background: #0a56a9;}

.side-menu {
         
      position: fixed;
      right: 20px;
      width: 150px;
      height: 250px;
      text-align: center;
        border: 1px solid black;
   
   }

        .asd{
           height:auto;
           width:auto;         
            font-size: 20px;          
            background: white;
         border: white solid 1px;
        }
        
        
      .asdf:active{
      border: black solid 1px;
      
      }
      
      .description-footer{
      	display: inline;
      	position:relative;
         	
      }
      #description{
      	text-align:center;
      	
      }

 *:focus { outline:none; }

td:nth-of-type(1){
      width:250px;
      
      
      
   }
   #thumbnail{
   	width: 350px;
   	margin: auto;
   }
   #filename{
   	width: 600px;
   	margin-top: 50px;
   }
	
	#prod_info{
		margin: auto;
		text-align: center;
		width: 800px;
	}
	
</style>

<div class="visual"><img src="resources/images/beads.jpg" alt=""></div>
</header>

   
<script type="text/javascript">
         function fn_totalPrice(f){
            var price = '${pDTO.pPrice}';
            var total = document.querySelector('#total');
            if(f.cartQuantity.value < 0){
            	alert('숫자는 0보다 큰 숫자를 입력해 주세요.');
            	f.cartQuantity.value = 1;
            }
            if(f.cartQuantity.value > 0){
               total.innerHTML = (f.cartQuantity.value * price) + '원';
            }
            else if(f.cartQuantity.value == 0){
               total.innerHTML = '숫자는 0보다 큰 숫자를 입력해 주세요.';
            }
         }
         /* function fn_countUp(f){
            f.cartQuantity.value = f.cartQuantity.value - 1 + 2;
            fn_totalPrice(f);
         }
         function fn_countDown(f){
            if(f.cartQuantity.value > 1){
               f.cartQuantity.value = f.cartQuantity.value - 1;
               fn_totalPrice(f);
            }
         } */
         function fn_directOrder(f){
            var stock = 0;
            if(confirm('주문하시겠습니까?')){
               switch(f.cSize.value){
               case 'S':
                  stock = '${pDTO.pStock1}';
                  break;
               case 'M':
                  stock = '${pDTO.pStock2}';
                  break;
               case 'L':
                  stock = '${pDTO.pStock3}';
                  break;
               }
               if(f.cartQuantity.value <= 0){
                  alert('주문수량은 0보다 큰 숫자를 입력해 주세요.');
                  return;
               }
               if(f.cartQuantity.value > stock){
                  alert('재고수량보다 많이 주문할 수 없습니다. (현재 재고 : ' + stock + '개)');
                  return;
               }
               f.action = 'orderPage';
               f.submit();
            }
         }
         
         function fn_addCartList(f){
            var stock = 0;
            if(confirm('장바구니에 추가하시겠습니까?')){
               switch(f.cSize.value){
               case 'S':
                  stock = '${pDTO.pStock1}';
                  break;
               case 'M':
                  stock = '${pDTO.pStock2}';
                  break;
               case 'L':
                  stock = '${pDTO.pStock3}';
                  break;
               }
               if(f.cartQuantity.value <= 0){
                  alert('주문수량은 0보다 큰 숫자를 입력해 주세요.');
                  return;
               }
               if(f.cartQuantity.value > stock){
                  alert('재고수량보다 많이 주문할 수 없습니다. (현재 재고 : ' + stock + '개)');
                  return;
               }
               f.action = 'cartInsert';
               f.submit();
               
            }
         }
         function fn_goLoginPage(f){
            alert('로그인 후 구매 가능합니다.');
            f.action = 'loginPage';
            f.submit();
         }
         
         function fn_selectProductList(f){
            f.action = 'selectProductList';
            f.submit();
         }
         
         
         $(document).ready(function(){
        	 $(window).resize(function(){
        		 var w = $(window).innerWidth()/2;
	             if($(window).innerWidth() <= 1150) {
	                 $('.side-menu').css('right',(w-550)+'px');
	             }else{
	                 $('.side-menu').css('right','20px');            	 
	             }
        	 });
         });
         $(window).scroll(function(){
        	 var h = 450;
		     let top = $(window).scrollTop();
           	 if($(window).scrollTop()<400){
            	 $('.side-menu').css('top',(h-top)+'px'); 
             }else{
            	 $('.side-menu').css('top','10%');
             }
         });


         
</script>
   
   <!-- 전체페이지박스 -->
<div class="contents" style=" height: auto;">
   
   
<div class="content" style=" height: auto;">
<form>
	<table id="prod_info" >
		<tr>
			<td rowspan="11">
				<img id="thumbnail" style="display: block"src="${pageContext.request.contextPath}/resources/storage/${pDTO.pThumbnail}" alt="Thumbnail">
			</td>
			<td colspan="2">
				<h2 class="h2" style="text-align: center; ">${pDTO.pName }</h2>
			</td>
		</tr>
			<tr>
                     <td>가격</td>
                     <td>${pDTO.pPrice }원</td>
                  </tr>
                  <tr>
                     <td>브랜드</td>
                     <td>${pDTO.pCompany }</td>
                  </tr>
                  <tr>
                     <td>S사이즈 재고</td>
                     <td>${pDTO.pStock1 }개</td>
                  </tr>
                  <tr>
                     <td>M사이즈 재고</td>
                     <td>${pDTO.pStock2 }개</td>
                  </tr>
                  <tr>
                     <td>L사이즈 재고</td>
                     <td>${pDTO.pStock3 }개</td>
                  </tr>
                  <tr>
                     <td>상품등록일</td>
                     <td>${pDTO.pRegdate }</td>
                  </tr>
                  <tr>
                     <td>사이즈 선택</td>
                     <td>
                        <select name="cSize">
                           <option value="S">S</option>
                           <option value="M">M</option>
                           <option value="L">L</option>
                        </select>
                     </td>
                  </tr>   
                  <tr>   
                        
                        <td>구매 수량</td>
                        <td><input type="text" name="cartQuantity" value="1" onkeyup="fn_totalPrice(this.form)"/>
                        <!-- <input type="button" value="+" onclick="fn_countUp(this.form)"/>
                        <input type="button" value="-" onclick="fn_countDown(this.form)"/> -->
                        <input type="hidden" name="pNo" value="${pDTO.pNo }"/>
                        <input type="hidden" name="mId" value="${loginDTO.mId }"/>

                     

                        <input type="hidden" name="var" value="${var }" />
                          <c:choose>
                          <c:when test="${param.var eq 'pCompany' }">
                             <input type="hidden" name="value" value="${pDTO.pCompany }" />
                          </c:when>
                          <c:when test="${param.var eq 'pCategory' }">
                             <input type="hidden" name="value" value="${pDTO.pCategory }" />
                          </c:when>
                          </c:choose>
                        <input type="hidden" name="pGender" value="${pDTO.pGender}"/>
                        <input type="hidden" name="pCategory" value="${pDTO.pCategory}"/>
                        
                        <input type="hidden" name="pInfo" value="productDetailViewPage?pNo=${pDTO.pNo}">
                        <input type="hidden" name="pPrice" value="${pDTO.pPrice }">
                     </td>
                  </tr>
                  <tr>
                  	<td colspan="2" style="font-size: 20px;">
                  		<br>총 금액 : <span id="total">${pDTO.pPrice }원</span><br>
                  	</td>
                  </tr>
                  <tr>
                     <td colspan="3" style="padding-top: 20px;">
                        <c:if test="${not empty loginDTO }">
                           <input type="button" class="btn3" style="width: 200px;" value="주문하기" onclick="fn_directOrder(this.form)"/>
                        </c:if>
                        <c:if test="${empty loginDTO }">
                           <input type="button" class="btn3" style="width: 200px;" value="주문하기" onclick="fn_goLoginPage(this.form)"/>
                        </c:if>
                        <c:if test="${not empty loginDTO }">
                           <input type="button" class="btn4" style="width: 200px;" value="장바구니에 담기" onclick="fn_addCartList(this.form)"/>
                        </c:if>
                        <c:if test="${empty loginDTO }">
                           <input type="button" class="btn4" style="width: 200px;" value="장바구니에 담기" onclick="fn_goLoginPage(this.form)"/>
                        </c:if>
                     </td>
                  </tr>
		<tr>
			<td colspan="3">
				<img id="filename" style="width: 800px"alt="제품 상세 이미지" src="${pageContext.request.contextPath}/resources/storage/${pDTO.pFilename}">
			</td>
		</tr>
	</table>
            
       <div class="side-menu">
            <table>
                <tr>
                    <td ><a class="asdf" href="#header">TOP</a></td>
                </tr>
                <%-- <tr>
                    <td><br><a href='productListPage?pCategory=${pDTO.pCategory}&page=${page}'>목록으로 이동</a></td>                  
                </tr> --%>
                 <tr>
                    <td><br><a class="asdf" href='reviewList?pNo=${pDTO.pNo }'>리뷰 보기</a></td>                  
                </tr>
                 <tr>
                    <td><br><a class="asdf" href='qnaList?pNo=${pDTO.pNo }'>상품문의 보기</a></td>                  
                </tr>
            
            </table>
         
       </div>         
</form>
</div>
  </div>  
 
    
	<%@ include file="../template/footer.jsp" %>
