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
	<form action="logout" method="POST">
		<h2>로그아웃 되었습니다.</h2>

			<div type="submit" class="form-group">
				<a href="/" class="user_btn">확인</a>
			</div>
	</form>
</div>