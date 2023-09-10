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

//생년월일
$(document).ready(
    function () {
        for (let i = 2023; i > 1920; i--) {
            $('#year').append('<option value="' + i + '">' + i + '</option>');
        }
        for (let i = 1; i < 13; i++) {
            $('#month').append('<option value="' + i + '">' + i + '</option>');
        }
        for (let i = 1; i < 32; i++) {
            $('#day').append('<option value="' + i + '">' + i + '</option>');
        }
    }
);

//밸리데이션 체크 및 ajax
function validation() {
	let userId = $('#userId').val();
	let userName = $('#userName').val();
	let year = $('#year').val();
	let month = $('#month').val();
	let day = $('#day').val();
	let userBirth = year + '-' + month + '-' + day;
	const userIdTxt = document.querySelector(".userId span");
	const userNameTxt = document.querySelector(".userName span");
	const userBirthTxt = document.querySelector(".userBirth span");
	
	if(userId == '') {
		alert('아이디를 입력하세요.');
		userIdTxt.style.color = "red";
		return false;
	} else {
		userIdTxt.style.color = "black";
	}
	
	if(userName == '') {
		alert('이름을 입력하세요.');
		userNameTxt.style.color = "red";
		return false;
	} else {
		userNameTxt.style.color = "black";
	}
	
	if(year == '----' || month == '--' || day == '--') {
		alert('생년월일을 선택하세요.');
		userBirthTxt.style.color = "red";
		return false;
	} else {
		userBirthTxt.style.color = "black";
	}
	
	if(userId !== '' && userName !== '' && year !== '----' && month !== '--' && day !== '--') {
		alert("login ajax");
		let params = {
				userId: userId,
				userName: userName,
				userBirth: userBirth
      };
		
    	$.ajax({
    		type : 'POST',
    		url : '/findPwConfirm',
    		data : params,
    		dataType : 'json',
    		success: function(data) {
    			console.log(data);
    			var findPw = data.findPw;
          if (findPw != null) {
          	console.log("jsp의 findPw : " + findPw);
          	alert("비밀번호 찾기 완료");
            window.location.href = '/findPwConfirm?findPw=' + findPw;
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
	<form action="findPwConfirm" method="POST">
		<h2>비 밀 번 호 찾 기</h2>
		<div class="user">
			<table class="userTable">
				<tr>
					<th class="userId"><span>아이디</span></th>
					<td>
						<input id="userId" name="userId" type="text">
					</td>
					<td>
				</tr>
				
				<tr>
					<th class="userName"><span>이름</span></th>
					<td>
						<input id="userName" name="userName" type="text">
					</td>
				</tr>
				
				<tr>
					<th class="userBirth"><span>생년월일</span></th>
					<td>
						<select id="year">
							<option>----</option>
						</select>년&nbsp
						<select id="month">
							<option>--</option>
						</select>월&nbsp
						<select id="day">
							<option>--</option>
						</select>일
					</td>
				</tr>
			</table>
			
			<button type="button" id="request" class="form-group" onclick="validation()">확인</button>
		</div>
	</form>
</div>