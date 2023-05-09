/**
 * 
 */
	//검사를 하나하나 확인하는 코드
	var boolarr = [false,false,false,false,false,false,false,false];
	//최종 확인을 위한 코드
	var booltrue = false;
	//아이디의 정규식과 중복을 확인하는 코드
	var idbool = [false,false];
	//날짜를 정확하게 입력한지 확인하는 코드
	var birthbool = [false,false,false];
	//오류창을 띄우기위해 작업하는 코드
	var str="";
	//이메일전송 인증번호 저장하기위한 코드
	var code = "";  
	//이메일의 형식이 아닐경우 버튼클릭을 무시하게만드는 코드
	var emailNo = false;
$(document).ready(function(){
	var userId = document.querySelector("#userId");
	var userPw = document.querySelector("#userPw");
	var userPwCheck = document.querySelector("#userPwCheck");
	var userName = document.querySelector("#userName");
	var userYy = document.querySelector("#userYy");
	var userMm = document.querySelector("#userMm");
	var userDd = document.querySelector("#userDd");
	var userBirth = document.querySelector("#userBirth");
	var userGender = document.querySelector("#userGender");
	var userEmail = document.querySelector("#userEmail");
	var userPhone = document.querySelector("#userPhone");

	console.log(boolarr[0]);
	console.log(boolarr[1]);
	console.log(boolarr[2]);
	console.log(boolarr[3]);
	console.log(boolarr[4]);
	console.log(boolarr[5]);
	console.log(boolarr[6]);
	console.log(boolarr[7]);
	
	//회원가입의 조건확인
	userId.onchange = checkId;
	userPw.onchange = checkPw;
	userPwCheck.onchange = checkPwCheck;
	userName.onchange = checkName;
	userYy.onchange = chaeckYy;
	userMm.onchange = chaeckMm;
	userDd.onchange = chaeckDd;
	userGender.onchange = chaeckGender;
	userEmail.onchange = chaeckEmail;
	userPhone.onchange = chaeckPhone;
	
	//이메일 실행함수
	Email();
	

})


//이메일 관련 함수
function Email(){
	$(".emailButton").click(function(){
		//이메일 인증번호 전송
		var email = userEmail.value; //입력한 이메일
		//var userEmailCheckInput = document.querySelector(".userEmailCheckInput");
		//userEmailCheckInput.disabled = false;
		//두가지 방식
		
		
		var userEmailCheckInput = $("#userEmailCheckInput");
		var emailCheckInputBox = $(".emailCheckInputBox");
		//userEmailCheckInput 인증번호 입력창
		//emailCheckInputBox  인증번호 입력란 박스
		//ErrorMsg
		//정상적인 이메일을 입력하지 않았을때 버튼이 선택이 안된다
		if(emailNo){
			$.ajax({
				type:"GET",
				url:"emailCheck?email=" + email,
				success:function(data){
					console.log(data);
					
					userEmailCheckInput.attr("disabled",false);
					emailCheckInputBox.attr("id","emailCheckInputBoxTrue");
					code = data;  //코드에 랜덤으로준 숫자가 들어가있다
					
				}
			});
		}
		
	});
	//인증번호 비교
	$("#userEmailCheckInput").blur(function(){
		//console.log("userEmailCheckInput를 실행했습니다");
		var inputCode = $("#userEmailCheckInput").val();	//입력코드
		var ErrorMsg = $(".ErrorMsg");						//비교해서 나오는 결과
		
		if(inputCode == code){			//일치할 경우
			ErrorMsg.html("인증번호가 일치합니다.");
			ErrorMsg.attr("class", "ErrorMsg correct");
		}else{							//일치하지 않을 경우
			ErrorMsg.html("인증번호를 다시 확인해주세요.");
			ErrorMsg.attr("class", "ErrorMsg incorrect");
		}
	});
}



//회원가입에 추가해야할 세부사항

//인증번호 받기 -> 랜덤으로 번호를 받아와야한다
//랜덤번호가 인증번호가 맞으면 통과 안맞으면 불합격 
//회원가입이 완료되었다는 창을 만들어서 완료를 알리는것도 좋다

//로그인에 페이지에 추가해야할것들
//아이디찾기 비밀번호찾기 패아스북아이디로그인(예외) 비회원 주문조회(주문자명,주문번호)

//아이디 저장 쿠키를 사용해서 저장한다


