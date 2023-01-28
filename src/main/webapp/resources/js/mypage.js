

//탭 메뉴

function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
  
  
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

//새로고침 이벤트 막기
function handleSubmit(event) {
	  event.preventDefault()
	  value = '' ;
	}


//엔터시 새로고침 안되게!
var name1 = document.getElementbyId('myPage_form');
name1.addEventListener('submit', handleSubmit);

document.myPage_form.addEventListener("keydown", evt => {
	  if (evt.code === "Enter") 
	  evt.preventDefault();
	});



var name = document.getElementbyId('myPage_edit_form');
name.addEventListener('submit', handleSubmit);

document.myPage_edit_form.addEventListener("keydown", evt => {
	  if (evt.code === "Enter") 
	  evt.preventDefault();
	});



function submitFunction(){
	
	var myPage_edit = document.getElementById('myPage_edit');
	var myPage_update = document.getElementById('myPage_update');
	var hidden_btn = document.getElementsByClassName('hidden_btn');

	//입력된 비밀번호	
	var pw = myPage_edit_form.m_pw.value;
	//세션에 저장된 비밀번호
	var pw_session = myPage_edit_form.pw_session.value;

//	myPage_edit 정보 수정 js
	
	if(pw != pw_session){
		alert('비밀번호가 틀립니다.');
		return false;
	}else{
		myPage_edit.style.display="none";
		myPage_update.style.display="block";
		event.preventDefault();
		return true;
	}
	

}


//function captureReturnKey(e) { 
//    if(e.keyCode == 13 && e.srcElement.type != 'textarea') 
//        return false; 
//} 

// onkeydown="return captureReturnKey(event)" 

function validate() {
	
    var re = /^[a-zA-Z0-9]{4,12}$/ ;
    // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 이메일 형식 첫글자는 숫자또는 영문자
//    var re3 = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    var patternPhone =  /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
    //  번호는 01로 시작해야 합니다.


    var m_email = document.getElementById("m_email");
    var mobile = document.getElementById("mobile");

    // ------------ 이메일 까지 -----------


   
    if(!check(re,m_pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(myPage_form.m_pw.value != myPage_form.m_pw_confirm.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        myPage_form.m_pw_confirm.value = "";
        myPage_form.m_pw_confirm.focus();
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
    


    if(!check(patternPhone , mobile ,"번호는 01로 시작해야 합니다.")) {
        return false;
    }
    
    if(myPage_form.m_name.value=="") {
        alert("이름을 입력해 주세요");
        myPage_form.m_name.focus();
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
	
	
	
	function check_phone(){
	    var patternPhone =  /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
	    var mobile = document.getElementById("mobile");
	    if(patternPhone.test(mobile.value)){
	    	alert('핸드폰 정규식 통과');
	    }else{
	    	alert('번호는 01로 시작해야 하며, 010-1234-1234형식으로 입력해주세요.');                                                                                                          
	       	myPage_form.mobile.value = "";
	        myPage_form.mobile.focus();
	        return false;
	    }
		
		
	}