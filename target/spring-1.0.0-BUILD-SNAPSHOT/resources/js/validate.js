
function validate() {
	
    var re = /^[a-zA-Z0-9]{4,12}$/ ;
    // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 이메일 형식 첫글자는 숫자또는 영문자
//    var re3 =    /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
    var patternPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/ ;
    //  번호는 01로 시작해야 합니다.

    var m_id = document.getElementById("m_id");
    var m_pw = document.getElementById("m_pw");
    var m_email = document.getElementById("m_email");
    var m_mobile = document.getElementById("m_mobile");

    // ------------ 이메일 까지 -----------

    if(!check(re,m_id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

   if(form1.idDuplication.value!="idCheck"){
    	alert("아이디 중복체크를 해주세요.");
        return false;
    }
   
    if(!check(re,m_pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(form1.m_pw.value != form1.m_pw_confirm.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        form1.m_pw_confirm.value = "";
        form1.m_pw_confirm.focus();
        return false;
    }
    

    if(m_email.value=="") {
        alert("이메일을 입력해 주세요");
        m_email.focus();
        return false;
    }

    if(!check(re2, m_email , "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }

    if(!check(patternPhone , m_mobile ,"번호는 01로 시작해야 하며, 010-1234-1234형식으로 입력해주세요.")) {
        return false;
    }
    
    if(form1.m_name.value=="") {
        alert("이름을 입력해 주세요");
        form1.m_name.focus();
        return false;
    }
    document.getElementById("form1").submit();

	}

	
	function check(re, what, message) {
	    if(re.test(what.value)) {
	        return true;
	    }
	    alert(message);
	    what.value = "";
	    what.focus();
	    //return false;
	}
	
	
	function signUp_checkId(){
		var m_id = document.getElementById('m_id').value;
		document.location.href="/FarmEasy/memberCheckId.do?m_id="+m_id;

		return true;
	}
	
	
	function editInputPw(){
		var m_pw = document.getElementById('m_id').value;
		document.location.href="/FarmEasy/memberCheckId.do?m_id="+m_id;
	}
