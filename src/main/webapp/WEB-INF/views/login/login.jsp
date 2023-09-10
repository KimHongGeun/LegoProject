<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
//엔터 키 이벤트 처리
$(document).keypress(function(e) {
  if (e.which === 13) { // 엔터 키 코드
      validation(); // 확인 버튼 작동
  }
});

//밸리데이션 체크 및 ajax
function validation() {
	let userId = $('#userId').val();
	let userPw = $('#userPw').val();
	const userIdTxt = document.querySelector(".userId span");
	const userPwTxt = document.querySelector(".userPw span");
	
	if(userId == '') {
		alert('아이디를 입력하세요.');
		userIdTxt.style.color = "red";
		return false;
	} else {
		userIdTxt.style.color = "black";
	}
	
	if(userPw == '') {
		alert('비밀번호를 입력하세요.');
		userPwTxt.style.color = "red";
		return false;
	} else {
		userPwTxt.style.color = "black";
	}
	
	
	if(userId !== '' && userPw !== '') {
		alert("login ajax");
		let params = {
        userId: userId,
        userPw: userPw,
      };
		
    	$.ajax({
    		type : 'POST',
    		url : '/loginInfo',
    		data : params,	
    		success: function(loginResult) {
          if (loginResult) {
              alert(userId + "님, 환영합니다");
              window.location.href = '/';
          } else {
              alert("정보가 일치하지 않습니다.");
          }
      	},
     	 	error : function(request,status,error) {
     	 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
     	 	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
    	});
    	
	} else {
		alert("로그인이 불가능합니다.");
		return false;
	}
}
</script>
<div class="container">
	<form action="login" method="POST">
		<h2>로 그 인</h2>
		<div class="user">
			<table class="userTable">
				<tr>
					<th class="userId"><span>아이디</span></th>
					<td>
						<input id="userId" name="userId" type="text">
					</td>
				</tr>
				
				<tr>
					<th class="userPw"><span>비밀번호</span></th>
					<td>
						<input id="userPw" name="userPw" type="password">
					</td>
				</tr>
			</table>
			
			<div class="find">
				<div class="id">
					<a href="findId">아이디 찾기</a>
				</div>
				
				<div class="pw">
					<a href="findPw">비밀번호 찾기</a>
				</div>
				
				<div class="join">
					<a href="join">회원가입</a>
				</div>
			</div>
			
			<button type="button" id="request" class="form-group" onclick="validation()">로그인</button>
		</div>
	</form>
</div>