         <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 1 = 이메일 이름 존재 / 0 이메일없음 / -1 이름이 없음 -->
<!-- 비밀번호 체크 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/find_id.css">
<script src="js/re_pw.js"></script>
</head>
<body>
<c:choose>
	<c:when test="${fn:contains(findpw, '-1')}">
		<script type="text/javascript">
			alert("정보가 일치하지 않습니다.. ${findpw}");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
	<div id="headLine"><a href="index.jsp">귀농쉽농</a></div>

	<div class="main-container">
		<div class="main-wrap">
			<div class="find-id-title">비밀번호 재설정</div>
			<!-- action="updatePw.do" -->
		<form id="updatePw" name="updatePw" method="post" action="updatePw.do" onsubmit="return re_pw();">
			<section class="find-id-input-section-wrap">
			<input type="hidden" value="${mvo.m_id}" name="m_id" id="m_id">
			<input type="hidden" value="${mvo.m_name}" name="m_name" id="m_name">
			<input type="hidden" value="${mvo.m_email}" name="m_email" id="m_email">
			<div class="shadow_wrap">	
				<div class="find-id-input-wrap">
					<input placeholder="비밀번호" name="m_pw" id="m_pw" type="password" required></input>
				</div>
				<div class="find-id-input-wrap password-wrap">
					<input placeholder="비밀번호 확인" name="m_pw_confirm" type="password" required></input>
				</div>
			</div>	
				<div class="find-id-button-wrap">
					<input type="submit" value="비밀번호 변경">
				</div>
			</section>
		</form>
		</div>
	</div>
	</c:otherwise> 
</c:choose>
</body>
</html>