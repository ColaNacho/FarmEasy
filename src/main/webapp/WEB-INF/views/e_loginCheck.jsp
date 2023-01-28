<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 1 = 이메일 이름 존재 / 0 이메일없음 / -1 이름이 없음 -->
<!-- 로그인 체크 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<c:choose>
	<c:when test="${fn:contains(check, '0')}">
		<script type="text/javascript">
			alert("정보를 다시 입력해주세요");
			history.back();
		</script>
	</c:when>
</c:choose>

<c:choose>
	<c:when test="${fn:contains(findid, '0')}">
		<script type="text/javascript">
			alert("일치하는 정보가 없습니다.");
			history.back();
		</script>
	</c:when>
	<c:when test="${mvo eq not null}">
		<script type="text/javascript">
			alert("아이디는 ${findid} 입니다.");
			document.location.href="e_login";
		</script>
	</c:when>
</c:choose>

</body>
</html>