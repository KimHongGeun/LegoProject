<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- swiper -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<!-- 내가 만든 css, js 경로 -->
<link href="/resources/css/userCommon.css" rel="stylesheet" type="text/css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css"
	rel="stylesheet">
</head>

<body>
	<div class="container">
		<!-- header -->
		<div class="header">
		
			<div class="tel">
				<ul>
					<li class="tel">C/S CENTER : 070-880-0166</li>
				</ul>
			</div>
		
			<ul>
				<li class="join">
					<c:choose>
	    			<c:when test="${loggedIn}"></c:when>
		    		<c:otherwise>
		        	<!-- 로그아웃 상태일 때 -->
		        	<a href="join">회원가입</a>
		    		</c:otherwise>
					</c:choose>
				</li>
				
				<li class="login">
					<c:choose>
	    			<c:when test="${loggedIn}">
		        	<!-- 로그인 상태일 때 -->
		        	<a href="logout">로그아웃</a>
		    		</c:when>
		    		<c:otherwise>
		        	<!-- 로그아웃 상태일 때 -->
		        	<a href="login">로그인</a>
		    		</c:otherwise>
					</c:choose>
				</li>
				
				<li class="myPage">
					<c:choose>
	    			<c:when test="${loggedIn}">
		        	<!-- 로그인 상태일 때 -->
		        	<a href="myPage">마이페이지</a>
		    		</c:when>
		    		<c:otherwise>
		    		</c:otherwise>
					</c:choose>
				</li>
			</ul>
		</div>

		<!-- nav -->
		<div class="nav">
			<div class="img">
				<a href="/"> <img class="logo" src="resources/img/rogo.png"></a>
			</div>
			<ul>
				<li class="car"><a href="product">레고 제품 쇼핑</a></li>
				<li class="board"><a href="/">레고 브랜드 소개</a></li>
				<li class="board2"><a href="/">고객 지원</a></li>
			</ul>
			<div class="margin"></div>
		</div>
	</div>
</body>
</html>