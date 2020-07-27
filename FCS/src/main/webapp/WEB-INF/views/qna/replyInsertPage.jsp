<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp" />
<div class="visual"><img src="resources/images/qna.jpg" alt=""></div>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   function fn_replyInsert(f) {
      if (f.qTitle.value == '') {
         alert('제목을 입력하세요.');
         f.qTitle.focus();
         return;
      }
      f.action = 'replyInsert';
      f.submit();
   }
</script>
</header>
<body>

    <div class="contents" >
       <h2 class="h2">FCS QNA</h2>
       
<div class="content">

   <form method="POST">
      <table>
         <thead>
            <tr>
               <td colspan="2">새 게시글 작성</td>
            </tr>
         </thead>
         <tbody>
            <tr>
               <td>작성자</td>
               <td>${loginDTO.mName}</td>
            </tr>
            <tr>
               <td>제목</td>
               <td><input type="text" style="width: 250px; height: 30px;" name="qTitle" autofocus /></td>
            </tr>
            <tr>
               <td>비밀번호</td>
               <td><input type="password" style="width: 250px; height: 30px;"  name="qPw" /></td>
            </tr>
            <tr>
               <td colspan="2">
                  <textarea name="qContent" rows="10" cols="80" placeholder="내용"></textarea>
               </td>
            </tr>
         </tbody>
      </table>
      <br/><br/>
      <div class="btn_center">
      <input type="button" class="btn3" value="답글등록하기" onclick="fn_replyInsert(this.form)" />
      <input type="reset" class="btn4" value="다시작성하기" />
      <input type="button" class="btn4" value="목록으로이동하기" onclick="location.href='qnaList?page=${page}&pNo=${pNo }'" />
                  
      <input type="hidden" name="page" value="${page}" />
      <input type="hidden" name="pNo" value="${pNo}" />
      <input type="hidden" name="mId" value="${loginDTO.mId }"><!-- 작성자 -->
      <input type="hidden" name="qNo" value="${param.qNo }"> <!-- 댓글이 달리는 게시글의 번호 -->
      
   </div>   
   </form>
</div>
</div>
  <%@ include file="../template/footer.jsp" %>