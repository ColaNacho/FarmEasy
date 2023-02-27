<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="images/favi.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/css/layout.css">
<link rel="stylesheet" href="/css/style.css">
<title>귀농쉽농</title>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/77e29b57dd.js" crossorigin="anonymous">
</script>
<script src="/js/index2.js"></script>
<script src="/js/index.js" defer></script>
</head>
<body id="body">
	<!-- nav 시작 -->
	<!-- container -->
	<nav class="navbar">
		<!-- logo -->
		<div class="navbar-logo">
			<a href="/">귀농쉽농</a>
		</div>
		<!-- menu -->
		<ul class="navbar-menu">
			<li class="depth1"><a href="a_select_step">길라잡이</a>
				<ul class="submenu">
					<li><a href="a_select_step">귀농절차</a></li>
					<li><a href="a_select_chung">지역선정</a></li>
				</ul></li>
			<li class="depth1"><a href="b_all_info">정책 조회</a>
				<ul class="submenu">
					<li><a href="/b_all_info/충청">충청도 정책</a></li>
					<li><a href="/b_all_info/경상">경상도 정책</a></li>
					<li><a href="/b_all_info/전라">전라도 정책</a></li>
				</ul></li>
			<li class="depth1"><a href="/c_bigData/포도">농작물 빅데이터</a></li>
			<li class="depth1"><a href="/d_board">게시판</a>
				<ul class="submenu">
					<li><a href="/d_board">게시판</a></li>
					<li><a href="/d_notice">갤러리</a></li>
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

	<div id="layout">
		<div class="box1"></div>
		<div class="box2">
			<div id="graph">
				<h2 style="font-weight: 700;">귀농의 첫걸음</h2>
				<p>성공적인 귀농을 위해서</p>
				<p>5단계의 귀농절차를 확인해보세요.</p>
				<ul id="banner-bt-m">
					<li><a href="index_check">귀농 자가 진단하기</a></li>
					<li><a href="index_recommend">지역/농작물 추천</a></li>
				</ul>
			</div>
		</div>
		<!-- layout -->

		<!-- <div class="box3"> 
          <img src="../images/graph.png">
      </div> -->
	</div>

	<div id="gra-container" class="wi">

		<div class="main_gra gra_left">
			<h4 class="font-color-title">성공·우수 사례</h4>
			<span></span><a
				href="https://returnfarm.com:444/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseListAjax			
      "
				target="_blank" id="plus_info">+</a></span>
			<!-- Tab links -->
			<div class="tab">
				<input type="radio" id="tab1" name="tabs" checked=""
					class="tablinks" onclick="openCity(event, 'chung')"> <label
					for="tab1">충청도</label> <input type="radio" id="tab2" name="tabs"
					class="tablinks" onclick="openCity(event, 'gyeong')"> <label
					for="tab2">경상도</label> <input type="radio" id="tab3" name="tabs"
					class="tablinks" onclick="openCity(event, 'jeol')"> <label
					for="tab3">전라도</label>
			</div>

			<div id="chung" class="tabcontent">
				<table class="good_table">
					<tr>
						<th>시·군</th>
						<th>제목</th>
						<th>작목</th>
					</tr>
					<tr>
						<td>충주시</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001352
                "
							target="_blank">“용기(勇氣)란 두렵지만 하는 것”</a></td>
						<td>수박</td>
					</tr>
					<tr>
						<td>괴산군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001350
                "
							target="_blank">귀농은 현실,강한 체력·성실·인내심 필수</a></td>
						<td>콩</td>
					</tr>
					<tr>
						<td>진천군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001158
                "
							target="_blank">토마토, 매출 편차 적어 귀농인에게 적합</a></td>
						<td>토마토</td>
					</tr>
					<tr>
						<td>청양군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001363
                "
							target="_blank">표고버섯은 나의 운명</a></td>
						<td>표고버섯</td>
					</tr>
					<tr>
						<td>논산시</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001000
                "
							target="_blank">딸기체험 농촌 교육 농장, 인큐베이터팜을 아시나요?</a></td>
						<td>딸기</td>
					</tr>
				</table>
			</div>

			<div id="gyeong" class="tabcontent">
				<table class="good_table">
					<tr>
						<th>시·군</th>
						<th>제목</th>
						<th>작목</th>
					</tr>
					<tr>
						<td>청도군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001364
              "
							target="_blank">느리지만 천천히... 재료에 마음을 담다</a></td>
						<td>팥</td>
					</tr>
					<tr>
						<td>의성군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001359
              "
							target="_blank"> ‘굿바이’ 스트레스, 마늘에서 답을 찾다</a></td>
						<td>마늘</td>
					</tr>
					<tr>
						<td>포항시</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001353
              "
							target="_blank">지진이 앞당겨준 귀농, 인생을 치유하다</a></td>
						<td>조미채소류</td>
					</tr>
					<tr>
						<td>밀양시</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001464
              "
							target="_blank">강화석씨 귀농이야기</a></td>
						<td>설향</td>
					</tr>
					<tr>
						<td>창녕군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001450
              "
							target="_blank">제2의 인생을 위해 귀농한 어머니와 한의대를 나온 아들이 <br>함께
								일구고 있는 하늘샘푸드 이야기
						</a></td>
						<td>땅콩</td>
					</tr>
				</table>
			</div>

			<div id="jeol" class="tabcontent">
				<table class="good_table">
					<tr>
						<th>시·군</th>
						<th>제목</th>
						<th>작목</th>
					</tr>
					<tr>
						<td>고창군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001491
                "
							target="_blank">21세기형 고창 농업 이야기<br> 02. 유튜브로 사람들과 소통하는
								새로운 농업
						</a></td>
						<td>편백나무</td>
					</tr>
					<tr>
						<td>고창군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001490
                "
							target="_blank">21세기형 고창 농업 이야기 <br>01. 몸과 마음을 허브로 치유해주는
								고창의 정원
						</a></td>
						<td>식용허브</td>
					</tr>
					<tr>
						<td>고창군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001489
                "
							target="_blank">고창 귀농귀촌 이야기<br> 10. 잠잘 때도 수박생각, 내일이
								기다려져요
						</a></td>
						<td>수박</td>
					</tr>
					<tr>
						<td>강진군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001420
                "
							target="_blank">"대한민국 농촌 귀농귀촌자가 바꾼다는 자부심"</a></td>
						<td>골드키위</td>
					</tr>
					<tr>
						<td>강진군</td>
						<td><a
							href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001421
                "
							target="_blank">강진 귀농 6년차, 샤인머스켓 수출의 전설이 되다</a></td>
						<td>포도</td>
					</tr>
				</table>
			</div>
		</div>

		<!-- 귀농 관련 뉴스 하단 우측 -->



		<div class="main_gra gra_right">
			<h4 class="font-color-title">귀농 관련 뉴스</h4>
			<a
				href="https://www.knongnews.com/news/articleList.html?sc_section_code=S1N38&view_type=sm"
				target="_blank" id="plus_info">+</a>
			<hr>
			<ol class="news_list">
				<li><span> <a
						href="https://jnfarm.jeonnam.go.kr/board/FARM_BOARD_008/boardView.do?menuCd=farm004002&currentPageNo=1&boardId=FARM_BOARD_008&bdId=BD_00000000000007427&categoryId=&searchSelect=&nPageSize=&keyWord=&pwCk="
						target="_blank">[전남] 전남 귀농어귀촌 종합평가서 고흥군 최우수</a>
				</span> <span>2022-12-01</span></li>
				<li><span> <a
						href="https://www.knongnews.com/news/articleView.html?idxno=16077"
						target="_blank"> 농작물 소득 16% 상승... 양송이 버섯 소득 가장 높아</a>
				</span> <span>2022-12-01</span></li>
				<li><a
					href="https://jnfarm.jeonnam.go.kr/board/FARM_BOARD_008/boardView.do?menuCd=farm004002&currentPageNo=1&boardId=FARM_BOARD_008&bdId=BD_00000000000007409&categoryId=&searchSelect=&nPageSize=&keyWord=&pwCk="
					target="_blank">[전남] 장성 농업인들 12년만에 ‘뭉쳤다’...일류농업 선도 다짐</a><span>2022-11-30</span></li>
				<li><a
					href="https://www.knongnews.com/news/articleView.html?idxno=16061"
					target="_blank">버려지는 감귤 부산물, 버섯 배지로 활용</a><span>2022-11-29</span></li>
				<li><a
					href="http://www.knongnews.com/news/articleView.html?idxno=16052"
					target="_blank">파프리카 병‧충해 진단에 ‘인공지능’ 활용한다</a><span>2022-11-28</span></li>
				<li><a
					href="http://www.knongnews.com/news/articleView.html?idxno=16014"
					target="_blank">정부 행정 달라질까?</a><span>2022-11-17</span></li>
			</ol>
		</div>

	</div>

	<button class="tablinks" onclick="openCity(event, 'chung')"
		id="defaultOpen" style="display: none;">chung</button>

	<footer>
		<div class="container">
			<div>
				<span>&copy; 귀농 인구를 위한 지역 및 농작물 추천 서비스</span>
			</div>
			<ul>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<img src="/images/iconmonstr-twitter-4.svg"></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<img src="/images/iconmonstr-facebook-4.svg"></svg></a></li>
				<li class="ms-3"><a class="text-muted" href="#"><svg
							class="bi" width="24" height="24">
							<img src="/images/iconmonstr-instagram-14.svg"></svg></a></li>
			</ul>
		</div>
	</footer>

	<!-- 배너 하단 좌측 selected 기능 -->
	<script>document.getElementById("defaultOpen").click();</script>

</body>
</html>

