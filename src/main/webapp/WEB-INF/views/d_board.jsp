<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!-- import="java.util.*, com.farmeasy.model.board.*" -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="images/favi.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/board.css">
<title>게시판</title>

<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/77e29b57dd.js" crossorigin="anonymous"></script>
<script src="js/index.js" defer></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
<script type="text/javascript">
	var pasing = document.getElementsByClassName("pasing");
	function clickBold(){
		pasing.style.color= "tomato";
	}
</script>
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
			<li class="depth1">
				<a href="/a_select_step">길라잡이</a>
				<ul class="submenu">
					<li><a href="/a_select_step">귀농절차</a></li>
					<li><a href="/a_select_chung">지역선정</a></li>
				</ul>
			</li>
			<li class="depth1"><a href="/b_all_info">정책 조회</a>
				<ul class="submenu">
					<li><a href="/b_all_info/충청">충청도 정책</a></li>
					<li><a href="/b_all_info/경상">경상도 정책</a></li>
					<li><a href="/b_all_info/전라">전라도 정책</a></li>
				</ul>
			</li>
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

	<div id="sub-title" class="wd-basic-960 mb-auto">게시판</div>

	<div id="sta-location" class="wd-basic-960">
		<ul>
			<li></li>
			<li><a href="index.jsp">홈&nbsp;</a>&nbsp;>&nbsp;게시판&nbsp;&nbsp;</li>
		</ul>
	</div>
	<c:choose>
		<c:when test="${mvo.m_id eq 'nacho'}">
		<div style="width:960px; height:30px; margin:0 auto;
			text-align:center; line-height:30px; margin-bottom:20px; ">
		<span style="color:white;  background-color:#3155a4; float: left; padding:0 10px;"><a href="insertTest.do">열개씩 넣기!</a></span></div>
		</c:when>
	</c:choose>
	<div class="wd-basic-960 mb-auto" id="no_table" style="height: auto;">
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자 ID</th>
					<th>등록날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<%-- <c:forEach var="n" items="${boardList}"> --%>
			<c:forEach var="n" items="${list}">
				<tbody>
					<tr>
						<td>${n.board_id}</td>
						<td class="text-aglin-left">
						<c:forEach begin="1" end="${n.BIndent}">-</c:forEach>
						<a href="content_view?bId=${n.board_id}">${n.board_title}</a>
						</td>
						<td>${n.m_id}</td>
						<td>${n.insert_date}</td>
						<td>${n.board_hits}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
		
			<c:set var="page" value="${(param.p == null)?1:param.p}" />
			<c:set var="startNum" value="${page-(page-1)%5}" />
			<c:set var="lastNum" value="${(total*0.1)+1}" />
			
			<c:set var="page_endNum" value="${lastNum}" />
			
			<div style="display:inline-block; margin-top:20px;">현재 페이지 ${page} / <fmt:formatNumber type="number" pattern="###,###,###,###,###,###" value="${page_endNum}" /></div>
			
			<c:choose>
				<c:when test="${mvo.m_id eq null}">
				</c:when>
				<c:otherwise>
					<div id="no_btn">
						<a href="d_board_write">글쓰기</a>
					</div>
				</c:otherwise>
			</c:choose>
			
			<!-- page값 세팅 -->
			
		
			<!-- 6인 경우는 6으로 이동하는 다음버튼 생성안됨, 7부터 나옴  -->
		<div style="text-align: center;" class="mt-5" id="no_paging">
			<ul>
				<c:if test="${startNum>1}">
					<li><a href="?p=${startNum-1}">이전</a></li>
				</c:if>
				<c:if test="${startNum<=1}">
				</c:if>
				
				<c:forEach var="i" begin="0" end="4">
					<li><a class="pasing" href="d_board?p=${startNum+i}" onclick="clickBold();">${startNum+i}</a></li>
				</c:forEach>
				<!-- 현재 라스트넘버가 6.. 스타트넘버가 5? ${((total-1)/10)}-->
			<!-- 다음보다 라스트넘버가 크다면 -->
				<c:if test="${startNum+5<=lastNum}">
					<li><a href="?p=${startNum+5}&t=?q=?">다음</a></li>
				</c:if>
			<!-- 여집합-넘어서는 경우는 -->				
				<c:if test="${startNum+5>=lastNum}">
					<li><span onclick="alert('다음 페이지가 없습니다.')"> 〉</span></li>
				</c:if>
			</ul>
		</div> <!-- end of no_paging -->
	</div> <!-- end of no_table  -->
	
	
	
	<footer class="mt-5">
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