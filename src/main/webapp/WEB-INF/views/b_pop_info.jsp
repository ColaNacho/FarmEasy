<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="/images/favi.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/pop_info.css">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet" />
<script src="https://kit.fontawesome.com/77e29b57dd.js" crossorigin="anonymous" ></script>
<script src="/js/index.js" defer></script>
<title>정책 상세 조회</title>
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
			<li class="depth1"><a href="a_select_step">길라잡이</a>
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
	
	<div id="sub-title" class="wd-basic-960 mb-auto">정책 상세 조회</div>
	
	<div id="sta-location" class="wd-basic-960">
		<ul>
			<li><span>상세보기</span></li>
			<li><a href="/">홈&nbsp;</a>&nbsp;>&nbsp;정책조회&nbsp;>&nbsp;상세조회&nbsp;&nbsp;</li>
		</ul>
	</div>

	<form>
		<div class="main-container">
			<div class="main-wrap">
					<div class="signup_div">
						<table>
							<tr>
								<td align=left class="td_name">ㆍ사업명</td>
								<td>
                                    ${policy.policy_name}
                                </td>
							</tr>
							<tr>
								<td align=left class="td_name">ㆍ지원금</td>
								<td>
                                    ${policy.subsidy}
                                </td>
							</tr>
							<tr>
								<td align=left class="td_name">ㆍ대상 및 요구사항</td>
								<td>
                                    ${policy.target_requirement}
                                </td>
							</tr>
							<tr>
								<td align=left class="td_name">ㆍ지원 내용</td>
								<td>
                                    ${policy.policy_content}
                                </td>
							</tr>
							<tr>
								<td align=left class="td_name">ㆍ담당 부서 전화번호</td>
								<td>
                                    ${policy.department_tel}
                                </td>
							</tr>
						</table>
					</div>
					<div class="login-button-wrap mb-4">
						<c:choose>
							<c:when test="${mvo.m_id eq null}">
								<a href="#" onclick="returnList()" class="close_info">돌아가기</a>
							</c:when>
							<c:otherwise>
<%-- 								<a href="/b_pop_info/${mvo.m_seq}/${policy.policy_id}" class="pick">리스트에 담기</a> --%>
								<a href="#" onclick="insertList()" class="pick">리스트에 담기</a>
	                        	<a href="#" onclick="returnList()" class="close_info">돌아가기</a>
							</c:otherwise>
						</c:choose>
					</div>
			</div>
		</div>
	</form>
	
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
	function returnList() {
		history.back();
	}
	
	function insertList() {
		var result = confirm('리스트에 추가하시겠습니까?');
		if(result) {
			window.location.href="/b_pop_info/${mvo.m_seq}/${policy.policy_id}";
		}
	}
</script>

</body>

</html>