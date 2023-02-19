function re_pw(){
	
	   var re = /^[a-zA-Z0-9]{4,12}$/ ;
	    // 아이디와 패스워드가 적합한지 검사할 정규식
	   var m_Pw = updatePw.m_pw.value;
	   
	   if(!check(re,m_Pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
	        return false;
	    }

	    if(updatePw.m_pw.value != updatePw.m_pw_confirm.value) {
	        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
	        updatePw.m_pw_confirm.value = "";
	        updatePw.m_pw_confirm.focus();
	        return false;
	    }
}
	
	function check(re, what, message) {
	    if(re.test(what.value)) {
	        return true;
	    }
	    alert(message);
	    what.value = "";
	    what.focus();
	    return false;
	}