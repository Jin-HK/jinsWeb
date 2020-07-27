<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<jsp:include page="../template/header.jsp" />


<div class="visual"><img src="resources/images/qna.jpg" alt=""></div>
</header>

  <style type="text/css">

    
 td{ border:1px solid black; }



   </style>
<main>
<script type="text/javascript">
   // 전체 목록으로 이동
   function fn_boardListPage(f) {
      f.action = 'qnaList';
      f.submit();
   }
   // 새 게시글 작성 페이지로 이동
   function fn_boardInsertPage(f) {
      f.action = 'qnaBoardInsertPage';
      f.submit();
   }
   // 내 게시글 보기
   function fn_myBoardListPage(f) {
      f.action = 'myBoardListPage';
      f.submit();
   }
   function fn_boardViewPage(qPw, qNo, page){
      if(prompt('비밀번호를 입력하세요')==qPw){
         location.href='qnaBoardViewPage?qNo='+qNo+'&page='+page;
      }else{
         alert('비밀번호가 틀렸습니다.');
      }
   }
</script>
</head>
<style>

	td:nth-of-type(2) {
		text-align: center;
}
</style>
<body>



    <div class="contents" >
    	<h2 class="h2">FCS QNA</h2>
        <p>Fun하고 Cool 하고 Sexy하게</p>
        <p style="margin-left: 150px; margin-bottom: 20px;"  >전체 ${totalRecord}개</p>  
 
   <table class="qnalist">
      <thead>
         <tr>
            <td>제목</td>
            <td style="text-align: center;">작성자</td>
            <td>작성일</td>
         </tr>
      </thead>
      <tbody>
         <c:if test="${empty list}">
            <tr>
               <td style="text-align:center;" colspan="3">작성된 게시글이 없습니다.</td>
            </tr>
         </c:if>
         <c:if test="${not empty list}">
            <c:forEach var="qDTO" items="${list}">
               <tr>
                  <td>
                     
                     <!-- 1. 댓글과 원글의 구분을 위하여 bDepth만큼 들여쓰기를 한다. -->
                     <c:forEach begin="1" end="${qDTO.qDepth}" step="1">
                        &nbsp;&nbsp;
                     </c:forEach>
                     
                     <!-- 2. 댓글은 제목 앞에 [Re] 를 붙인다. -->
                     <c:if test="${qDTO.qDepth ne 0 and qDTO.qDelete eq 0}">
                        [Re]&nbsp;
                     </c:if>
                     <c:if test="${qDTO.qDepth ne 0 and qDTO.qDelete eq -1}">
                        <span class="deleted">[Re]&nbsp;</span>
                     </c:if>
                     
                     <!-- 3. 삭제된 게시글은 보여주지 않는다. -->
                     <c:if test="${qDTO.qDelete eq 0}">
                        <c:if test="${qDTO.qPw eq NULL or loginDTO.mId eq 'admin'}">
                           <a href="qnaBoardViewPage?qNo=${qDTO.qNo}&page=${page}">${qDTO.qTitle}</a>
                        </c:if>
                        <c:if test="${qDTO.qPw ne NULL and loginDTO.mId ne 'admin'}">
                           <input type="hidden" name="qPw" value="${qDTO.qPw }">
                           <input type="hidden" name="page" value="${page }">
                           <a href="javascript:void(0);" onclick="fn_boardViewPage(${qDTO.qPw}, ${qDTO.qNo}, ${page});">
                    		    (비밀 글 입니다)
                           </a>
                        </c:if>
                     </c:if>
                     <c:if test="${qDTO.qDelete eq -1}">
                        <c:if test="${loginDTO.mId eq 'admin' }">
                           <span class="deleted"><a href="qnaBoardViewPage?qNo=${qDTO.qNo}&page=${page}">${qDTO.qTitle}(삭제된게시글)</a></span>
                        </c:if>
                        <c:if test="${loginDTO.mId ne 'admin' }">
                           <span class="deleted">삭제된 게시글</span>
                        </c:if>
                     </c:if>
                     
                  </td>
                  <td>${qDTO.mId}</td>
                  <td>${qDTO.qRegdate}</td>
               </tr>
            </c:forEach>
         </c:if>
      </tbody>
      <tfoot>
         <tr>
            <td colspan="3">${pageView}</td>
         </tr>
      </tfoot>
   </table>
</div> <br/><br/>

	<form>   
      <!-- 로그인하면 게시글을 작성할 수 있다. -->
      <input type="hidden" name="pNo" value="${pNo}" />
     <div class="qna_btn_center" > 
      <c:if test="${loginDTO ne null}">      	
         <input type="hidden" name="mId" value="${loginDTO.mId}"/>
         <input type="button" class="btn1" value="새 게시글 작성하기" onclick="fn_boardInsertPage(this.form)" />
         <input type="button" class="btn2" value="내 게시글 보기" onclick="fn_myBoardListPage(this.form)" />    
      </c:if> 
      
      
      <input type="hidden" name="page" value="${page}" />
      <input type="button" class="btn3" value="전체목록보기" onclick="fn_boardListPage(this.form)" />
 	 <input type="button" class="btn4" value="메인으로 가기" onclick="location.href='index'" >
   </div>
   </form>
   



</main>
   <%@ include file="../template/footer.jsp" %>
   
   