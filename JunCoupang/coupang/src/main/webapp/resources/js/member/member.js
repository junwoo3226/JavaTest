//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9]{4,12}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/; 
// 이름 정규식
var nameJ = /^[가-힣]{2,6}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

// 아이디 확인
var idOk = false;
// 비밀번호 확인
var pwOk = false;
// 비밀번호 확인 확인
var pwOkOk = false;
// 이름 확인
var nameOk = false;
// 이메일 확인
var emailOk = false;
// 인증번호 확인
var emailOkOk = false;
//이메일전송 인증번호 저장위한 코드
var code = "";                

$(document).ready(function(){
	$("#userId").blur(function(){
		idOver();
		if(idJ.test($("#userId").val())){
			console.log("idTrue");
			$("#idCheck").text("사용가능한 아이디입니다.");
			$("#idCheck").css("color","green");
			idOk = true;
		}else{
			console.log("idFalse");
			$("#idCheck").text("숫자 또는 소문자영어로만 4~12자리를 입력하세요");
			$("#idCheck").css("color","red");
			idOk = false;
		}
		
		
	})
	
	$("#userPw").blur(function(){
		if(pwJ.test($("#userPw").val())){
			console.log("pwTrue");
			$("#pwCheck").text("사용가능한 비밀번호입니다.");
			$("#pwCheck").css("color","green");
			pwOk=true;
		}else{
			console.log("pwFalse");
			$("#pwCheck").text("숫자 또는 대소문자영어로만 4~12자리를 입력하세요");
			$("#pwCheck").css("color","red");
			pwOk=false;
		}
		
	})
	
	$("#userPwOk").blur(function(){
		if($("#userPwOk").val() != $("#userPw").val()){
			$("#pwOkCheck").text("비밀번호가 일치하지 않습니다.");
			$("#pwOkCheck").css("color","red");
			pwOkOk=false;
		}else{
			$("#pwOkCheck").text("비밀번호가 일치합니다.");
			$("#pwOkCheck").css("color","green");
			pwOkOk=true;
		}
	})
	
	$("#userName").blur(function() {
		if (nameJ.test($("#userName").val())) {
			console.log($("#userName").val());
			$("#nameCheck").text($("#userName").val() + "님 반갑습니다.");
			$("#nameCheck").css("color", "green");
			nameOk = true;
		} else {
			$("#nameCheck").text("이름을 확인해주세요");
			$("#nameCheck").css("color", "red");
			nameOk = false;
		}
	});
	
	$("#userEmail").blur(function() {
		if (mailJ.test($("#userEmail").val())) {
			console.log($("#userEmail").val());
			$("#emailCheck").text("사용가능한 이메일주소입니다.");
			$("#emailCheck").css("color", "green");
			emailOk = true;
		} else {
			$("#emailCheck").text("메일을 확인해주세요");
			$("#emailCheck").css("color", "red");
			emailOk = false;
		}
	});
	
	$(".joinBtn").on("click",function(e){
		if(!idOk){
			$("#userId").focus();
			return false;
		}else if(!pwOk){
			$("#userPw").focus();
			return false;
		}else if(!pwOkOk){
			$("#userPwOk").focus();
			return false;
		}else if(!nameOk){
			$("#userName").focus();
			return false;
		}else if(!emailOk){
			$("#userEmail").focus();
			return false;
		}else if(!emailOkOk){
			$(".emailOK").focus();
			return false;
		}else{
			return true;
			
		};
		
		
		
	});
	
	/* 인증번호 이메일 전송 */
	$(".emailBtn").click(function(){
		var email = $("#userEmail").val();        // 입력한 이메일
		var checkBox = $(".emailOK");        	 // 인증번호 입력란
		
	    $.ajax({
	        
	        type:"GET",
	        url:"mailCheck?email=" + email,
	        success:function(data){
	        	//console.log("data : " + data);
	        	checkBox.attr("disabled",false);
	        	code = data;
	        }
	                
	    });
	});
	

	 
	/* 인증번호 비교 */
	$(".emailOK").blur(function(){
	    var inputCode = $(".emailOK").val();      // 입력코드    
	    var checkResult = $("#emailOkCheck");    // 비교 결과 
	    
	    if(inputCode == code){                            // 일치할 경우
	        checkResult.html("인증번호가 일치합니다.");
	        emailOkOk = true;
			$("#emailOkCheck").css("color", "green");      
	    } else {                                            // 일치하지 않을 경우
	        checkResult.html("인증번호를 다시 확인해주세요.");
	        $("#emailOkCheck").css("color", "red");
	        emailOkOk = false;
	    }  
	    
	});
	
	
}) //ready 끝지점

//아이디 중복체크
function idOver(){
	$.ajax({
		url:"/memberAjax",
		type: "post",
		data: {'id':$("#userId").val()},
		dataType: "json",
		success: function(data){
			if(data == 1){
				$("#idCheck").text("중복된 아이디 입니다.");
				$("#idCheck").css("color","red");
				idOk = false;
			}else{
				$("#idCheck").text("사용가능한 아이디입니다.");
				$("#idCheck").css("color","green");
				idOk = true;
			}
			console.log(idOk);
		}
		
	})
}



