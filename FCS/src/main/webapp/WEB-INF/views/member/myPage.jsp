<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp">
   <jsp:param value="회원가입" name="title" />
</jsp:include>
<style>
.inputbox1 {width: 200px; height: 25px; font-size: 18px;}
.inputbox2 {width: 70px; height: 25px; font-size: 18px;}
.inputbox3 {width: 300px; height: 25px; font-size: 18px;}
.inputbox4 {width: 350px; height: 25px; font-size: 18px;}
    </style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	
	function fn_changePw(f){
			f.action='checkPwPage';
			f.submit();
	}
	function fn_deleteMember(f){
		if(confirm('탈퇴하시면 동일한 아이디로 재가입이 불가능합니다. 정말로 탈퇴 하시겠습니까?')){
			f.action='deleteMember';
			f.submit();
		}
	}
	function fn_selectMyOrderList(f){
		f.action='selectMyOrderList';
		f.submit();
	}
	
	$(document).ready(function(){
		
		// 회원정보 수정하기
		$('#updateBtn').click(function(){
			$.ajax({
				url: 'updateMember',
				type: 'POST',
				dateType: 'JSON',
				data: $('#f').serialize(),
				success: function(responseObject){
					if(responseObject.result == 'SUCCESS'){
						alert('회원 정보가 수정되었습니다.');
					}else{
						alert('회원 정보가 수정되지 않았습니다.');
					}
				},
				error: function(){
					alert('AJAX 통신에 실패했습니다.');
				}
			});
		});
		
	});
	
	//주소 api
	function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mPost').value = data.zonecode;
                document.getElementById("mAddr1").value = roadAddr;
                document.getElementById("mAddr2").value = data.jibunAddress;
              
            }
        }).open();
    }
</script>
<style>
	

    tr{
        height: 50px;
    }
    
    td{
        font-size: 20px;
         border-bottom: 1px solid #444444;
       
    }

    .inputbox1{
        height: 25px; 
        width: 200px;
    }
    .inputbox2{
        height: 25px; 
        width: 70px;
    }
    
     .inputbox3{
        height: 25px; 
        width: 200px;
    }
    .inputbox4{
        height: 25px; 
        width: 300px;
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
           border-top: 1px solid #444444;
    }

    .h22 { position: relative; padding: 55px 0 53px; font-size: 36px; color:#222; line-height: 100%; text-align: center; } 
    
    .adrbtn{
    background:white;
         border-radius:3px;
        border: 1px solid black;
        height: 25px;
    }
    
    .changebtn1{
         background:black;
        color: white;
         border-radius:3px;
        border: 1px solid black;
        height: 30px;
    }
    
    .changebtn2{
         background:white;
         border-radius:3px;
        border: 1px solid black;
        height: 30px;
    }
    


</style>
<div class="visual"><img src="resources/images/black.png" alt=""></div>
</header>

  <main>
         <div class="contents">
            <h2 class="h22">FCS 마이 페이지</h2>
          
           
<div class="my-box">
	
	<form id='f'  method="POST">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>
						<input class="inputbox1" id="mId" type="text" name="mId" value="${loginDTO.mId }" readonly/>
					</td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input class="inputbox1" id="mName" type="text" name="mName" value="${loginDTO.mName }"/></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input class="inputbox1" id="mBirth" type="text" name="mBirth" value="${loginDTO.mBirth }"/></td>
				</tr>
				
				<tr>
					<td>이메일</td>
					<td>
						<input class="inputbox1" id="mEmail" type="text" name="mEmail" value="${loginDTO.mEmail }"/>
					</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>
						<input class="inputbox2" id="mMobile1" type="number" name="mMobile1" value="${loginDTO.mMobile1 }"/>
						-
						<input class="inputbox2" id="mMobile2" type="number" name="mMobile2" value="${loginDTO.mMobile2 }"/>
						-
						<input class="inputbox2" id="mMobile3" type="number" name="mMobile3" value="${loginDTO.mMobile3 }"/>
					</td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input class="inputbox1" type="text" id="mPost" name="mPost" value="${loginDTO.mPost }">&nbsp;
                        <input type="button" class="adrbtn"  onclick="execDaumPostcode()" value="우편번호 찾기"><br></td>
				</tr>
				<tr>
					<td>도로명주소</td>
					<td><input  class="inputbox3" type="text" id="mAddr1" name="mAddr1"  value="${loginDTO.mAddr1 }"></td>
				</tr>
				<tr>
					<td>지번주소</td>
					<td>
						<input class="inputbox3" type="text" id="mAddr2" name="mAddr2" value="${loginDTO.mAddr2 }">
						<span id="guide" style="color:#999;display:none"></span>
					</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input class="inputbox4" type="text" id="mAddr3" name="mAddr3" value="${loginDTO.mAddr3 }"></td>
				</tr>
				<tr>
					<td>가입일</td>
					<td>${loginDTO.mRegdate }</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="hidden" name="mNo" value="${loginDTO.mNo }" >
						<input id="updateBtn" type="button" class="changebtn1" value="회원정보 수정하기" />
						<input type="button" class="changebtn1" value="비밀번호 수정하기" onclick="fn_changePw(this.form)" />
						<input type="button" class="changebtn2" value="탈퇴하기" onclick="fn_deleteMember(this.form)" />
						<input type="button" class="changebtn2" value="메인으로 이동" onclick="location.href='index'" />
						<input type="button" class="changebtn2" value="구매내역 보기" onclick="fn_selectMyOrderList(this.form)"/>
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
	</main>
					
 <%@ include file="../template/footer.jsp" %>