//모든 조건을 충족했는지 확인하는 함수
function boolarrcheck(){
	console.log("boolarrcheck실행");
	console.log("아이디"+boolarr[0]); //아이디
	console.log("비밀번호"+boolarr[1]); //비밀번호
	console.log("비밀번호확인"+boolarr[2]); //비밀번호 확인
	console.log("이름"+boolarr[3]); //이름
	console.log("생년월일"+boolarr[4]); //생년월일
	console.log("성별"+boolarr[5]); //성별
	console.log("이메일"+boolarr[6]); //이메일
	console.log("휴대폰"+boolarr[7]); //휴대폰
	//조건이 실패했을때 해당위치로 포커스를 이동한다
	if(boolarr[0] == false){
		userId.focus();
	}else if(boolarr[1] == false){
		userPw.focus();
	}else if(boolarr[2] == false){
		userPwCheck.focus();
	}else if(boolarr[3] == false){
		userName.focus();
	}else if(boolarr[4] == false){
		//날짜포커스 yy mm dd 확인해서 하나씩 넘겨주는방식
		if(birthbool[0] == false){
			userYy.focus();
		}else if(birthbool[1] == false){
			userMm.focus();
		}else if(birthbool[2] == false){
			userDd.focus();
		}
	}else if(boolarr[5] == false){
		userGender.focus();
	}else if(boolarr[6] == false){
		userEmail.focus();
	}else if(boolarr[7] == false){
		userPhone.focus();
	}
	
	//모든 조건을 통과했는지 확인하는 것
	var count =0;
	for(var i=0;i<boolarr.length;i++){
		if(boolarr[i]){
			count++;
		}
		if(count == boolarr.length){
			booltrue=true;			
		}
	}
	
	//버튼을 활성화실키고 비활성화 시키는곳
	if(booltrue){
		//실행
		return true;
		//$(".memberButton").prop('disabled', false);
		//console.log("정상실행");
	}else{
		//종료
		return false;
		//$(".memberButton").prop('disabled', true);
		//console.log("비정상");
	}
	return false;
}
//아이디 정규식 확인
function checkId(){
	//console.log(userId.value);
	//console.log(isId(userId.value));
	/*
	1.type은 get이나 post 같은 http method를 나타낸다.
	2.url는 데이터를 받아올 페이지다.
	3.data는 요청시에 함께 보낼 파라미터들이다.  데이터베이스 DTO의 이름 : html에 작성되어있는 id.val
	4.dataType은 받아올 데이터의 형식인데,      success가 작동된다  result 값을 data로 가져온다
	5.success는 성공시에 수행할 핸들러를 받는다.
	6.error는 실패시에 수행할 핸들러를 받는다.
	 * */

	$.ajax({
        type:"post",
        url: "/idChk",
        data: {'id':$("#userId").val()},
        dataType: "json",
        success : function(data) {
        	if(data == 1){
        		//alert("중복된 아이디입니다.");
        		idbool[0] = false;
        		console.log("중복된아이디0"+idbool[0]);
        		$(".memberBox1 h4").html("중복된 아이디입니다");
        		return false;
        	}else if(data == 0 ){
        		//alert("사용가능한 아이디입니다.");
        		idbool[0] = true;
        		console.log("사용가능한 아이디0"+idbool[0]);
        	}
        	//아이디의 규칙을 지키고 데이터베이스에 중복이 안되었을때
        	if(idbool[0] == true && idbool[1] == true){
        		boolarr[0] = true;	
        		boolarrcheck();
        	}else{
        		boolarr[0] = false;	
        	}
        }
		, error : function() {
			alert('서버 통신 실패');
		}
    });
	
	if(isId(userId.value)){
		//아이디의 규칙을 지켰을때
		str = "";
		idbool[1] = true;
		console.log("규칙을지킨아이디1"+idbool[1]);
	}else{
		//아이디의 규칙을 실패했을때
		str="영문자로 시작하는 영문자 또는 숫자 7~20자";
		//userId.focus(); 커서 안움직이게 하는것도 좋은가?
		idbool[1] = false;
		console.log("규칙을안지킨아이디1"+idbool[1]);
	}
	//아이디의 규칙을 지키고 데이터베이스에 중복이 안되었을때
	if(idbool[0] == true && idbool[1] == true){
		boolarr[0] = true;	
		boolarrcheck();
	}else{
		boolarr[0] = false;	
	}
	//오류창을 띄운다
	$(".memberBox1 h4").html(str);
}

//비밀번호 정규식 확인
function checkPw(){
	console.log(userPw.value);
	console.log(isPw(userPw.value));
	if(isPw(userPw.value)){
		//비밀번호의 규칙을 지켰을때
		str = "";
		boolarr[1] = true;
		//boolarrcheck();
	}else{
		//비밀번호의 규칙을 실패했을때
		str="숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상";
		boolarr[1] = false;
		//boolarrcheck();
	}
	$(".memberBox2 h4").html(str);
}

//비밀번호가 같은지 확인하기
function checkPwCheck(){
	console.log(userPw.value);
	console.log(userPwCheck.value);
	if(userPw.value==userPwCheck.value){
		//비밀번호가 같습니다
		str = "";
		boolarr[2] = true;
		//boolarrcheck();
	}else{
		//비밀번호의 규칙을 실패했을때
		str="비밀번호가 같지 않습니다";
		boolarr[2] = false;
		//boolarrcheck();
	}
	$(".memberBox3 h4").html(str);
}

