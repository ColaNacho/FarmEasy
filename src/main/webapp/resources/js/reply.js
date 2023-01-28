/**
 * 
 */
   function deleteCheck() {
      result = confirm("정말로 게시글을 삭제하시겠습니까?");
      
      if(result) {
         document.FEForm1.action="boardDelete";
         document.FEForm1.submit();
      } else {
         return;
      }
   }
   
    function replyDelete(reply_id) {
      result = confirm("정말로 댓글을 삭제하시겠습니까?");
      
      if(result) {
         document.location.href="replyDelete.do?reply_id="+reply_id;
      }
   }


    function replyinsert() {
        result = confirm("로그인 시 댓글 작성이 가능합니다. 로그인하시겠습니까?");

        if(result) {
        	document.location.href="e_login";
        } else {
           return;
        }
     }

    
    function rereplyDelete(rereply_id) {
        result = confirm("정말로 댓글을 삭제하시겠습니까?");
        
        if(result) {
           document.location.href="rereplyDelete.do?rereply_id="+rereply_id;
        }
     }
    
    
    
    //팝업창 중앙정렬
    function replyUpdate(reply_id) {
        var popupX = (document.body.offsetWidth / 2) - (970 / 2);
        var popupY = (window.screen.height / 2) - (115/2);
      window.name="parentForm";
      window.open("d_reply_update?reply_id="+reply_id,"replyUpdateForm","status=no, width=970, height=115, left="+popupX+", top="+popupY+", resizable=no, scrollbars=no");
    }
    
    
    
    
    function resize(obj) {
	    obj.style.height = '1px';
	    obj.style.height = (12 + obj.scrollHeight) + 'px';
	}
	
	

/*	//새로고침 이벤트 막기
	function handleSubmit(event) {
		  event.preventDefault()
		}

	//엔터시 새로고침 안되게!
	var otherReply = document.getElementbyId('otherReply');
	otherReply.addEventListener('click', handleSubmit);*/
	
	
	