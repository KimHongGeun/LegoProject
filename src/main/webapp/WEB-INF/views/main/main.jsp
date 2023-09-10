<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
$(document).ready(function() {
	const swiper = new Swiper('.swiper', {
		// If we need pagination
		pagination : {
			el : '.swiper-pagination',
		},

		autoplay : {
			delay : 3000, // 2초 후에 슬라이드 넘김
		},
		loop : true, // 무한 재생

		// Navigation arrows
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},
	});
});

</script>
<div class="container">
	<!-- Slider main container -->
	<div class="swiper">
		<!-- Additional required wrapper -->
		<div class="swiper-wrapper">
			<!-- Slides -->
			<div class="swiper-slide">
				<a href="#">
					<div class="number">1 / 2</div>
					<img src="resources/img/rogo_main1.png">
				</a>
			</div>
			<div class="swiper-slide">
				<a href="#">
					<div class="number">2 / 2</div>
					<img src="resources/img/rogo_main2.png">
				</a>
			</div>
		</div>
			
		<!-- If we need pagination -->
		<div class="swiper-pagination"></div>
		
		<!-- If we need navigation buttons -->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>

		<!-- If we need scrollbar -->
		<div class="swiper-scrollbar"></div>
	</div> <br><br>

	<!-- content2 -->
	<div class="content2">
			<img class="img1" src="resources/img/lego_main01.png">
			<img class="img2" src="resources/img/lego_main02.png">
	</div><br>
</div>