//이름이 비어있다면
function checkName(){
	if(userName.value!=""){
		//이름을 적었다면
		str = "";
		boolarr[3] = true;
		//boolarrcheck();
	}else{
		//이름이 비어있다면
		str = "이름을 적지 않았습니다";
		boolarr[3] = false;
		//boolarrcheck();
	}
	$(".memberBox4 h4").html(str);
}

//날짜를 입력하지 않았을때 4자리인지 검사해야한다
function chaeckYy(){
	console.log("년도의 길이"+userYy.value.length);
	if(userYy.value!=""){
		//년도를 입력했다면
		 if(!isYy(userYy.value)){
			str ="숫자를 입력하지 않았거나 자릿수가 4자리가 아닙니다.";
			birthbool[0] = false;
		 }else{
			 str = "";
			 birthbool[0] = true;
			 chaeckBirth();			 
		 }
	}else{
		//년도를 입력하지 않았다면
		str ="년도를 입력하지 않았습니다";
		birthbool[0] = false;
	}
	console.log(userYy.value);
	console.log(str);
	$(".memberBox5 h4").html(str);
}
//날짜를 입력하지 않았을때
function chaeckMm(){
	if(userMm.value!=""){
		//월을 입력했다면
		str = "";
		birthbool[1] = true;
		chaeckBirth();
	}else{
		//월을 입력하지 않았다면
		str ="월을 입력하지 않았습니다";
		birthbool[1] = false;
	}
	console.log(userMm.value);
	console.log(str);
	$(".memberBox5 h4").html(str);
}
//날짜를 입력하지 않았을때
function chaeckDd(){
	if(userDd.value!=""){
		//일을 입력했다면
		if(!isDd(userDd.value)){
			str="일(2자)을 입력하지 않았습니다.";
			birthbool[2] = false;
		}else{
			str = "";
			birthbool[2] = true;
			chaeckBirth();			
		}
	}else{
		//일을 입력하지 않았다면
		str ="일(2자)을 입력하지 않았습니다";
		birthbool[2] = false;
	}
	console.log(userDd.value);
	console.log(str);
	$(".memberBox5 h4").html(str);
}


//날짜를 입력
function chaeckBirth(){
	if(birthbool[0] == true&&birthbool[1] == true &&birthbool[2] == true){
		userBirth.value = userYy.value+userMm.value+userDd.value;		
		console.log("생년월일"+userBirth.value);
		boolarr[4] = true;
	}else{
		boolarr[4] = false;
	}
	if(userBirth.value.length != 8){
		str = "생년월일을 전부 입력하지 않았습니다";
	}
}
// 성별을 확인
function chaeckGender(){
	if(userGender.value != "none"){
		//성별을 선택했을때
		str = "";
		boolarr[5] = true;
		//boolarrcheck();
	}else{
		//성별을 선택을 안했을때
		str="성별을 선택해주세요";
		boolarr[5] = false;
		//boolarrcheck();
	}
	$(".memberBox6 h4").html(str);
}
//이메일 확인
function chaeckEmail(){
	if(isEmail(userEmail.value) || userEmail.value==""){
		//이메일을 정상
		str = "";
		emailNo = true;
		boolarr[6] = true;
		//boolarrcheck();
	}else{
		//이메일의 형식이 아닐때
		str="정상적인 이메일의 형식이 아닙니다";
		emailNo = false;
		boolarr[6] = false;
		//boolarrcheck();
	}
	
	$(".memberBox7 h4").html(str);
}
//휴대폰 확인
function chaeckPhone(){
	if(isPhone(userPhone.value)){
		//휴대폰 정상
		str = "";
		boolarr[7] = true;
		//boolarrcheck();
	}else{
		//휴대폰 형식이 아닐때
		str="정상적인 휴대폰번호가 아닙니다";
		boolarr[7] = false;
		//boolarrcheck();
	}
	$(".memberBox8 h4").html(str);
}



//정규식 처리

//영문자로 시작하는 영문자 또는 숫자 6~20자 6자는 오류
function isId(asValue){
	var regExp = /^[A-Za-z]{1}[A-Za-z0-9]{6,19}$/;
	return regExp.test(asValue);
}
//숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
function isPw(asValue){
	var regExp = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{7,}$/;
	return regExp.test(asValue);
}
//이메일 형식 확인
function isEmail(asValue){
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	return regExp.test(asValue);
}
//휴대폰 정규식
function isPhone(asValue){
	var regExp = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
	return regExp.test(asValue);
}
//년도 정규식
function isYy(asValue){
	var regExp =/^\d{4}$/;
	return regExp.test(asValue);
}
//일 정규식
function isDd(asValue){
	var regExp =/^(0[1-9]|[12][0-9]|3[0-1])$/;
	return regExp.test(asValue);
}



