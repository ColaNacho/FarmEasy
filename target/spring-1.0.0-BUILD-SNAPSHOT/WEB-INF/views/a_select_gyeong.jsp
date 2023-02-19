<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="images/favi.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/select_gyeong.css">
<title>지역 선정</title>
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/77e29b57dd.js"
	crossorigin="anonymous">
</script>
<script src="js/index.js" defer></script>
</head>
<body>
	<!-- nav 시작 -->
	<!-- container -->
	<nav class="navbar">
		<!-- logo -->
		<div class="navbar-logo">
			<a href="/index">귀농쉽농</a>
		</div>
		<!-- menu -->
		<ul class="navbar-menu">
			<li class="depth1"><a href="/a_select_step">길라잡이</a>
				<ul class="submenu">
					<li><a href="/a_select_step">귀농절차</a></li>
					<li><a href="/a_select_chung">지역선정</a></li>
				</ul></li>
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




	<div id="sub-title" class="wd-basic-960 mb-auto">지역 선정</div>

	<div id="sta-location" class="wd-basic-960 mb-5">
		<ul>
			<li>
				<span><a href="/a_select_chung">충청도</a></span> 
				<span>경상도</span>
				<span><a href="/a_select_jeolla">전라도</a></span>
			</li>
			<li>
				<a href="/index">홈&nbsp;</a> 
				<span>&nbsp;&nbsp;>&nbsp;&nbsp;지역선정&nbsp;</span> 
				<span>&nbsp;&nbsp;>&nbsp;&nbsp;경상도&nbsp;&nbsp;</span>
			</li>
		</ul>
	</div>

	<!-- 테이블 닫아두니깐 확인하기 ▼ -->

	<div class="wd-basic-960 mb-5 sta-location">
		<h1 style="color: #3155a4;" class="mb-2">기후</h1>
		<table>
			<tr>
				<td class="region">지역</td>
				<td>평균 최저 / 최고</td>
				<td>봄</td>
				<td>여름</td>
				<td>가을</td>
				<td>겨울</td>
			</tr>
			<tr>
				<th rowspan="2" class="region">경남 김해시, 경남 창원시</th>
				<td class="max_min">최고</td>
				<td>20.1</td>
				<td>29.6</td>
				<td>22.2</td>
				<td>9.3</td>
			</tr>
			<tr>
				<td class="max_min">최저</td>
				<td>9.5</td>
				<td>21.4</td>
				<td>12.8</td>
				<td>-0.9</td>
			</tr>
			<tr>
				<th rowspan="2" class="region">경북 구미시, 경북 경주시</th>
				<td class="max_min">최고</td>
				<td>20.1</td>
				<td>29.8</td>
				<td>21.3</td>
				<td>8.7</td>
			</tr>
			<tr>
				<td class="max_min">최저</td>
				<td>7.6</td>
				<td>20.6</td>
				<td>10.4</td>
				<td>-3.5</td>
			</tr>
			<tr>
				<th rowspan="2" class="region">경북 포항시, 경남 통영시</th>
				<td class="max_min">최고</td>
				<td>20.1</td>
				<td>28.3</td>
				<td>21.9</td>
				<td>9.6</td>
			</tr>
			<tr>
				<td class="max_min">최저</td>
				<td>10.3</td>
				<td>22.3</td>
				<td>14.0</td>
				<td>0.4</td>
			</tr>
			<tr>
				<th rowspan="2" class="region last_line">경북 영천시, 경북 문경시, <br>경남
					밀양시, 경남 진주시
				</th>
				<td class="max_min">최고</td>
				<td>20.1</td>
				<td>29.6</td>
				<td>21.3</td>
				<td>8.5</td>
			</tr>
			<tr>
				<td class="max_min">최저</td>
				<td>6.9</td>
				<td>20.3</td>
				<td>9.9</td>
				<td>-4.1</td>
			</tr>
		</table>
	</div>

	<!-- 테이블 닫아두니깐 확인하기 ▲ -->


	<!-- 지역 소개 -->
	<div class="wd-basic-960 mb-5 br-e sr_div_margin_height introduce">
		<h1 style="color: #3155a4;" class="mb-4">지역 소개</h1>

		<!-- 지도 -->
		<div class="sr_map">
			<img src="images/gyeong.svg" width="260">
		</div>
		<div class="sr_map_detail">
			<ul>
				<li>경상도는 동남부에 위치하며 경상북도와 경상남도, 부산광역시, 대구광역시, 울산광역시 일대를 관할하는
					행정구역으로, 영남 지방에 해당한다.</li>
				<li>대한민국 인구의 24.69%를 차지하고 있으며 면적이 가장 넓고, 남부 지방이라는 인식이 있지만, 경상북도
					위쪽은 위도가 높아 중부 지방에 가깝다.</li>
				<li>내륙 지방은 위도에 비해 한서의 차이가 심하고 강수량이 적고, 동해안 지역은 대체로 온화하고 한서의 차이가
					적으며 강우가 빈번히 나타난다.</li>
				<li>경상남도 남쪽은 바다와 접하여 바다의 영향이 크며, 북서쪽에는 높은 산맥이 겨울의 찬 서북풍을 막음으로써
					전체적으로 온화한 편이다.</li>
			</ul>
		</div>
	</div>


	<!-- 추천 농작물 -->
	<div class="wd-basic-960 mb-5 recommend sta-location ">
		<h1 style="color: #3155a4; margin-bottom: 1.8rem;">추천 농작물</h1>
		<p>
			<strong>마늘 수확 기간</strong> : 5월 하순 <b
				style="margin: 0 30px 0 31px; font-weight: normal;"> </b> <strong>평균
				소득율</strong> : 59.7%<span>기준 : 1년1기작/10a</span>
		</p>
		<p>
			<strong>사과 수확 시기</strong> : 6월 하순 <b
				style="margin: 0 30px 0 32px; font-weight: normal;"> </b> <strong>평균
				소득율</strong> : 49.6%<span>기준 : 1년/10a</span>
		</p>
		<p>
			<strong>양파 수확 기간</strong> : 6월 <b
				style="margin: 0 30px 0 66px; font-weight: normal;"> </b> <strong>평균
				소득율</strong> : 54.5%<span>기준 : 1년1기작/10a</span>
		</p>
		<a href="http://soil.rda.go.kr/soil/soilmap/crop.jsp"><p
				class="check_soil">재배 적지 확인하러 가기</p></a>
	</div>

	<div class="wd-basic-960 mb-5 br-e f-money sta-location">
		<h1 style="color: #3155a4; height: 70px;">초기 자본금</h1>
		<p>
			<최근 귀농·귀촌 실태와 시사점>에 따르면, 귀농·귀촌을 해서 정착하는 데 드는 <b>평균 비용은 1억
				7000여만 원</b>
		</p>
		<p>평균 3년간의 생활비 필요. 최소 2~3년은 수입 없이 버틸 수 있을 정도의 정착 자금 마련이 필수적이다.</p>
		<p>- 귀농 준비 자금(주택 및 토지 구입 자금 등)부터 영농자금(농기계 구입, 설비 투자, 종묘 및 비료 등
			구입), 생활비 등에 대해 분석한 후 자금 계획을 수립해야 한다.</p>
		<p>- 한 달 단위 최소 생활비를 책정하고, 넘지 않는 범위에서 생활하도록 하는데, 도시 생활과 비교해 늘어나는
			지출과 줄어드는 부분을 잘 따져 계획을 세워야 한다.</p>
		<p>- 정책자금은 선착순으로 신청 가능하므로 자금 계획을 미리 하여 적기에 신청하고, 특히 정책에 필요한 요건을 즉시
			만들 수 있는 것이 아니므로 창업 초기부터 체계적인 계획을 수립하여 단계적으로 추진해 나가는 것이 바람직하다.</p>
		<a href="b_gyeongsang_info.jsp"><p class="check_soil">경상도 정책
				조회 하러 가기</p></a>
	</div>


	<div class="wd-basic-960 mb-5 br-e sta-location">
		<h1 style="color: #3155a4; margin-bottom: 1.8rem;">학교/병원 수</h1>
		<p class="mb-2">
			<b>초등학교</b> : 982 &nbsp; | &nbsp; <b>중학교</b> : 526 &nbsp; | &nbsp; <b>고등학교</b>
			: 375
		</p>
		<p>
			<b>병원(응급실 보유)</b> : 87
		</p>
	</div>


	<!-- 프로그램 -->
	<div class="wd-basic-960 sr_program_mr-auto">
		<h1 style="color: #3155a4; margin-bottom: 1.8rem;">
			프로그램 <span>[농촌에서 살아보기]</span>
		</h1>
		<div id="sr_program">
			<div class="sr_sub_title">
				진행중인 마을<span>모집인원</span>
			</div>
			<div id="gyeong" class="sr_program_list">
				<ul>
					<li><a
						href="https://www.returnfarm.com:444/cmn/returnFarm/module/readyReturnfarm/detail.do?townId=RRT_0000000071&townOpId=3021&operationOrder=3"
						target="_blank">[경북] 김천시 | 우두령마을 <span>4명</span></a></li>
					<li><a
						href="https://www.returnfarm.com:444/cmn/returnFarm/module/readyReturnfarm/detail.do?townId=RRT_0000000416&townOpId=1701&operationOrder=2"
						target="_blank">[경북] 영주시 | 피끝마을 <span>2명</span></a></li>
					<li><a
						href="https://www.returnfarm.com:444/cmn/returnFarm/module/readyReturnfarm/detail.do?townId=RRT_0000000105&townOpId=2461&operationOrder=3"
						target="_blank">[경북] 상주시 | 은자골마을 <span>1명</span></a></li>
					<li><a
						href="https://www.returnfarm.com:444/cmn/returnFarm/module/readyReturnfarm/detail.do?townId=RRT_0000000422&townOpId=3221&operationOrder=2"
						target="_blank">[경북] 상주시 | 정양마을 <span>3명</span></a></li>
					<li><a
						href="https://www.returnfarm.com:444/cmn/returnFarm/module/readyReturnfarm/detail.do?townId=RRT_0000000108&townOpId=1901&operationOrder=2"
						target="_blank">[경북] 의성군 | 일산자두골 <span>5명</span></a></li>
				</ul>
			</div>
		</div>
	</div>



	<footer>
		<div class="container">
			<div>
				<span>&copy; 귀농 인구를 위한 지역 및 농작물 추천 서비스</span>
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