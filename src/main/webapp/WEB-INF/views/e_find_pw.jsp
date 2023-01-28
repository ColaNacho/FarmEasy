<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>귀농하여 지방살리기</title>
<link rel="stylesheet" href="css/find_pw.css">
<link rel="stylesheet" href="css/header-footer.css">
<link href="images/favi.png" rel="shortcut icon" type="image/x-icon">
</head>
<body>
<div id="headLine"><a href="index">귀농쉽농</a></div>
<div class="main-container">
	<div class="main-wrap">
		<header>
			<div class="find-pw-title">비밀번호 찾기</div>
		</header>
		
		<form action="memberFindPw.do" name="findPw"  method="post">
			<section class="find-pw-input-section-wrap">
			<div class="shadow_wrap">	
				<div class="find-pw-input-wrap">
					<input placeholder="이름" type="text" name="m_name" required></input>
				</div>
				<div class="find-pw-input-wrap id-wrap">
					<input placeholder="아이디" type="text" name="m_id" required></input>
				</div>
				<div class="find-pw-input-wrap password-wrap">
					<input placeholder="이메일 주소" type="email" name="m_email" required></input>
				</div>
			</div>		
				<div class="find-pw-button-wrap">
					<input type="submit" value="확인"></input>
				</div>
			</section>
		</form>
	</div>
</div>

</body>
</html>