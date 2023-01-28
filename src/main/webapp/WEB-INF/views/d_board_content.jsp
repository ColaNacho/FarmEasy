<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" %>
<!-- import="com.farmeasy.model.member.MemberDto" com.farmeasy.model.board.*, -->	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <%
		BoardDao boardDao = BoardDao.getInstance();
		BoardDto boardDto = boardDao.getBoardDB(Integer.parseInt(request.getParameter("board_id")));
		BoardFileDto boardFileDto = boardDao.getBoardFileDB(Integer.parseInt(request.getParameter("board_id")));
		ArrayList<BoardReplyDto> replyList = boardDao.getReplyList(Integer.parseInt(request.getParameter("board_id")));
		
		session.setAttribute("updateDeleteBoardId", Integer.parseInt(request.getParameter("board_id")));
		String userIdName = "";
		if(session.getAttribute("m_id") != null) {
			userIdName = (String)session.getAttribute("m_id");
		}
%> --%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="images/favi.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/board_content.css">
<title>게시판 내용</title>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"	rel="stylesheet" />
<script src="https://kit.fontawesome.com/77e29b57dd.js"	crossorigin="anonymous"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/index.js"></script>
<script src="js/reply.js"></script>

 
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
	
	<div id="sub-title" class="wd-basic-960 mb-auto mb-5">게시판</div>
	<div class="form_wrap">
	<form name="FEForm1">
		<div class="wd-basic-960 mb-auto mt-5" id="info-bottom" style="height: auto">
			<h3>${content_view.board_title}</h3>
			<div>
				<ul>
				<c:choose>
					<c:when test="${content_view.update_date eq null}">
						<li>등록일 : ${content_view.insert_date}</li>
					</c:when>
					<c:otherwise>
						<li>수정일 : ${content_view.update_date}</li>
					</c:otherwise>
				</c:choose>
					<li>작성자 ID : ${content_view.m_id} &nbsp;|&nbsp; 조회수 : ${content_view.board_hits}</li>
				</ul>
			</div>
			<p class="mt-4">${content_view.board_content}</p>
			<div class="board_write">
				<c:choose>
						<c:when test="${mvo.m_id.equals(content_view.m_id)}">
							<a href="/d_reply_write?bId=${content_view.board_id}"><input type="hidden" value="${bGroup}" />
							<button type="button" class="board_return"> 답글</button> </a>
							<a href="/d_board_update.do?bId=${content_view.board_id}"><button type="button" class="board_return">수정</button></a>
							<input type="hidden" type="text" name="board_id" value="${content_view.board_id}" />
							<a href="#"><button type="button" class="board_return" onclick="deleteCheck()">삭제</button></a>
							<a href="/d_board"><button type="button" class="board_return">목록</button></a>
						</c:when>
						<c:when test="${mvo.m_id eq null}">
							<a href="/d_board"><button type="button" class="board_return">목록</button></a>
						</c:when>
						<c:otherwise>
							<a href="/d_board"><button type="button" class="board_return">목록</button></a>
						</c:otherwise>
				</c:choose>
			</div>
		</div>
	</form>
	</div>
	
	<form name="FEForm2" method="post" action="commentInsert.do?bId=${content_view.board_id}">
		<div class="wd-basic-960 mb-auto" id="comment" style="height: auto">
			<p>댓글등록</p>
			<input type="text" name="reply_content" maxLength="1900">
			<c:choose>
				<c:when test="${mvo.m_id eq null}">
					<!-- 로그인 하지 않은 경우 -->
					<div id="no_login_wrap"><a id="no_login" onclick="replyinsert();">등록</a></div>
				</c:when>
				<c:otherwise>
					<button type="submit">등록</button>
				</c:otherwise>
			</c:choose>
		</div>
	</form>
	<!-- 코드 빈 곳 - 카톡방 참고 -->
	<!-- 	<form name="FEForm2" action="replyUpdate.do"> -->
	
		<c:forEach var="comment" items="${comentVo}">
			<div class="wd-basic-960 mb-auto reply" style="height: auto">
			<ul class="reply_ul">
				<li>작성자 ID : ${comment.m_id}</li>
			</ul>
			<c:choose>
				<c:when test="${comment.update_date eq null}">
					<span class="write_date">작성 날짜 : ${comment.insert_date}</span>
					<span class="edit_date">수정 날짜 : ${comment.update_date}</span>
				</c:when>
				<c:otherwise>
					<span class="write_date">작성 날짜 : ${comment.insert_date}</span>
				</c:otherwise>
			</c:choose>
			<p class="reply_content">${comment.reply_content}</p> 
			<ul class="reply_ul_sec ">	
			<c:choose>
				<c:when test="${mvo.m_id eq comment.m_id}">
					<li><a class="editOrDel" href="javascript:replyDelete(${comment.m_id})">삭제</a></li>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
			</ul>	
			</div>
		</c:forEach>


	<footer class="mt-5">
		<div class="container">
			<div>
				<span>&copy; 귀농 인구를 위한 지역 및 농작물 추천 서비스</span>
			</div>
			<ul>
				<li class="ms-3">
					<a class="text-muted" href="#">
						<svg class="bi" width="24" height="24">
							<img src="images/iconmonstr-twitter-4.svg">
						</svg>
					</a>
				</li>
				<li class="ms-3">
					<a class="text-muted" href="#">
						<svg class="bi" width="24" height="24">
							<img src="images/iconmonstr-facebook-4.svg">
						</svg>
					</a>
				</li>
				<li class="ms-3">
					<a class="text-muted" href="#">
						<svg class="bi" width="24" height="24">
							<img src="images/iconmonstr-instagram-14.svg">
						</svg>
					</a>
				</li>
			</ul>
		</div> <!-- container -->
	</footer>

</body>
</html>