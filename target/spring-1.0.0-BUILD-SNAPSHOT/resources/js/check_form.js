/**
 * 
 */
 
 function infoConfirm() {
 	if(document.reg_frm.m_id.value.length == 0) {
		alert("아이디는 필수사항입니다.");
		reg_frm.m_id.focus();
		return;
 	}
 	
 	if(document.reg_frm.m_id.value.length < 4) {
		alert("아이디는 4글자 이상이어야 합니다.");
		reg_frm.m_id.focus();
		return;
 	}
 	
 	if(document.reg_frm.m_pw.value.length == 0) {
		alert("비밀번호는 필수사항입니다.");
		reg_frm.m_pw.focus();
		return;
 	}
 	
 	if(document.reg_frm.m_pw.value != document.reg_frm.m_pw_confirm.value) {
		alert("비밀번호가 일치하지 않습니다.");
		reg_frm.m_pw_confirm.focus();
		return;
 	}
 	
 	if(document.reg_frm.name.value.length == 0) {
		alert("이름은 필수사항입니다.");
		reg_frm.name.focus();
		return;
 	}
 	
 	if(document.reg_frm.m_id.value.length == 0) {
		alert("아이디는 필수사항입니다.");
		reg_frm.m_id.focus();
		return;
 	}
 	
 	if(document.reg_frm.m_email.value.length == 0) {
 		alert("메일은 필수사항입니다.");
 		reg_frm.m_email.focus();
 		return;
 	}
 	
 	document.reg_frm.submit();
 }
 
 
 function updateInfoConfirm() {
 	if(document.reg_frm.m_pw.value == "") {
 		alert("패스워드를 입력하세요.");
 		document.reg_frm.m_pw.focus(); //password input에 focus가 가도록
 		return;
 	}
 	
 	if(document.reg_frm.m_pw.value != document.reg_frm.m_pw_confirm.value) {
 		alert("비밀번호가 일치하지 않습니다.");
 		reg_frm.m_pw.focus();
 		return;
 	}
 	
 	if(document.reg_frm.m_email.value.length == 0) {
 		alert("메일은 필수사항입니다.");
 		reg_frm.m_email.focus();
 		return;
 	}
 	
 	document.reg_frm.submit();
 }