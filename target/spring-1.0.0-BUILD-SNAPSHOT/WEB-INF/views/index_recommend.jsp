<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="images/favi.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/index_check_recommed.css">
<title>게시판</title>

<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/77e29b57dd.js"
	crossorigin="anonymous"></script>
<script src="js/index.js" defer></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<!-- nav 시작 -->
	<!-- container -->
	<nav class="navbar">
		<!-- logo -->
		<div class="navbar-logo">
			<a href="index">귀농쉽농</a>
		</div>
		<!-- menu -->
		<ul class="navbar-menu">
			<li class="depth1">
				<a href="/a_select_step">길라잡이</a>
				<ul class="submenu">
					<li><a href="a_select_step">귀농절차</a></li>
					<li><a href="a_select_chung">지역선정</a></li>
				</ul>
			</li>
			<li class="depth1"><a href="/b_all_info">정책 조회</a>
				<ul class="submenu">
					<li><a href="/b_all_info/충청">충청도 정책</a></li>
					<li><a href="/b_all_info/경상">경상도 정책</a></li>
					<li><a href="/b_all_info/전라">전라도 정책</a></li>
				</ul></li>
			<li class="depth1"><a href="/c_bigData/포도">농작물 빅데이터</a></li>
			<li class="depth1"><a href="/d_board">게시판</a>
				<ul class="submenu">
					<li><a href="/d_board">게시판</a></li>
					<li><a href="d_notice">갤러리</a></li>
				</ul>
			</li>
		</ul>
		<!-- icon -->
		<ul class="navbar-icon">
	 	<c:choose>
		<c:when test="${mvo.m_id eq null}">
				<li><a href="/e_login">로그인</a></li>
				<li><a href="/e_signup">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/e_logout">로그아웃</a></li>
				<li><a href="/f_myPage/${mvo.m_seq}">${mvo.m_id} 님</a></li>
			</c:otherwise>
		</c:choose> 
		</ul>
		<a href="#" class="navbar-more"> <i class='fa fa-bars'
			style='color: white; margin-top: 14px;'></i>
		</a>
	</nav>


	<!-- nav 끝 -->


	<div class="wd-basic-960 mb-auto mb-5" id="recommend_wrap">
		<h2>원하는 태그를 선택해주세요!</h2>
		<form>
			<div>
				<div class="check_region">
					<input type="checkbox" id="check1" name="chung" value="c" checked>
					<label for="check1">편리한 지리적 위치</label> <input type="checkbox"
						id="check2" name="chung" value="c"> <label for="check2">서울·경기
						근접</label> <input type="checkbox" id="check3" name="chung" value="c">
					<label for="check3">새콤달콤 딸기</label> <input type="checkbox"
						id="check4" name="chung" value="c"> <label for="check4">새콤달콤
						포도</label>
				</div>
				<div class="check_region">
					<input type="checkbox" id="check5" name="gyeong" value="g">
					<label for="check5">새콤달콤 국밥</label> <input type="checkbox"
						id="check6" name="gyeong" value="g"> <label for="check6">갱상도
						돼지극밥</label> <input type="checkbox" id="check7" name="gyeong" value="g">
					<label for="check7">아삭아삭 사과</label> <input type="checkbox"
						id="check8" name="gyeong" value="g"> <label for="check8">알싸한
						마늘</label>
				</div>
				<div class="check_region">
					<input type="checkbox" id="check9" name="jeolla" value="j">
					<label for="check9">새콤달콤 마이쮸</label> <input type="checkbox"
						id="check10" name="jeolla" value="j"> <label for="check10">으사
						으부증</label> <input type="checkbox" id="check11" name="jeolla" value="j">
					<label for="check11">새콤달콤 참다래</label> <input type="checkbox"
						id="check12" name="jeolla" value="j"> <label for="check12">양파</label>
				</div>
			</div>

			<div class="result_recommed wd-basic-960 mb-auto mb-4">
				<input type="submit" value="결과보기"></input>
			</div>
		</form>

	</div>


	<div class="wd-basic-960 mb-auto" id="region_result">
		<h2 class="mb-2">
			추천 지역은 <span>충청도</span>입니다!
		</h2>
		<h2 class="mb-4">
			추천 농산물은 <span>딸기, 포도</span>입니다.
		</h2>
		<ul>
			<li class="produce_1">
				<h5>
					<img src="images/non_straw2.jpg">
				</h5>
				<h4 class="mt-5">딸기하면 생각나는 논산딸기</h4>
				<p>1997년부터 매년 봄 논산딸기축제를 개최할 정도로 유명</p>
				<p>논산시는 전국 딸기 생산량의 약 15퍼센트, 충남 지역 딸기 생산량의 약 50퍼센트를 차지하는 전국 최대의
					딸기 주산지</p>
				<p>1)기름진 농토, 2)높은 당도, 3)우량묘, 4)천적을 이용한 해충방제, 5)수출, 6)투명용기로 소비자
					신뢰</p>
				<p>수확시기 : 11월말~6월 1월이 되면 작목반이 다 같이 출하</p>
				<p>논산딸기 좋은 이유 : 논산 딸기는 180여개 딸기작목반이 구성되어 있고 각 읍면단위의 농업협동조합에서
					출하지원을 하고 있습니다.</p>
			</li>
			<li class="produce_2"></li>
		</ul>
	</div>

	<!-- 푸터 -->
	<footer>
		<div class="container">
			<div>
				<span>&copy; 귀농 인구를 위한 지역  및 농작물 추천 서비스</span>
			</div>
			<ul>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<img src="images/iconmonstr-twitter-4.svg"></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<img src="images/iconmonstr-facebook-4.svg"></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<img src="images/iconmonstr-instagram-14.svg"></svg></a></li>
			</ul>
		</div>
	</footer>

</body>
</html>