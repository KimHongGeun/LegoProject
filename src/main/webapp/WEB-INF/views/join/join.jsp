<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script>
//엔터 키 이벤트 처리
$(document).keypress(function(e) {
  if (e.which === 13) { // 엔터 키 코드
      validation(); // 확인 버튼 작동
  }
});

// 밸리데이션 관련된 변수 선언
let pwCheck = 'N';
let pwConfirmCheck = 'N';
let idCheck = 'Y';

//아이디 중복체크
 function userIdCheck()
{
	let userId = $('#userId').val();
	const userIdTxt = document.querySelector(".userId span");
	
	if(userId == '') {
		alert('아이디를 입력하세요.');
		userIdTxt.style.color = "red";
		return false;
	} else {
		userIdTxt.style.color = "black";
	}
	
	let params = {
      userId: userId
  };
	
	$.ajax({
    type: 'POST',
    url: '/userIdCheck          ',
    data: params,
    success: function(response) {
      if (response == '') {
      	alert('사용 가능한 아이디입니다.');
      	idCheck = 'Y';
      } else {
      	alert('이미 사용 중인 아이디입니다.');
      	idCheck = 'N';
      }
    },
    error: function(response) {
      alert('아이디 중복 체크에 실패했습니다.');
    }
  });
} 

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

// 생년월일
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

// 밸리데이션 체크 및 ajax
function validation() {
	let userId = $('#userId').val();
	let userPw = $('#userPw').val();
	let userConfirmPw = $('#userConfirmPw').val();
	let userName = $('#userName').val();
	let userAddrPostal = $('#userAddrPostal').val();
	let userAddr = $('#userAddr').val();
	let userAddrDetail = $('#userAddrDetail').val();
	let userGender = $('#userGender input:checked').val();
	let year = $('#year').val();
	let month = $('#month').val();
	let day = $('#day').val();
	let userBirth = year + '-' + month + '-' + day;
	let userCheck = $('#userCheck').val();
	let managerCheck = $('#managerCheck').val();
	
	const userIdTxt = document.querySelector(".userId span");
	const userPwTxt = document.querySelector(".userPw span");
	const userConfirmPwTxt = document.querySelector(".userConfirmPw span");
	const userNameTxt = document.querySelector(".userName span");
	const userAddrPostalTxt = document.querySelector(".userAddrPostal span");
	const userAddrTxt = document.querySelector(".userAddr span");
	const userAddrDetailTxt = document.querySelector(".userAddrDetail span");
	const userGenderTxt = document.querySelector(".userGender span");
	const userBirthTxt = document.querySelector(".userBirth span");
	
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
	
	if($('#userGender input:checked').length === 0) {
		alert('성별을 선택하세요.');
		userGenderTxt.style.color = "red";
		return false;
	} else {
		userGenderTxt.style.color = "black";
	}
	
	if(year == '----' || month == '--' || day == '--') {
		alert('생년월일을 선택하세요.');
		userBirthTxt.style.color = "red";
		return false;
	} else {
		userBirthTxt.style.color = "black";
	}
	
	if(idCheck === 'Y' && pwCheck === 'Y' && pwConfirmCheck === 'Y') {
		let params = {
        userId: userId,
        userPw: userPw,
        userName: userName,
        userAddrPostal: userAddrPostal,
        userAddr: userAddr,
        userAddrDetail: userAddrDetail,
        userGender: userGender,
        userBirth: userBirth,
        userCheck: userCheck,
        managerCheck: managerCheck
      };
		
    	$.ajax({
    		type : 'POST',
    		url : '/joinInfo',
    		data : params,	
    		success: function(result) {
          if (result) {
              alert("회원가입 완료");
              window.location.href = '/login';
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
		
	 } else if(idCheck === 'N') {
		alert("아이디를 확인해주세요!");
		return false; 
		
	} else {
		alert("회원가입이 불가합니다.");
		return false;
	}
}
</script>
<div class="container">
	<form action="join" method="POST">
		<h2>회 원 가 입</h2>
		<div class="user">
			<table class="userTable">
				<tr>
					<th class="userId"><span>아이디</span></th>
					<td>
						<input id="userId" name="userId" type="text">
					</td>
					<td>
						<input type='button' id='idButton' value="아이디 중복체크" onclick="userIdCheck()">
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
						<input id="userName" name="userName" type="text">
					</td>
				</tr><br>

				<tr>
					<th class="userAddrPostal"><span>우편번호</span></th>
					<td>
						<input id="userAddrPostal" type="text" name="userAddrPostal" readonly />
					</td>
					<td>
						<input type='button' id='postCode' value="주소입력" onclick="execDaumPostcode()">
					</td>
				</tr>
				
				<tr>
					<th class="userAddr"><span>주소</span></th>
					<td>
						<input id="userAddr" type="text" name="userAddr" readonly />
					</td>
				</tr>
				
				<tr>
					<th class="userAddrDetail"><span>상세 주소</span></th>
					<td>
						<input id="userAddrDetail" type="text" name="userAddrDetail" />
					</td>
				</tr>
				
				<tr>
					<th class="userGender"><span>성별</span></th>
					<td id="userGender" name="userGender">
						<input type="radio" id="gender" name="gender" value="man"><label>남자</label>&nbsp&nbsp
						<input type="radio" id="gender" name="gender" value="woman"><label>여자</label>
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
		</div>
		<input type="hidden" id="userCheck" name="userCheck" value="Y"/>
		<input type="hidden" id="managerCheck" name="managerCheck" value="N"/>
		<button type="button" id="request" class="form-group" onclick="validation()">제출하기</button>
	</form>
</div>
<br>