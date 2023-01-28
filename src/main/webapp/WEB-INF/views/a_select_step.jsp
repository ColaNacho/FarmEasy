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
<link rel="stylesheet" href="css/select_step.css">
<title>길라잡이</title>
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
			<a href="index">귀농쉽농</a>
		</div>
		<!-- menu -->
		<ul class="navbar-menu">
			<li class="depth1"><a href="/a_select_step">길라잡이</a>
				<ul class="submenu">
					<li><a href="a_select_step">귀농절차</a></li>
					<li><a href="a_select_chung">지역선정</a></li>
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




	<div id="sub-title" class="wd-basic-960 mb-auto">귀농 절차</div>

	<div id="sta-location" class="wd-basic-960">
		<ul>
			<li></li>
			<li><a href="index.jsp">홈&nbsp;</a>&nbsp;>&nbsp;귀농
				절차&nbsp;&nbsp;</li>
		</ul>
	</div>

	<div class="wd-basic-960 mb-auto">
		<div id="sr_top">
			<div>
				<img src="images/milestones.png" width="100px;" height="100px;">
			</div>
			<div>
				<h2>
					귀농절차<span>에서는</span>
				</h2>
				<p>귀농 준비시 나의 단계는 어떤 단계인지 판단해 보실 수 있으며, 각 단계에서 어떤 사항을 고려해야 하는 지를
					알아보실 수 있습니다.</p>
			</div>
		</div>
		<!-- sr-top 귀농 절차에서는 -->

		<div id="f-step">
			<div>
				<div>1단계</div>
			</div>
			<div>
				<ul>
					<li>귀농정보 수집</li>
					<li>지금까지 살아왔던 생활기반을 떠나 농촌에서 농업에 종사한다는 것은 쉬운 일이 아니다. 귀농을 결심 하는
						단계는 사전 정보습득과 탐구하는 시간으로, 짧게는 몇 달에서 길게는 2~3년 이상 걸린다.</li>
					<li>이 기간 동안 농업관련 기관이나 단체, 농촌지도자, 선배 귀농인을 방문하여 필요한 정보를 수집한 후,
						귀농에 자신감과 확신이 생길 때 귀농에 대한 결심을 굳혀야 한다. 또한 안정적인 정착 시기까지 여유자금이 확보 되어야
						한다.</li>
					<li>나는 왜 귀농·귀촌을 하려고 하는가?귀농·귀촌의 장·단점은? 등 질문을 끊임없이 자신에게 물어야 한다.</li>
					<li>귀농귀촌종합센터' 홈페이지 - '귀농귀촌상담' - '자가진단' 을 이용해 보아도 좋을 것이다.</li>
					<li><a
						href="/FarmEasy/index_check.jsp">귀농
							자가진단 해보기 <span> > </span>
					</a></li>
				</ul>
			</div>
		</div>
		<!-- f-step 1번째 스텝 -->

		<div id="f-step">
			<div>
				<div>2단계</div>
			</div>
			<div>
				<ul>
					<li>농가 방문 및 영농체험</li>
					<li>농촌에서 생활해 본 경험이 없는 사람은 현재의 농촌을 낭만적으로 보거나 가난하고 배움이 적은 사람들이
						사는 지역으로생각하기 쉽다.</li>
					<li>귀농을 계획하는 가족의 입장에서는 친척농가나 홈스테이 농가에서 잠을 자면서 일상의 농촌생활을 관찰하고 더
						나아가 농사일에 직접 참여해봄으로써 농촌 환경에 대한 가족의 정신적 육체적 적응성을 1차 가늠해 보아야 한다.</li>
					<li>요즘은 농촌에서 자랐어도 영농경험이 없는 경우가 대부분이다. 따라서 영농을 직접 체험해 봄으로써
						도시활동에서 잘 경험하지 못하는 '땀 흘린 뒤의 쾌감'을 느껴 보기도 하고, 자연과 더불어 사는 방법을 배워야 한다.
						체험방법에는 농촌일손돕기, 농장체험 등이 있다.</li>
					<li>주말농장은 자신과 가족이 농업에 대한 적응성을 검증하는 시험포장이다. 땅을 가꾸며 작물을 수확하고, 소,
						애완용 강아지 등 작은 가축을 기르면서 탄생의 기쁨을 맛보고, 농촌에서만 할 수 있는 품앗이처럼 이웃과의 어우러진 삶은
						값진 경험이 될 것이며, 귀농에 대한 흥미와 자신감을 끌어낼 수 있는 좋은 기회가 될 것이다.</li>
					<li><a
						href="http://www.returnfarm.com/cmn/returnFarm/module/eduAkademy/rfAkademyMain.do">귀농귀촌
							기초소양교육 ></a></li>
				</ul>
			</div>
		</div>
		<!-- f-step 2번째 스텝 -->

		<div id="f-step">
			<div>
				<div>3단계</div>
			</div>
			<div>
				<ul>
					<li>작목선택 및 영농기술 습득</li>
					<li>자신의 여건과 적성, 기술수준, 자본능력 등에 적합한 작목을 신중하게 선택한다.</li>
					<li>대상작물을 선택한 후에 바로 농지로 가는 것이 아니라 이를 재배할 수 있는 영농기술을 익혀야한다.
						농업기술교육은 도농업기술원, 시·군 농업기술센터, 귀농교육기관 등에서 받을 수 있으며 농림축산식품부의 귀농귀촌종합센터
						홈페이지를 방문하면 교육정보를 쉽게 얻을 수 있다.</li>
					<li>이러한 프로그램에는 귀농자 교육프로그램, 귀농에 성공한 농가 견학 그리고 현장체험 등이 있으며 실제
						농사에 필요한 영농기술을 익힐 수 있는 실습 중심 교육도 있다. 이러한 영농기술 습득 단계를 통해 영농에 대한 자신감과
						의지를 고취시키는 과정은 귀농의 큰 자산이 된다.</li>
					<li>귀농귀촌 자체교육을 포함한 귀농자 교육프로그램과 귀농에 성공한 농가 견학, 현장 체험들을 통해 충분히
						영농 기술을 배우고 익힙니다.</li>
					<li><a href="http://soil.rda.go.kr/soil/soilmap/crop.jsp">재배적지
							확인하러가기 ></a></li>
				</ul>
			</div>
		</div>
		<!-- f-step 3번째 스텝 -->

		<div id="f-step">
			<div>
				<div>4단계</div>
			</div>
			<div>
				<ul>
					<li>정착지 물색</li>
					<li>자녀교육 등 생활여건과 선정된 작목에 적합한 입지조건이나 농업여건 등을 고려하여 정착지를 물색하고
						결정합니다.</li>
					<li>가용예산과 주거환경, 농작물 재배환경 등을 종합적으로 고려하여 각각의 여건을 정밀하게 조사하여 선택하여야
						한다.</li>
					<li>선택작목에 따라 정착지의 위치가 크게 달라지는데, 예를 들어 과수나 낙농, 한우사육을 할 경우는 준산간
						지역을, 시설채소를 중심으로한 집약적 농업을 할 경우에는 도시 근교를, 벼농사를 할 경우에는 평야 지역을 정착지로
						선정하는 것이 바람직하다.</li>
					<li>인터넷과 부동산 중개업소를 통해 농지 및 농가주택을 구일합 경우는 반드시 나침반을 가지고 현장을
						확인해봄은 물론 시·군청 민원실을 방문하여 토지, 건축물의 등기, 소유 여부, 담보 상태등을 꼼꼼히 확인해 보아야
						한다.</li>
					<li><a href="https://www.welchon.com/web/index.do">여행으로 지역
							체크 > </a></li>
				</ul>
			</div>
		</div>
		<!-- f-step 4번째 스텝 -->

		<div id="f-step" class="mb-5">
			<div>
				<div>5단계</div>
			</div>
			<div>
				<ul>
					<li>영농계획 수립</li>
					<li>충분한 생활자금을 갖고 여유있는 노후를 즐기기 위한 귀농이 아니라면 합리적이고 치밀한 영농계획을 세워야
						한다.</li>
					<li>생계형 영농은 회사를 경영하는 마음으로 최소 6개월에서 길게는 4~5년 이상의 계획을 가져야 한다.</li>
					<li>초보 귀농인은 가격 변동이 적은 작목, 영농기술과자본이 적게 드는 작목을 중심으로 영농계획을 수립하여
						귀농 첫 해부터 어려움을 피해 나가도록 하는 편이 좋다.</li>
					<li>영농계획은 시·군 농업기술센터의 작물 재배력을 참고하여 농작업 시기나 자재준비 등을 놓치지 않도록
						꼼꼼하게 살피고 농업기술센터에서 검토와 지도를 받는 것이 좋다.</li>
					<li><a
						href="http://www.returnfarm.com/cmn/returnFarm/locgov/locgovMain.do?submitFunction=exclncCaseListAjax">관련
							우수 사례 > </a></li>
				</ul>
			</div>
		</div>
		<!-- f-step 5번째 스텝 -->
	</div>

	<div class="wd-basic-960 mb-auto mb-5" id="sr_more_info">
		<a href="#"><p>충청도 / 전라도 / 경상도 귀농 관련 정보 보러가기</p></a>
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