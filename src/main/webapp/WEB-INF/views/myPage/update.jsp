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

// 밸리데이션 관련된 변수 선언
let pwCheck = 'N';
let pwConfirmCheck = 'N';

// 비밀번호 정규식
function userPwCheck() {
  let userPw = $('#userPw').val();
  let regExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
  const userPwTxt = document.querySelector(".userPw span");
  const userPwErrorTxt = document.querySelector(".userPwError span");
  
  if (!userPw.match(regExp) || userPw === '') {
    $('#userPwError').val('숫자+문자+특수문자를 조합하여 8~16자를 입력해주세요.').show();
    userPwTxt.style.color = "red";
    userPwError.style.color = "red";
    pwCheck = 'N';
    return false;
  } else {
    $('#userPwError').hide();
    userPwTxt.style.color = "black";
    pwCheck = 'Y';
  }
};

// 비밀번호 === 비밀번호 확인
function userConfirmPwCheck() {
	let userPw = $('#userPw').val();
	let userConfirmPw = $('#userConfirmPw').val();
	const userConfirmPwTxt = document.querySelector(".userConfirmPw span");

	if (userPw !== userConfirmPw) {
		$('#userConfirmPwE').val('비밀번호가 일치하지 않습니다').show();
  	userConfirmPwTxt.style.color = "red";
  	pwConfirmCheck = 'N';
  	return false;
  } else {
  	$('#userConfirmPwE').hide();
  	userConfirmPwTxt.style.color = "black";
  	pwConfirmCheck = 'Y';
  }
}

//주소
function execDaumPostcode() {
	daum.postcode.load(function(){
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
        $('#userAddrPostal').val(data.zonecode);
        $('#userAddr').val(data.roadAddress);
      }
    }).open();
	});
}

// 밸리데이션 체크 및 ajax
function validation() {
	alert("밸리데이션 들어옴");
	let userId = $('#userId').val();
	let userPw = $('#userPw').val();
	let userConfirmPw = $('#userConfirmPw').val();
	let userName = $('#userName').val();
	let userAddrPostal = $('#userAddrPostal').val();
	let userAddr = $('#userAddr').val();
	let userAddrDetail = $('#userAddrDetail').val();

	const userPwTxt = document.querySelector(".userPw span");
	const userConfirmPwTxt = document.querySelector(".userConfirmPw span");
	const userNameTxt = document.querySelector(".userName span");
	const userAddrPostalTxt = document.querySelector(".userAddrPostal span");
	const userAddrTxt = document.querySelector(".userAddr span");
	const userAddrDetailTxt = document.querySelector(".userAddrDetail span");

	if(userPw == '') {
		alert('비밀번호를 입력하세요.');
		userPwTxt.style.color = "red";
		return false;
	} else {
		userPwTxt.style.color = "black";
	}
	
	if(userConfirmPw == '') {
		alert('비밀번호 확인을 입력하세요.');
		userConfirmPwTxt.style.color = "red";
		return false;
	} else {
		userConfirmPwTxt.style.color = "black";
	}
	
	if(userName == '') {
		alert('이름을 입력하세요.');
		userNameTxt.style.color = "red";
		return false;
	} else {
		userNameTxt.style.color = "black";
	}

	if(userAddrPostal == '') {
		alert('우편번호를 입력하세요.');
		userAddrPostalTxt.style.color = "red";
		return false;
	} else {
		userAddrPostalTxt.style.color = "black";
	}
	
	if(userAddr == '') {
		alert('주소를 입력하세요.');
		userAddrTxt.style.color = "red";
		return false;
	} else {
		userAddrTxt.style.color = "black";
	}
	
	if(userAddrDetail == '') {
		alert('주소를 입력하세요.');
		userAddrDetailTxt.style.color = "red";
		return false;
	} else {
		userAddrDetailTxt.style.color = "black";
	}
	console.log("pwCheck : " + pwCheck + "--- / " + "pwConfirmCheck : " + pwConfirmCheck	)
	if(pwCheck === 'Y' && pwConfirmCheck === 'Y') {
		let params = {
				userId: userId,
        userPw: userPw,
        userName: userName,
        userAddrPostal: userAddrPostal,
        userAddr: userAddr,
        userAddrDetail: userAddrDetail,
      };
		
    	$.ajax({
    		type : 'POST',
    		url : '/updateInfo',
    		data : params,
    		dataType: 'json',
    		success: function(result) {
    			console.log(result);
          if (result) {
              alert("정보수정 완료");
              window.location.href = '/myPage';
          } else {
              alert("전송된 값 없음");
          }
      },
     	 	error : function(request,status,error) {
     	 	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
     	 	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    		}
    	});
    	
	} else if(pwConfirmCheck === 'N') {
		alert("비밀번호와 비밀번호 확인을 일치시켜주세요!");
		return false;
		
	} else if(pwCheck === 'N') {
		alert("비밀번호를 확인해주세요!");
		return false;
		
	} else {
		alert("회원가입이 불가합니다.");
		return false;
	} 
}
</script>
<div class="container">
	<form method="POST">
		<h2>정 보 수 정</h2>
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
						<input id="userPw" name="userPw" type="password" onchange="userPwCheck()">
						<div class="userPwError" id="userPwError">숫자+문자+특수문자를 조합하여 8~16자를 입력해주세요.</div>
					</td>
				</tr>
				
				<tr>
					<th class="userConfirmPw"><span>비밀번호 확인</span></th>
					<td>
						<input id="userConfirmPw" name="userConfirmPw" type="password" onchange="userConfirmPwCheck()">
						<div class="userConfirmPwE" id="userConfirmPwE">비밀번호가 일치하지 않습니다.</div>
					</td>
				</tr><br>
				
				<tr>
					<th class="userName"><span>이름</span></th>
					<td>
						<input id="userName" name="userName" value="${sessionScope.userName}" type="text">
					</td>
				</tr><br>

				<tr>
					<th class="userAddrPostal"><span>우편번호</span></th>
					<td>
						<input id="userAddrPostal" type="text" value="${sessionScope.userAddrPostal}" name="userAddrPostal" readonly />
					</td>
					<td>
						<input type='button' id='postCode' value="주소입력" onclick="execDaumPostcode()">
					</td>
				</tr>
				
				<tr>
					<th class="userAddr"><span>주소</span></th>
					<td>
						<input id="userAddr" type="text" value="${sessionScope.userAddr}" name="userAddr" readonly />
					</td>
				</tr>
				
				<tr>
					<th class="userAddrDetail"><span>상세 주소</span></th>
					<td>
						<input id="userAddrDetail" type="text" value="${sessionScope.userAddrDetail}" name="userAddrDetail" />
					</td>
				</tr>

			</table>
		</div>
		<button type="button" id="request" class="form-group" onclick="validation()">수정하기</button>
	</form>
</div>
<br>
</body>