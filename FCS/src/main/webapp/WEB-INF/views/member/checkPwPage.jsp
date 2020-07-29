<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
   <jsp:param value="회원가입" name="title" />
</jsp:include>
<style type="text/css">
	input[type=button]{
		width:200px;
		text-align:center;
	}
	.inputbox1 {width: 200px; height: 25px; font-size: 18px;}
	span {font-size: 25px;}
	.input_group{
		margin:auto;
		paddin:auto;
		text-align:center;
		width:60%;
	}
</style>
<script type="text/javascript">
	function fn_changePw(f){
		if(f.pw.value!='${loginDTO.mPw}'){
			alert('비밀번호가 다릅니다.');
			return;
		}else{
			f.action='changePwPage';
			f.submit();
		}
	}
</script>
<div class="visual"><img src="resources/images/black.png" alt=""></div>
</header>

   <main>
  
   <div class="contents">
   <h2 class="h2">FCS 비밀번호 수정</h2>
    <p> 변경하실 비밀번호를 작성해 주세요.</p>
   
	   <div class="input_group">
		<form method="POST">
			<span >현재 비밀번호를 입력해주세요 : </span><input class="inputbox1" type="password" name="pw"/><br><br>
			<input type="button" class="input-btn" value="비밀번호 확인하기" onclick="fn_changePw(this.form)">
		</form>
		</div>
	</div>
 <%@ include file="../template/footer.jsp" %>