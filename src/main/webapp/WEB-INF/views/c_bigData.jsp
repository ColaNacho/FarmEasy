<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/images/favi.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/bigData.css">
<title>농작물 빅데이터</title>

<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet" />
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/77e29b57dd.js"	crossorigin="anonymous"></script>
<!-- chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<!-- slide -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/js/index.js"></script>
<script src="/js/bigData.js"></script>
</head>
<body>
	<!-- nav 시작 -->
	<!-- container -->
	<nav class="navbar">
		<!-- logo -->
		<div class="navbar-logo">
			<a href="/">귀농쉽농</a>
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
					<li><a href="/d_notice">갤러리</a></li>
				</ul></li>
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
	<div id="sta-location" class="wd-basic-960">
		<ul>
			<li></li>
			<li><a href="/">홈&nbsp;</a>&nbsp;>&nbsp;&nbsp;농작물 빅데이터</li>
		</ul>
	</div>

	 <div class="tab mt-4">
	    <ul class="tabnav">
	      <li><a href="#tab01">충청도</a></li>
	      <li><a href="#tab02">경상도</a></li>
	      <li><a href="#tab03">전라도</a></li>
	    </ul>
	    	<div class="tabcontent">
		      <div id="tab01">
		      	<ul>
		      		<li class="product_N"><a href="/c_bigData/딸기">딸기</a></li>
		      		<li class="product_N"><a href="/c_bigData/포도">포도</a></li>
		      		<li>인삼</li>
		      		<li>생강</li>
		      		<li>고추</li>
		      		<li>토마토</li>
		      		<li>밤</li>
		      		<li>도라지</li>
		      		<li>호두</li>
		      		<li>수박</li>
		      	</ul>
		      </div>
		      <div id="tab02">
				<ul>
					<li class="product_N"><a href="/c_bigData/마늘" data-value="마늘">마늘</a></li> 
	      			<li class="product_N"><a href="/c_bigData/사과" data-value="사과">사과</a></li>
	      			<li>배</li>
		      		<li>표고버섯</li>
		      		<li>참외</li>
		      		<li>대추</li>
		      		<li>가지</li>
		      		<li>쌀</li>
		      		<li>파프리카</li>
		      		<li>단감</li>
		      	</ul>
			  </div>
		      <div id="tab03">
				<ul>
	      			<li class="product_N"><a  href="/c_bigData/참다래" data-value="참다래">참다래</a></li>
	      			<li class="product_N"><a  href="/c_bigData/양파" data-value="양파">양파</a></li>
	      			<li>방울토마토</li>
		      		<li>오디</li>
		      		<li>단감</li>
		      		<li>무화과</li>
		      		<li>매실</li>
		      		<li>오이</li>
		      		<li>수박</li>
		      		<li>복숭아</li>	      			
		      	</ul>
			  </div>		<!-- tab03 -->
		 	</div>		<!-- tabcontent -->
		</div>   <!-- tab -->


<div class="big_wrap mt-4 mb-4">
	<div class="wd-basic-960 mb-auto label_bigBox_wrap" style="height: auto;">
		<ul class="label_bigBox">
			<li><br>품목</li>
			<li><br>2022년 *${product.product_month}월 평균 가격</li>
			<li><span>*성출하기: 출하량이 많은 시기</span><br>2023년 *${product.product_month}월 예측가(중품/kg)</li>
		</ul>
	</div>

	<div class="wd-basic-960 mb-auto" style="height: auto;">
		<ul class="big_box">
			<li class="big_depth">
				<div class="item_box">
					<div class="item_img">
					<c:if test="${product.product_name eq '딸기'}">
						<img src="/images/strawberry.png">
					</c:if>
					<c:if test="${product.product_name eq '마늘'}">
						<img src="/images/garlic.png">
					</c:if>
					<c:if test="${product.product_name eq '포도'}">
						<img src="/images/grapes.jpg">
					</c:if>
					<c:if test="${product.product_name eq '양파'}">
						<img src="/images/onion.png">
					</c:if>
					<c:if test="${product.product_name eq '참다래'}">
						<img src="/images/kiwi.jpg">
					</c:if>
					<c:if test="${product.product_name eq '사과'}">
						<img src="/images/apple.png">
					</c:if>
					</div>
					<span class="item_name">${product.product_name}(kg)</span>
				</div> <!-- 아이템박스 -->
				<div class="day_before">
                    <b>${product.product_price}</b> (원)
                </div>
				<div class="click_graph">
					<span>${product.predict_price}</span> (원)
				</div>
            </li>
		</ul>
	</div>

</div> <!-- big_wrap -->

	<div class="wd-basic-960 predict_graph mb-4">
    	<canvas id="productChart" width="960px" height="250px"></canvas>
    </div>

    <div class="wd-basic-960 predict_detail">
		<a href="#" class="show_detail" onclick="show_detail()">
			<div class="up_price">[가격 <span class="red_color">상승</span> 요인]</div>
			<div class="down_price">[가격 <span class="blue_color">하락</span> 요인]</div>
		</a>
	</div>
	<div class="wd-basic-960 mb-5 hide_detail">
		<div class="up_price">
			<ul>
				<li>·&nbsp;&nbsp;&nbsp;전년도 재배면적 <span class="blue_color">▼</span></li>
				<li>·&nbsp;&nbsp;&nbsp;전년도 생산량 <span class="blue_color">▼</span></li>
				<li>·&nbsp;&nbsp;&nbsp;전년도 경영비 <span class="red_color">▲</span></li>
				<li>·&nbsp;&nbsp;&nbsp;전년도 8월 이상기후(호우, 태풍)</li>
			</ul>
		</div>
		<div class="down_price">
			<ul>
				<li>·&nbsp;&nbsp;&nbsp;전년도 재배면적 <span class="red_color">▲</span></li>
				<li>·&nbsp;&nbsp;&nbsp;전년도 생산량 <span class="red_color">▲</span></li>
				<li>·&nbsp;&nbsp;&nbsp;전년도 경영비 <span class="blue_color">▼</span></li>
			</ul>
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

<script>
const ctx = document.getElementById('productChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['2019', '2020', '2021', '2022', '2023'],
        datasets: [{
            label: '${product.product_name} (중품/kg)',
            fill: false,
            data: [${graphDataList.get(4)}, ${graphDataList.get(3)}, ${graphDataList.get(2)}, ${graphDataList.get(1)}, ${graphDataList.get(0)}],
            backgroundColor: [
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 99, 132, 1)',
                'rgba(255, 99, 132, 1)'
            ],
            borderColor: [
            	'rgba(54, 162, 235, 1)',
            	'rgba(54, 162, 235, 1)',
            	'rgba(54, 162, 235, 1)',
            	'rgba(255, 99, 132, 1)',
            	'rgba(255, 99, 132, 1)'
            ],
            borderWidth: 2
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: false
            }
        }
    }
});
</script>
<script>
      $(document).ready(function(){
          $(".show_detail").click(function(){
            $(this).parent().siblings('.hide_detail').slideToggle();
          });
      });
</script>

</body>
</html>