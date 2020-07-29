<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="아이디 찾기" name="title" />
</jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

//AJAX를 통해 아이디를 찾는다
$(document).ready(function(){
   $('#findIdBtn').click(function(){
      $.ajax({
         url: 'findId',
         type: "POST",
         dataType: "text",
         data: 'mEmail='+$('#mEmail').val(),
         success: function(responseText){
            if(responseText.trim() != "NO"){
               $('#findIdResult').text('회원님의 아이디는'+responseText+'입니다.');
               $('#findIdResult').css('color','blue').css('font-weight','bold').css('font-size','20px').css('text-align','center');
            }else{
               $('#findIdResult').text('일치하는 회원 정보가 없습니다');
               $('#findIdResult').css('color','red').css('font-weight','bold').css('font-size','20px').css('text-align','center');
            }
         },
         error: function(){
            alert('AJAX통신이 실패했습니다.')
         }
      });
   });
})
</script>

<div class="visual"><img src="resources/images/black.png" alt=""></div>
</header>
<main>
   <div class="contents">
                <h2 class="h2">FCS 아이디 찾기</h2>
                <p> 본인 인증을 통해 아이디를 찾아 주세요.</p>
                <div id="findIdResult"></div>

                  <div class="content">
            <form method="post">
              
               <table class="login-form">
				<tbody>
                    <tr>						
						<td colspan="2"><input id="mEmail"  class="find-input" type="text" name="mEmail" placeholder="가입 당시 이메일" autofocus></td>
					</tr>							
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
						   <input id="findIdBtn" class="input-btn" type="button" value="아이디찾기" >
							<br><br>                                      
							<input type="button" class="find-btn" value="비밀번호 찾기" onclick="location.href='findPwPage'">&nbsp; |&nbsp;
						<input type="button" class="find-btn" value="로그인하러 가기" onclick="location.href='loginPage'">
						</td>
					</tr>
				</tfoot>
			</table>        
               
            </form>
                      
                      
                      
        </div>

        </div>
</div>
</main>
<%@ include file="../template/footer.jsp" %>






