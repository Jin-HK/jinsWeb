<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

   .wrap_prd {
      overflow: visible;
      position: relative;
   }
   .prodInfo {
      float: left;
   }
   
</style>
</head>
<body>
   
   <!-- 전체페이지박스 -->

            <div class="image_view">
               <div class="bimg">
                  <div class="img">
                     <img alt="메인이미지" src="">
                  </div>
               </div>
               <div class="thumbnail_area">
                  <span class="image_box">
                     <a href="#"><img alt="" src=""></a>
                     <a href="#"><img alt="" src=""></a>
                     <a href="#"><img alt="" src=""></a>
                     <a href="#"><img alt="" src=""></a>
                     <a href="#"><img alt="" src=""></a>
                  </span>
               </div>
            </div>
            <div class="info">
               <form action="">
                  <h3 class="name">${pDTO.pName }</h3>
                  <table class="list">
                     <tbody>
                        <tr>
                           <td>가격</td>
                           <td>${pDTO.pPrice }</td>
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
                     </tbody>
                  </table>
               </form>
            </div>
                  

</body>
</html>