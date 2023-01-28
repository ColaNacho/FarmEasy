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
<link rel="stylesheet" href="css/notice.css">
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
			<a href="/index.jsp">귀농쉽농</a>
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


	<div id="sub-title" class="wd-basic-960 mb-auto">갤러리</div>

	<div id="sta-location" class="wd-basic-960">
		<ul>
			<li></li>
			<li><a href="index.jsp">홈&nbsp;</a>
				&nbsp;>&nbsp;갤러리&nbsp;&nbsp;</li>
		</ul>
	</div>

	<div class="wd-basic-960 mb-auto" id="gallery_photo"
		style="height: 600px;">
		<h3>귀농 성공·우수 사례</h3>
		<span class="gallery_total">총 123건</span>
		<div class="ga_table_div">
			<table>
				<tr>
					<!-- 이미지 -->
					<td rowspan="3" class="ga_tr_bottom ga_td_left"><img
						src="images/gallery01.png"></td>
					<!-- 타이틀 -->
					<td class="ga_td_right ga_title"><a
						href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001491
              "
						target="_blank"> 21세기형 고창 농업 이야기 02. 유튜브로 사람들과 소통하는 새로운 농업</a></td>
				</tr>
				<!-- 부제 -->
				<tr class="ga_td_middle">
					<td class="ga_td_right">21세기형 고창 농업 이야기 02. 유튜브로 사람들과 소통하는 새로운
						농업</td>
				</tr>
				<!-- 작목 / 지역 -->
				<tr>
					<td class="ga_tr_bottom ga_td_right" style="padding-top: 23px;">
						<span>작목</span>: 목재류 > 원목 >
						편백나무&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span>지역</span>: 전라북도
						고창군
					</td>
				</tr>

				<tr>
					<!-- 이미지 -->
					<td rowspan="3" class="ga_tr_bottom ga_td_left"><img
						src="images/gallery02.png"></td>
					<!-- 타이틀 -->
					<td class="ga_td_right ga_title"><a
						href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001490
              "
						target="_blank">21세기형 고창 농업 이야기 01. 몸과 마음을 허브로 치유해주는 고창의 정원</td>
				</tr>
				<!-- 부제 -->
				<tr class="ga_td_middle">
					<td class="ga_td_right">21세기형 고창 농업 이야기 01. 몸과 마음을 허브로 치유해주는
						고창의 정원</td>
				</tr>
				<!-- 작목 / 지역 -->
				<tr>
					<td class="ga_tr_bottom ga_td_right" style="padding-top: 23px;">
						<span>작목</span>: 양채류 > 식용허브 >
						허브(일반)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span>지역</span>: 전라북도
						고창군
					</td>
				</tr>



				<tr>
					<td rowspan="3" class="ga_td_left"><img
						src="images/gallery03.png"></td>
					<td class="ga_td_right ga_title"><a
						href="http://returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseDetailAjax&submitParam=RFEXCA_0000000001489
              "
						target="_blank">고창 귀농귀촌 이야기 10. 잠잘 때도 수박생각, 내일이 기다려져요</td>
				</tr>
				<tr class="ga_td_middle">
					<td class="ga_td_right ga_td_middle">고창 귀농귀촌 이야기 10. 잠잘 때도
						수박생각, 내일이 기다려져요</td>
				</tr>
				<tr>
					<td class="ga_tr_bottom ga_td_right" style="padding-top: 23px;">
						<span>작목</span>: 과일과채류 > 수박 >
						일반(지역)&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; <span>지역</span>: 전라북도
						고창군
					</td>
				</tr>
			</table>
		</div>
	</div>


	<!-- 갤러리 끝 -->

	<div style="text-align: center;" class="mb-5" id="no_paging">
		<p>
			<span> < </span> <span> 1 </span> <span> 2 </span> <span> 3 </span> <span>
				4 </span> <span> 5 </span> <span> > </span>
		</p>
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