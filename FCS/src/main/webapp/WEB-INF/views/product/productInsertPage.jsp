<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp" />
<style>



    tr{
        height: 50px;
    }
    
    td{
        font-size: 20px;
         border-bottom: 1px solid lightgray;
       
    }
    
  
    

    .input-box{
        height: 18px; 
        width: 250px;
    }
.upload{
        height: 25px; 
        width: 250px;
    }
    td:nth-of-type(1){
        width: 400px;
        text-align: center;
    }
    
    table{
        margin: auto;
        border-collapse: collapse; 
           border-top: 1px solid lightgray;
    }

    .h22 { position: relative; padding: 55px 0 53px; font-size: 36px; color:#222; line-height: 100%; text-align: center; } 

</style>
<div class="visual"><img src="resources/images/beads.jpg" alt=""></div>
</header>
<body>
<script type="text/javascript">

	function fn_productInsert(f){
		
		/* if(f.pThumbnail.value =='' && f.pFilename.value == ''){
			alert('상품 이미지 또는 상세이미지를 업로드하시기 바랍니다.');
			return;
			
		} else if(f.pThumbnail.value != '' && f.pFilename.value == ''){
			f.action = 'insertProductWithNoDetailImage';
			f.submit();
		}else if(f.pFilename.value != '' && f.pThumbnail.value == ''){
			f.action = 'insertProductWithNoThumbnail';
			f.submit();
		} else{
			f.action = 'productInsert';
			f.submit();
		} */
		 if(f.pThumbnail.value !='' && f.pFilename.value != ''){
			f.action = 'productInsert';
			f.submit();
		} else if(f.pThumbnail.value != ''){
			f.action = 'insertProductWithNoDetailImage';
			f.submit();
		}else if(f.pFilename.value != ''){
			f.action = 'insertProductWithNoThumbnail';
			f.submit();
		}else{
			alert('상품 이미지 또는 상세이미지를 업로드하시기 바랍니다.');
			return;
		}
	}

</script>
	<form method="post" enctype="multipart/form-data">
	
	 <div class="contents">
            <h2 class="h22">FCS 상품등록하기</h2>
          
        
          <div class="input_group">
                   <form id='f'  method="POST">
                       <table class="input_type" >
                           <colgroup>
                               <col width="170px">
                               <col width="*">
                           </colgroup>
                           <tbody>
                              <tr>
               <td>상품이름</td>
               <td>
                 <input type="text" class="input-box" name="pName"/>
                 
               </td>
            </tr>
            <tr>
               <td>상품가격</td>
               <td>
                  <input type="text" class="input-box" name="pPrice"/>
               </td>
            </tr>
            <tr>
               <td>제품카테고리</td>
               <td>
                <input type="text" class="input-box" name="pCategory"/>
                  
               </td>
            </tr> 
            <tr>
               <td>상품성별</td>
               <td>남<input type="radio" name="pGender" value="1"/>
                    여<input type="radio" name="pGender" value="2"/>
                   공용<input type="radio" name="pGender" value="3" checked/>
                </td>
            </tr>
            <tr>
               <td>상품제조회사</td>
               <td><input type="text" class="input-box" name="pCompany"/></td>
            </tr>
           <tr>
               <td>썸네일이미지</td>
               <td>
                  <input type="file" class="upload"  name="pThumbnail"/>            
               </td>
            </tr>
            <tr>
               <td>제품상세이미지</td>
               <td>
                  <input type="file" class="upload" name="pFilename"/>              
               </td>
            </tr>
            <tr>
               <td>S사이즈 재고</td>
               <td>
                    <input type="text" class="input-box" name="pStock1"/> 
               </td>
            </tr>
              <tr>
               <td>M사이즈 재고</td>
               <td>
                    <input type="text" class="input-box" name="pStock2"/> 
               </td>
            </tr>
              <tr>
               <td>L사이즈 재고</td>
               <td>
                    <input type="text" class="input-box" name="pStock3"/> 
               </td>
            </tr>
              <tr>
               <td>상품설명</td>
               <td>
                     <textarea rows="10" cols="50" name="pDescription"></textarea>
               </td>
            </tr>
    		 </tbody>
                
   </table>
   			<br/><br/>
           <div class="btn_center" >            
            <input type="button" value="제품 등록하기"  class="btn_type2" onclick="fn_productInsert(this.form)"/>
        
        </div>
                </div>
                        </div>
        </form>
</body>
<%@ include file="../template/footer.jsp" %>
</html>