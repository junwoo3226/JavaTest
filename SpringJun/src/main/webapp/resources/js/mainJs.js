$(document).ready(function(){
   //$('.slides').bxSlider();
   
   var mySlider = $( '.slides' ).bxSlider( {
	   mode: 'horizontal',// 가로 방향 수평 슬라이드
	   speed: 300,        // 이동 속도를 설정
	   controls: true,    // 이전 다음 버튼 노출 여부
	   pager: true,      // 현재 위치 페이징 표시 여부 설정
	   moveSlides: 1,     // 슬라이드 이동시 개수
	   slideWidth: 1200,   // 슬라이드 너비
	   minSlides: 1,      // 최소 노출 개수
	   maxSlides: 1,      // 최대 노출 개수
	   auto: true,        // 자동 실행 여부
	   autoHover: true   // 마우스 호버시 정지 여부
	   
   });
   
   //이전 버튼을 클릭하면 이전 슬라이드로 전환
	  $( '#prevBtn' ).on( 'click', function () {
	   mySlider.goToPrevSlide();  //이전 슬라이드 배너로 이동
	   return false;              //<a>에 링크 차단
	  });

	    //다음 버튼을 클릭하면 다음 슬라이드로 전환
	  $( '#nextBtn' ).on( 'click', function () {
	   mySlider.goToNextSlide();  //다음 슬라이드 배너로 이동
	   return false;
	  });

 });







