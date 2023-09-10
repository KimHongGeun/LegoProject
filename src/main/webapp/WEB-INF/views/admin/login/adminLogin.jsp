<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	let adminYN = $('#adminYN').val();
	
	if(userId == '') {
		alert('아이디를 입력하세요.');
		return false;
	} else {
	}
	
	if(userPw == '') {
		alert('비밀번호를 입력하세요.');
		return false;
	} else {
	}
	
	
	if(userId !== '' && userPw !== '') {
		alert("login ajax");
		let params = {
        userId: userId,
        userPw: userPw,
        adminYN: adminYN,
      };
		
    	$.ajax({
    		type : 'POST',
    		url : '/adminLoginInfo',
    		data : params,	
    		success: function(loginResult) {
          if (loginResult) {
              alert(userId + " 관리자님, 환영합니다");
              window.location.href = 'adminMain';
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

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Custom fonts for this template-->
    <link href="resources/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resources/bootstrap/css/sb-admin-2.min.css" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input type="email" id="userId" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="관리자 아이디를 입력해주세요.">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" id="userPw" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="관리자 비밀번호를 입력해주세요.">
                                        </div>
                                        <div class="form-group">
                                        </div>
                                        <a onclick="validation()" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a>
                                    </form>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" id="adminYN" name="adminYN" value="Y"/>

    <!-- Bootstrap core JavaScript-->
    <script src="resources/bootstrap/vendor/jquery/jquery.min.js"></script>
    <script src="resources/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="resources/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="resources/bootstrap/js/sb-admin-2.min.js"></script>

</body>

</html>