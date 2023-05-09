/**
 * 
 */
$(document).ready(function(){
	
	console.log("infoSearch실행");
	
	console.log("infoSearch실행Email");
	Email(); //실행오류 리턴으로 값을 가져오면 제일좋다
	
	// 이메일이 정상적으로 들어왔다면
	console.log(($(".ErrorMsg").class) == "correct");
	
	
	
});

//addJavascript('./resources/js/test.js');
//파일을 그냥 실행시켜버림
function addJavascript(jsname) {
	var th = document.getElementsByTagName('head')[0];
	console.log(th)
	var s = document.createElement('script');
	s.setAttribute('type','text/javascript');
	s.setAttribute('src',jsname);
	th.appendChild(s);
}


