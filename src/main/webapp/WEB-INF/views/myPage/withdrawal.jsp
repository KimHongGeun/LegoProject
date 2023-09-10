<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
//엔터 키 이벤트 처리
$(document).keypress(function(e) {
  if (e.which === 13) { // 엔터 키 코드
  	alert("엔터누름");
		validation(); // 확인 버튼 작동
  }
});

// 밸리데이션 체크 및 ajax
function validation() {
	if(confirm('회원탈퇴 하시겠습니까?')) {
		let userId = $('#userId').val();
		let userPw = $('#userPw').val();
		let userName = $('#userName').val();
		let useYN = $('#useYN').val();
		const userPwTxt = document.querySelector(".userPw span");
		const userNameTxt = document.querySelector(".userName span");

		if(userPw == '') {
			alert('비밀번호를 입력하세요.');
			userPwTxt.style.color = "red";
			return false;
		} else {
			userPwTxt.style.color = "black";
		}
		
		if(userName == '') {
			alert('이름을 입력하세요.');
			userNameTxt.style.color = "red";
			return false;
		} else {
			userNameTxt.style.color = "black";
		}

		if(userPw !== '' && userName !== '') {
			console.log('여기들어왓냥??');
			let params = {
					userId: userId,
	        userPw: userPw,
	        userName: userName,
	        useYN: useYN,
	      };
			
	    	$.ajax({
	    		type : 'POST',
	    		url : '/withdrawalInfo',
	    		data : params,
	    		dataType: 'json',
	    		success: function(result) {
	    			console.log(result);
	          if (result) {
	              alert("회원탈퇴 완료");
	              window.location.href = '/';
	          } else {
	              alert("잘못된 정보입니다. 다시 확인해주세요.");
	          }
	      },
	      	error : function(request,status,error) {
	     	 		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	     	 		console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    		}
	    	});
		} else {
			alert("회원탈퇴가 불가합니다.");
			return false;
		} 
	} else {
		alert("취소를 누르셨습니다");
		return false;
	}
}
</script>
<div class="container">
	<form method="POST">
		<h2>회 원 탈 퇴</h2>
		<div class="user">
			<table class="userTable">
			<tr>
					<th class="userId"><span>아이디</span></th>
					<td>
						<input id="userId" name="userId" type="text" value="${sessionScope.userId}" readonly>
					</td>
				</tr>
			
				<tr>
					<th class="userPw"><span>비밀번호</span></th>
					<td>
						<input id="userPw" name="userPw" type="password">
					</td>
				</tr>

				<tr>
					<th class="userName"><span>이름</span></th>
					<td>
						<input id="userName" name="userName" type="text">
					</td>
				</tr><br>
				<input type="hidden" id="useYN" name="useYN" value="N"/>
			</table>
		</div>
		<button type="button" id="request" class="form-group" onclick="validation()">탈퇴하기</button>
	</form>
</div>
<br>
</body>