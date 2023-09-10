<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
//엔터 키 이벤트 처리
$(document).keypress(function(e) {
    if (e.which === 13) { // 엔터 키 코드
        e.preventDefault(); // 기본 엔터 동작 방지
        $('.user_btn').click(); // 확인 버튼 클릭
    }
});
</script>
<div class="container">
	<form action="" method="POST">
		<h2>고객님의 비밀번호 찾기가 완료 되었습니다.</h2>
		<div class="user">
			<table class="userTable">
				<tr>
					<th class="userPw"><span>비밀번호</span> : ${findPw}</th>
				</tr>
			</table>
			<div type="submit" class="form-group">
				<a href="login" class="user_btn">확인</a>
			</div>
		</div>
	</form>
</div>