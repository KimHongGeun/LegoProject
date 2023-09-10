<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
// car
function carList() {
	let first = $('#first');
	let second = $('#second');
	let third = $('#third');
	let fourth = $('#fourth');
	first.animate(
      {
          opacity: 1  // 반투명하게 설정
      }
  );
	second.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	third.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	fourth.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	
	let carList = 
	`<div class="product2">
		<a class="first">
		<img class="img" src="/resources/img/lego_main_car.png" style="transform: scale(0.5); margin-top: -50px;">
		<div class="text">
		</div>
		</a>
		<a class="second">
		<div class="text">
		</div>
		</a>
		<a class="third">
		<div class="text">
		</div>
		</a>
		<a class="fourth">
		<div class="text">
		</div>
		</a>
	</div>
	<div class="product2" style="margin-top: 0;">
	<a href="car1" class="first">
		<img class="img" src="/resources/img/lego_car1.webp">
		<div class="text">
			<p class="text1">아우디 RS Q e-트론</p><br>
			<p class="text2">아우디 전기랠리카</p><br>
			<p class="text3">229,900원</p>
		</div>
	</a>

	<a href="car2" class="second">
		<img class="img" src="/resources/img/lego_car2_330x250.png">
			<div class="text">
			<p class="text1">부가티 볼리드 에자일 블</p><br>
			<p class="text2">부가티 하이퍼카</p><br>
			<p class="text3">72,900원</p>
		</div>
	</a>

	<a href="car3" class="third">
		<img class="img" src="/resources/img/lego_car3_330x250.png">
			<div class="text">
			<p class="text1">맥라렌 솔루스 GT와 맥라렌 F1 LM</p><br>
			<p class="text2">맥라렌 하이퍼카2대</p><br>
			<p class="text3">64,900원</p>
		</div>
	</a>
	
	<a href="car4" class="fourth">
		<img class="img" src="/resources/img/lego_car4_330x250.png">
			<div class="text">
				<p class="text1">포르쉐 911 RSR</p><br>
				<p class="text2">포르쉐 레이싱카</p><br>
				<p class="text3">259,900원</p>
			</div>
	</a>
</div>
	
<div class="product2">
	<a href="car5" class="fifth">
		<img class="img" src="/resources/img/lego_car5_330x250.png">
		<div class="text">
			<p class="text1">쉐보레 콜벳</p><br>
			<p class="text2">쉐보레 콜벳 1961년형 2도어</p><br>
			<p class="text3">209,900원</p>
		</div>
	</a>

	<a href="car6" class="sixth">
		<img class="img" src="/resources/img/lego_car6_330x250.png">
		<div class="text">
			<p class="text1">푸조 9X8 24H </p><br>
			<p class="text2">푸조 르망 하이브리드 하이퍼</p><br>
			<p class="text3">259,900원</p>
		</div>
	</a>
</div>`;

	$(".list").empty();
	$('.list').append(carList);
}

// 스타워즈 
function starwarsList() {
	console.log('스타워즈');
	let first = $('#first');
	let second = $('#second');
	let third = $('#third');
	let fourth = $('#fourth');
	first.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	second.animate(
      {
          opacity: 1  // 반투명하게 설정
      },
  );
	third.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	fourth.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	
	let starwarsList = 
		`<div class="product2">
		<a class="first">
		<div class="text">
		</div>
		</a>
		<a class="second">
		<img class="img" src="/resources/img/lego_starwars_main_400x300.png" style="transform: scale(0.5); margin-top: -50px;">
		<div class="text">
		</div>
		</a>
		<a class="third">
		<div class="text">
		</div>
		</a>
		<a class="fourth">
		<div class="text">
		</div>
		</a>
	</div>
	<div class="product2" style="margin-top: 0;">
	<a href="starwars2" class="second">
		<img class="img" src="/resources/img/lego_starwars1_400x300.png">
		<div class="text">
			<p class="text1">요다의 제다이 스타파이터</p><br>
			<p class="text2">요다의 제다이 </p><br>
			<p class="text3">52,900원</p>
		</div>
	</a>
	
	<a href="starwars1" class="first">
	<img class="img" src="/resources/img/lego_starwars2_400x300.png">
	<div class="text">
		<p class="text1">밀레니엄 팔콘</p><br>
		<p class="text2">은하계에서 가장 유명한 우주선</p><br>
		<p class="text3">1,100,000원</p>
	</div>
	</a>

	<a href="starwars3" class="third">
		<img class="img" src="/resources/img/lego_starwars3_400x300.png">
		<div class="text">
			<p class="text1">만달로리안 N-1 스타파이터</p><br>
			<p class="text2">너무나 멋진 축소판 스타파이터</p><br>
			<p class="text3">23,900원</p>
		</div>
	</a>

	<a href="starwars4" class="fourth">
		<img class="img" src="/resources/img/lego_starwars4_400x300.png">
		<div class="text">
			<p class="text1">보바 펫의 우주선 마이크로파이터</p><br>
			<p class="text2">너무나 멋진 마이크로파이터</p><br>
			<p class="text3">12,900원</p>
		</div>
	</a>
</div>
	
<div class="product2">
	<a href="starwars5" class="fifth">
		<img class="img" src="/resources/img/lego_starwars5_400x300.png">
		<div class="text">
			<p class="text1">신 공화국 E-윙 VS 신 하티의 <br>스타파이터</p><br>
			<p class="text2"> 두개의 소형우주선</p><br>
			<p class="text3">157,900원</p>
		</div>
	</a>

	<a href="starwars6" class="sixth">
		<img class="img" src="/resources/img/lego_starwars6_400x300.png">
		<div class="text">
			<p class="text1">501 클론 트루퍼 배틀팩</p><br>
			<p class="text2">액션 놀이를 위한 클론 트루퍼 조립</p><br>
			<p class="text3">29,900원</p>
		</div>
	</a>
</div>`;

	$(".list").empty();
	$('.list').append(starwarsList);
}

