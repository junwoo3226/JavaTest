$(document).ready(function(){
   console.log("detail.js 실행");
   
	var aft=$('.imgs').attr('src');
	//기존의 src 값에서 \(백슬럿
	aft=aft.replaceAll('\\', '/');
	console.log(aft);
	$('.imgs').attr('src',aft);
})