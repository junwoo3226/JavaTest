/**		이메일에 관한 jsp
 * 			<div class="emailBox">
				<h2>이메일</h2>
				<input name="email" type="text" class="inputText1" id="userEmail">
				<div class="emailCheckBox">
					<div class="emailCheckInputBox" id="emailCheckInputBoxFalse">
			        	<input name="emailCheckInput" type="text" class="inputText1" id="userEmailCheckInput" placeholder="인증번호 입력하세요" disabled="disabled">
		            </div>
		            <div class="emailButton">인증번호 받기</div>
				</div>
		        <span class="ErrorMsg"></span>
			</div>
 */
//이메일전송 인증번호 저장하기위한 코드
var code = "";  
//이메일의 형식이 아닐경우 버튼클릭을 무시하게만드는 코드
var emailNo = false;

$(document).ready(function(){

	
	$("#userEmail").change(function(){
		chaeckEmail();
	});
});

function Email(){
	$(".emailButton").click(function(){
		console.log($("#userEmail").val());
		var email = $("#userEmail").val(); //입력한 이메일
		var emailCheckInputBox = $(".emailCheckInputBox");		//인증번호 입력창의 박스
		var userEmailCheckInput = $("#userEmailCheckInput");	//인증번호 입력창
		
		if(emailNo){
			$.ajax({
				type:"GET",
				url:"emailCheck?email=" + email,
				success:function(data){
					console.log("이메일 전송에 성공하고 번호받기 성공"); //실행
					console.log(data); //코드번호
					
					userEmailCheckInput.attr("disabled",false);
					emailCheckInputBox.attr("id","emailCheckInputBoxTrue");
					code = data; //코드에 랜덤으로정한 숫자가 들어가있다
					
				}
			});//ajax
		}//if(emailNo)
	}) //.emailButton.click
	//인증번호 비교
	$("#userEmailCheckInput").blur(function(){
		var inputCode = $("#userEmailCheckInput").val();	//입력코드
		var ErrorMsg = $(".ErrorMsg");						//비교해서 나오는 결과
		
		if(inputCode == code){
			//인증번호가 일치할 경우
			ErrorMsg.html("인증번호가 일치합니다.");
			ErrorMsg.attr("class","ErrorMsg correct");
		}else{
			//인증번호가 일치하지 않을 경우
			ErrorMsg.html("인증번호를 다시 확인해주세요.");
			ErrorMsg.attr("class","ErrorMsg incorrect");
		}
	});//#userEmailCheckInput.blur
}

//이메일 확인
function chaeckEmail(){
	if(isEmail($("#userEmail").val()) || $("#userEmail").val()==""){
		//이메일을 정상
		str = "";
		emailNo = true;
	}else{
		//이메일의 형식이 아닐때
		$(".ErrorMsg").attr("class","ErrorMsg incorrect");
		str="정상적인 이메일의 형식이 아닙니다";
		emailNo = false;
	}
	
	$(".emailBox span").html(str);
}


//이메일 형식 확인
function isEmail(asValue){
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	return regExp.test(asValue);
}