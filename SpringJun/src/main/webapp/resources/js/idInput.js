/**
 * 
 */
$(document).ready(function(){
	
	//버튼을 클릭했을때
	$("#idSubmit").on("click",function(){
		$.ajax({
	        type:"post",
	        url: "/idChk",
	        data: {'id':$("#userId").val()},
	        dataType: "json",
	        success : function(data) {
	        	if(data == 1){
	        		//alert("찾고있는 아이디가 있습니다.");
	        		
	        		
	        	}else if(data == 0 ){
	        		//alert("찾고있는 아이디가 없습니다.");
	        		alert("아이디가 없습니다");
	        		return false;
	        	}
	        }
			, error : function() {
				alert('서버 통신 실패');
			}
	    });
	})
	
	
	
});