// 마블
function marvelList() {
	console.log('마블');
	let first = $('#first');
	let second = $('#second');
	let third = $('#third');
	let fourth = $('#fourth');
	first.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	second.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	third.animate(
      {
          opacity: 1  // 반투명하게 설정
      },
  );
	fourth.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	
	let marvelList = 
		`<div class="product2">
		<a class="first">
		<div class="text">
		</div>
		</a>
		<a class="second">
		<div class="text">
		</div>
		</a>
		<a class="third">
		<img class="img" src="/resources/img/lego_marvel_main_400x300.png" style="transform: scale(0.5); margin-top: -50px;">
		<div class="text">
		</div>
		</a>
		<a class="fourth">
		<div class="text">
		</div>
		</a>
	</div>
	<div class="product2" style="margin-top: 0;">
	<a href="marve2" class="second">
		<img class="img" src="/resources/img/lego_marvel1_400x300.png">
		<div class="text">
			<p class="text1">블랙위도우와 캡틴아메리카 <br>모터사이클</p><br>
			<p class="text2">블랙위도우와 캡틴아메리카 모험</p><br>
			<p class="text3">23,900원</p>
		</div>
	</a>

	<a href="marve3" class="third">
		<img class="img" src="/resources/img/lego_marvel2_400x300.png">
		<div class="text">
			<p class="text1">아이언맨 연구소2</p><br>
			<p class="text2">토니 스타크의 무기고</p><br>
			<p class="text3">129,900원</p>
		</div>
	</a>
	
	<a href="marve1" class="first">
	<img class="img" src="/resources/img/lego_marvel3_400x300.png">
	<div class="text">
		<p class="text1">가디언 쉽</p><br>
		<p class="text2">가디언즈 오브 갤럭시 우주선</p><br>
		<p class="text3">224,900원</p>
	</div>
	</a>

	<a href="marve4" class="fourth">
		<img class="img" src="/resources/img/lego_marvel4_400x300.png">
		<div class="text">
			<p class="text1">어벤져스 퀸젯</p><br>
			<p class="text2">어벤져스 영웅들의 비행선</p><br>
			<p class="text3">149,900원</p>
		</div>
	</a>
</div>
	
<div class="product2">
	<a href="marve5" class="fifth">
		<img class="img" src="/resources/img/lego_marvel5_400x300.png">
		<div class="text">
			<p class="text1">토르 : 뉴 아스가르드 공격</p><br>
			<p class="text2">토르 아스가르드 공격</p><br>
			<p class="text3">29,900원</p>
		</div>
	</a>

	<a href="marve6" class="sixth">
		<img class="img" src="/resources/img/lego_marvel6_400x300.png">
		<div class="text">
			<p class="text1">아이언맨 헐크버스터 VS 타노스</p><br>
			<p class="text2">아이언맨과 타노스 대결</p><br>
			<p class="text3">37,900원</p>
		</div>
	</a>
</div>`;

	$(".list").empty();
	$('.list').append(marvelList);
}
//해리포터
function harrypotterList() {
	console.log('해리포터');
	let first = $('#first');
	let second = $('#second');
	let third = $('#third');
	let fourth = $('#fourth');
	first.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	second.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	third.animate(
      {
          opacity: 0.5  // 반투명하게 설정
      },
      500  // 애니메이션 지속 시간
  );
	fourth.animate(
      {
          opacity: 1  // 반투명하게 설정
      },
  );
	
	let harrypotterList = 
		`<div class="product2">
		<a class="first">
		<div class="text">
		</div>
		</a>
		<a class="second">
		<div class="text">
		</div>
		</a>
		<a class="third">
		<div class="text">
		</div>
		</a>
		<a class="fourth">
		<img class="img" src="/resources/img/lego_harrypotter_main_400x300.png" style="transform: scale(0.5); margin-top: -50px;">
		<div class="text">
		</div>
		</a>
	</div>
	<div class="product2" style="margin-top: 0;">
	<a href="harrypotter2" class="second">
		<img class="img" src="/resources/img/lego_harrypotter1_400x300.png">
		<div class="text">
			<p class="text1">해리포터 호그와트™성</p><br>
			<p class="text2">해리포터가 다니는 마법학교</p><br>
			<p class="text3">640,000원</p>
		</div>
	</a>

	<a href="harrypotter3" class="third">
		<img class="img" src="/resources/img/lego_harrypotter2_400x300.png">
		<div class="text">
			<p class="text1">호그와트 익스프레스™-콜렉터에디션</p><br>
			<p class="text2">머글세계에서 호그와트로 갈수있게해주는 기차</p><br>
			<p class="text3">649,900원</p>
		</div>
	</a>

	<a href="harrypotter4" class="fourth">
		<img class="img" src="/resources/img/lego_harrypotter3_400x300.png">
		<div class="text">
			<p class="text1">호그와트 익스프레스™와 <br>호그스미호그와트 익스프레스™기차</p><br>
			<p class="text2">머글세계에서 호그와트로 갈수있게해주는 <br>기차과 기차역</p><br>
			<p class="text3">184,900원</p>
		</div>
	</a>
	
	<a href="harrypotter1" class="first">
	<img class="img" src="/resources/img/lego_harrypotter4_400x300.png">
	<div class="text">
		<p class="text1">호그스미드™마을방문</p><br>
		<p class="text2">마법세계의마을</p><br>
		<p class="text3">129,900원</p>
	</div>
	</a>
</div>
	
<div class="product2">
	<a href="harrypotter5" class="fifth">
		<img class="img" src="/resources/img/lego_harrypotter5_400x300.png">
		<div class="text">
			<p class="text1">호그와트™마차와 세스트랄</p><br>
			<p class="text2">신비로운 생물과 마법의 마차 여행</p><br>
			<p class="text3">29,900원</p>
		</div>
	</a>

	<a href="harrypotter6" class="sixth">
		<img class="img" src="/resources/img/lego_harrypotter6_400x300.png">
		<div class="text">
			<p class="text1">호그와트™비밀의 방</p><br>
			<p class="text2">마법의 액션으로 가득한 호그와트™</p><br>
			<p class="text3">199,900원</p>
		</div>
	</a>
</div>`;

	$(".list").empty();
	$('.list').append(harrypotterList);
}
</script>
<div class="container">
	<h2>원하시는 제품 선택해주세요 </h2>
	<div class="product1">
		<a id="first" class="first" onclick="carList()">
			<img class="img" src="/resources/img/lego_main_car.png">
			
			<div class="text">
				<p class="text1">CAR</p><br>
				<p class="text2">물건이 아닌 꿈을 만드는 순간,<br> 그것이 레고 자동차의 매력입니다.</p>
			</div>
		</a>
	
		<a id="second" class="second" onclick="starwarsList()">
			<img class="img" src="/resources/img/lego_starwars_main_400x300.png">
			<div class="text">
				<p class="text1">STARWARS™</p><br>
				<p class="text2">스타워즈 레고, 우주를 담다.</p>
			</div>
		</a>
	
		<a id="third" class="third" onclick="marvelList()">
			<img class="img" src="/resources/img/lego_marvel_main_400x300.png">
			<div class="text">
				<p class="text1">MARVEL™</p><br>
				<p class="text2">마블 레고, 영웅들의 새로운 모험의 시작.</p>
			</div>
		</a>
	
		<a id="fourth" class="fourth" onclick="harrypotterList()">
			<img class="img" src="/resources/img/lego_harrypotter_main_400x300.png">
			<div class="text">
				<p class="text1">HARRYPOTTER™</p><br>
				<p class="text2">해리포터 레고, 3명의 마법사 아이들과  모험.</p>
			</div>
		</a>
	</div>
	<div class="list">
		
	</div>
</div>