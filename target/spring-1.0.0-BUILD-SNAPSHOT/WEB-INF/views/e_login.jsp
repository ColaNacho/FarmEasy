<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>귀농하여 지방살리기</title>
<link rel="stylesheet" href="css/login.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/header-footer.css">
<link href="images/favi.png" rel="shortcut icon" type="image/x-icon">

</head>

<div class="main-container">
	<div class="main-wrap">
		<header>
			<div class="logo-wrap">
				<h1><a href="index">로그인</a></h1>
			</div>
		</header>
		<form action="memberLogin.do" name="login_check" id="login_check" method="post" >
			<section class="login-input-section-wrap">
				<div class="login-input-wrap">
					<input placeholder="아이디" type="text" name="m_id">
				</div>
				<div class="login-input-wrap password-wrap">
					<input placeholder="비밀번호" type="password" name="m_pw">
				</div>
				<div class="login-button-wrap">
					<input type="submit" value="로그인"></input>
					<!-- <button>로그인</button> -->
				</div>
				<ul class="find_wrap" id="find_wrap">
					<li class="hover_green"><a href="e_find_id">아이디
							찾기</a></li>
					<li class="hover_green"><a href="e_find_pw">비밀번호
							찾기</a></li>
					<li class="hover_green"><a href="e_signup">회원가입</a></li>
				</ul>
			</section>
		</form>
	</div>
</div>
</body>
</html>