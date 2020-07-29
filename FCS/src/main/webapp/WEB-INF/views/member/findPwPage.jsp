<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="비밀번호 찾기" name="title" />
</jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	function findPw(f){
		if(f.mId.value==''){
			alert('아이디를 입력하세요.');
			f.mId.focus();
			return false;
		}
		if(f.mEmail.value==''){
			alert('이메일을 입력하세요.');
			f.mEmail.focus();
			return false;
		}
		f.action="emailAuth";
		f.submit();
	}
	
</script>
<div class="visual"><img src="resources/images/black.png" alt=""></div>
</header>

    <main>
	
            <div class="contents">
                <h2 class="h2">FCS 비밀번호 찾기</h2>
                <p> 가입하신 아이디와 이메일을 입력해 주세요.</p>

                  <div class="content">
            <form method="post">
              
               <table class="login-form">
				<tbody>
                    <tr>				
                        <td colspan="2"><input id="mId" class="find-input" type="text" name="mId" placeholder="아이디"  autofocus /></td>
                    </tr>              
                    <tr>						
						<td colspan="2"><input id="mEmail"  class="find-input" type="text" name="mEmail" placeholder="가입 당시 이메일" autofocus></td>
					</tr>							
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" class="input-btn" value="비밀번호 찾기" onclick="findPw(this.form)">	
							<br><br>                                      
							<input type="button" class="find-btn" value="아이디 찾기" onclick="location.href='findIdPage'">&nbsp; |&nbsp;
						<input type="button" class="find-btn" value="로그인하러 가기" onclick="location.href='loginPage'">
						</td>
					</tr>
				</tfoot>
			</table>        
               
            </form>
                      
                      
                      
        </div>

        </div>
	</main>

<%@ include file="../template/footer.jsp" %>


