/**
 * 
 */
var idbool = false;
$(document).ready(function(){
	var userId = getCookie("userId");//저장된 쿠기값 가져오기
    $("input[name='id']").val(userId); 
    // ID를 저장해서 보여주기
    
    if($("input[name='id']").val() != ""){
	        // 아이디 저장하기 체크되어있을 시,
	$("#idSave").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	}
    
})
//로그인 실패시 나오는 문구가없다
function loginProcess(){ 

	var id = $("#userId").val();
	var pwd = $("#userPw").val();
	var idChk = $("#idSave").is(":checked"); // 체크박스가 체크되었는지를 담아준다. ( true/false 로 담긴다.) 
	if(id == ""){ // 아이디가 입력이 안된 채 로그인 버튼을 누른 경우
		alert("아이디를 입력하세요"); // 입력하라는 메세지 출력
		$("#userId").focus(); // 아이디 인풋창에 포커스를 맞춰준다.
		return false; // return false를 해줘서 서버이동을 막는다. 
	}else if(pwd ==""){ 
		alert("비밀번호를 입력하세요"); 
		$("#userPw").focus();
		return false; 
	}else if(idChk){ // 아이디, 비밀번호 저장 체크박스가 체크 된 경우 (true)
		setCookie("Cookie_userId", id, 7); // 쿠키에 저장하는 이벤트를 호출한다. Cookie_userId 이름으로 id가 7일동안 저장 
		setCookie("Cookie_userPw", pwd, 7); 
	}else{ // 체크가 해제 된 경우 (false) 
		deleteCookie("Cookie_userId"); // 쿠키 정보를 지우는 이벤트를 호출한다. 
		deleteCookie("Cookie_userPw"); 
	}
	$.ajax({
        type:"post",
        url: "/login",
        data: {'id':$("#userId").val(),
        	   'password':$("#userPw").val()},
        dataType: "json",
        success : function(data) {
        	console.log(data);
        	if(data == 1){
        		idbool = true;
        		alert("로그인이 성공했습니다");
        		//로그인 성공시 이동하는 홈페이지
        		window.location.href = "/catdream";
        	}else if(data == 0 ){
        		idbool = false;
        		alert("로그인이 실패했습니다");
        	}
        }
		, error : function() {
			alert('서버 통신 실패');
		}
    });
	//성공못하면 넘기지 않게 하기위해서 위치는 아래지만 중간에 실행한다
	return false;
};
//쿠키 값을 저장하는 이벤트
function setCookie(cookieName, value, exdays){ 
	var exdate = new Date(); 
	exdate.setDate(exdate.getDate() + exdays); // 쿠키 저장 기간 
	var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue; 
}
//쿠키 값 조회하는 이벤트
function getCookie(cookieName) { 
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = ''; 
	
	if(start != -1){ 
		start += cookieName.length;
		var end = cookieData.indexOf(';', start); 
		if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end); 
		} 
	return unescape(cookieValue); 
}
//쿠키값 지우는 이벤트
function deleteCookie(cookieName){ 
	var expireDate = new Date(); 
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString(); 

}