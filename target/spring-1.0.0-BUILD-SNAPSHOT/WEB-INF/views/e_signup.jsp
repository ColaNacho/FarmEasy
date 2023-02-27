<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error_signup.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>귀농쉽농</title>
<link rel="stylesheet" href="css/signup.css">
<link rel="stylesheet" href="css/header-footer.css">
<link href="images/favi.png" rel="shortcut icon" type="image/x-icon">
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
</script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="js/validate.js"></script>

<!-- 
ajax 적용 전 
<script>

$(function() {
	  $('#dbCheckId').click( function() {
	    if( $('#idDuplication').val() == 'idUnCheck' ) {
	    	$('#idDuplication').val('idCheck');
	    	}
	  });
	});

</script> -->

</head>

<body>

	<form name="form1" action="memberInsert.do" method="post" id="form1" > 
		<div class="main-container">
			<div class="main-wrap">
				<fieldset id="signup_fieldset">
					<header>
						<div class="logo-wrap">
							<h1><a href="index">귀농쉽농 회원가입</a></h1>
						</div>
					</header>
					<div class="signup_div">
						<table>
							<tr>
								<td align=left class="td_name">성명 <span>*</span></td>
								<td><input class="login-input-wrap" type="text"
									name="m_name" required></td>
							</tr>
							<!-- Ajax 적용 전 코드 
							<tr>
								<td align=left class="td_name">아이디 <span>*</span></td>
								<td><input class="login-input-wrap" type="text" id="m_id" 
									name="m_id" required>
									<button type="button" onclick="signUp_checkId()" name="dbCheckId" class="checkId" id="dbCheckId">중복 체크</button>
								</td>
							</tr> 
							-->
							<tr>
								<td align=left class="td_name">아이디 <span>*</span></td>
								<td><input class="login-input-wrap" type="text" id="m_id" 
									name="m_id" required>
									<button type="button" name="dbCheckId" class="checkId" id="dbCheckId">중복 체크</button>
									<input type="hidden" id="result"></input>
									<p id="result2"></p>
								</td>
							</tr>
							<tr>
								<td align=left class="td_name">비밀번호 <span>*</span></td>
								<td><input class="login-input-wrap" type="password" id="m_pw"
									name="m_pw"  required></td>
							</tr>
							<tr>
								<td align=left class="td_name">비밀번호 확인 <span>*</span></td>
								<td><input class="login-input-wrap" type="password" id="m_pw_confirm"
									name="m_pw_confirm" required><br><span id="check"></span></td>
							</tr>
							<tr>
								<td align=left class="td_name">이메일 주소 <span>*</span></td>
								<td><input class="login-input-wrap" type="email"
									name="m_email" id="m_email" required></input></td>
							</tr>
							<tr>
								<td align=left class="td_name">휴대전화 <span>*</span></td>
								<td><input class="login-input-wrap" type="tel" placeholder="010-1234-1234형식으로 입력해주세요."
									name="m_mobile" id="m_mobile" required></input></td>
							</tr>
						</table>
					</div>
					<div class="login-button-wrap">
							<input type="button" id="success" name="success" value="회원가입" onclick="validate()">
<!-- 							<input type="hidden" name="idDuplication" value="idUnCheck" id="idDuplication"> -->
					</div>
				</fieldset>
			</div>
		</div>
	</form>
	
	
	<script type="text/javascript">
	$('#dbCheckId').click(function () {
	    if ($('#m_id').val() != '') {
	        // 아이디를 서버로 전송 > DB 유효성 검사 > 결과 반환받기
	        $.ajax({
	            type: 'POST',
	            url: 'idCheck',
	            data: 'id=' + $('#m_id').val(),
	            dataType: 'json',
	            success: function(result) {
	                if (result == '0') {
	                    $('#result2').text('사용 가능한 아이디입니다.');
	                    $('#result').attr("value","0");
	                    $('#result2').css({"color":"blue", "font-size":"12px"});
	                } else {
	                    $('#result2').text('이미 사용중인 아이디입니다.');
	                    $('#result').attr("value","1");
	                    $('#result2').css({"color":"red", "font-size":"12px"});
	                }
	            },
	            error: function(a, b, c) {
	                console.log(a, b, c);
	            }
	        });
	    } else {
	        alert('아이디를 입력하세요.');
	        $('#m_id').focus();
	    }
	});
	</script>
	
	
</body>

</html>