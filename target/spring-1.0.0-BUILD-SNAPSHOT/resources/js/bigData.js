

$(function(){
	  $('.tabcontent > div').hide();
	  $('.tabnav a').click(function () {
	    $('.tabcontent > div').hide().filter(this.hash).fadeIn();
	    $('.tabnav a').removeClass('active');
	    $(this).addClass('active');
	    return false;
	  }).filter(':eq(0)').click();
 });


$('a').click(function(e) {
	  e.preventDefault();
	});


//새로고침 이벤트 막기
function handleSubmit(event) {
	  event.preventDefault()
	  value = '' ;
	}




