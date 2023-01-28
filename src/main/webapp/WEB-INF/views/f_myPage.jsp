<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="/images/favi.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/myPage.css">

<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet" />
<script src="https://kit.fontawesome.com/77e29b57dd.js"	crossorigin="anonymous"></script>
<script src="/js/mypage.js" defer></script>
<title>마이 페이지</title>
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


<div class="mypage_wrap">

    <div class="tab">
      <h4>마이페이지</h4>
      <button class="tablinks" onclick="openCity(event, 'myPage_list')" id="defaultOpen">- 정책 리스트 보기</button>
      <button class="tablinks" onclick="openCity(event, 'myPage_edit')" >- 회원 정보 수정</button>
      <button class="tablinks" onclick="openCity(event, 'myPage_remove')">- 회원 탈퇴</button>
      <button class="hidden_btn tablinks"  onclick="openCity(event, 'myPage_update')" style="display: none;" >이동</button>
      <!--  <button class="hidden_btn tablinks"  onclick="openCity(event, 'myPage_update')" style="display: none;"  id="defaultOpen" >이동</button>-->
    </div>


	<div id="myPage_list" class="tabcontent">
		      <ul class="myPage_hi">
		      	<li><img src="/images/user.png"></li>
		        <li><span>${mvo.m_id}</span>님,<br>안녕하세요.</li>
		        <li>리스트 수 <p>${listCount}</p></li>
		      </ul>
		<c:choose>
			<c:when test="${mvo.m_score eq null}">
		      <div class="myPage_score">아직 자가 진단을 하지 않았습니다. <a href="index_check"> 하러가기 ▶ </a></div>
		    </c:when>
		    <c:otherwise>
		      <div class="myPage_score">자가 진단 점수는 총 <span>${mvo.m_score}</span>점입니다.</div>
		    </c:otherwise>
		</c:choose> 
		      <h3 class="mt-5">추가한 리스트</h3>
		      <table>
		          <tr>
		            <td>번호</td>
		            <td>시군</td>
		            <td>시군구</td>
		            <td>정책명</td>
		          	<td>자세히보기</td>
		          </tr>
	          <c:forEach var="wish" items="${wishList}">
				<tr>
					<td>${wish.policy_id}</td>
					<td>${wish.sido}</td>
					<td>${wish.sigungu}</td>
					<td>${wish.policy_name}</td>
					<td><a href="/b_pop_info/${wish.policy_id}">[자세히 보기]</a></td>
				</tr>
			  </c:forEach>
		      </table>
	</div>
		
		
   		<div id="myPage_edit" class="tabcontent">
		    <h5>정보를 수정하시려면 비밀번호를 입력하세요.</h5>

		   <form name="myPage_edit_form" method="post" id="myPage_edit_form" onsubmit="return submitFunction()">
		      <div class="myPage_edit_name">비밀번호 <span></span>
		      <input class="myPage_edit_input" type="password" name="m_pw" id="m_pw">
		      </div>
		      <input type="hidden" value="${mvo.m_pw}" name="pw_session" type="text" id="pw_session">
		     <div class="mypage_edit_btn_wrap">
		      <input type="submit" value="정보수정" class="mypage_edit_btn">
		      </div>
		    </form>
		  </div> 
		  
		  <div id="myPage_update" class="tabcontent" >
		    <h5>정보 수정 페이지</h5>
		    <form name="myPage_form" method="post" id="myPage_form" onsubmit="return validate();" action = "/memberUpdate.do?m_seq=${mvo.m_seq}">
		    	 <div><span>성명</span><span><input name="m_name" value="${mvo.m_name}" readonly="readonly" /></span></div>
		    	 <div><span>아이디</span><span><input name="m_id" value="${mvo.m_id}" readonly="readonly" /></span></div>
		    	 <div><span>비밀번호 변경</span><input type="password" id="m_pw" name="m_pw"></div>
		    	 <div><span>비밀번호 확인</span><input type="password" id="m_pw_confirm" name="m_pw_confirm"></div>
				 <div><span>이메일 주소</span><input type="email" id="m_email" name="m_email" value="${mvo.m_email}"></div>
				 <!-- m_mobile은 위에서 사용중이라 moblie로 이름바꿈 -->
				 <div><span>휴대전화</span><input type="tel" name="m_mobile" id="m_mobile" required
				 onchange="check_phone()" value="${mvo.m_mobile}"></div>
				 <input type="submit" value="수정" id="success" name="success">
		    </form>
		  </div>
		
		  
		  <div id="myPage_remove" class="tabcontent">
		    <h5>탈퇴하시려면 비밀번호를 입력하세요.</h5>
		    <form name="myPage_remove_form" id="myPage_remove_form" action = "/memberDelete.do">
		      <div class="myPage_edit_name">비밀번호 <span></span>
		      	 <input class="myPage_edit_input" type="password" name="m_pw">
		     	 <div class="myPage_remove_btn"><input type="submit" value="탈퇴">
		     	 </div>
		       </div> 
		    </form>
		  </div> <!-- end of div myPage_remove -->
		</div>
		   
		<div style="height: 700px; " class="wd-960 mb-auto"></div>
		
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
</body>
</html>