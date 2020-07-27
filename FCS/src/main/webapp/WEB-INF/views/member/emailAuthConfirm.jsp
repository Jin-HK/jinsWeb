<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../template/header.jsp">
	<jsp:param value="인증번호받기" name="title" />
</jsp:include>
<script type="text/javascript">
	function fn_emailAuthConfirm(f){
		//인증코드는 ${authKey}
		//사용자 입력 값은 f.authKey.value
		var authKey = '${authKey}';
		if(authKey!=f.authKey.value){
			alert('잘못된 인증코드입니다');
			return;
		}else{
			alert('인증되었습니다. 비밀번호 변경 페이지로 이동합니다.');
			f.action = 'changePwPage';
			f.submit();
		}
		
	}
</script>
<div class="visual"><img src="https://ifh.cc/g/aFF3mM.jpg" alt=""></div>
</header>
<main>
	 <div class="contents">
	 	  <h2 class="h2">FCS 비밀번호 찾기</h2>
          <p> 가입하신 이메일로 인증 코드를 보냈습니다.<br/> 인증코드를 확인해 주세요 </p>

	 	 <div class="content">
			<form method="POST">
			 <table class="login-form">
				<tbody>
                    <tr>						
						<td colspan="2"><input class="find-input" type="text" name="authKey" placeholder="여기에 인증 코드를 입력하세요." autofocus></td>
						<input type="hidden" name="mId" value="${mId }" >
					</tr>							
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
						   <input type="button" value="인증하기" class="input-btn" onclick="fn_emailAuthConfirm(this.form)">							
						</td>
					</tr>
				</tfoot>
			</table>   
			
			
			
			<!--  
				여기에 인증 코드를 입력하세요.
				<input type="text" name="authKey">
				<input type="hidden" name="mId" value="${mId }" >
				<input type="button" value="인증하기" class="input-btn" onclick="fn_emailAuthConfirm(this.form)"> -->
			</form>
		 </div>
	  </div>	
</main>
<%@ include file="../template/footer.jsp" %>