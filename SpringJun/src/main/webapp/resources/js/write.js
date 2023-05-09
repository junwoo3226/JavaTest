/**
 * 
 */


$(document).ready(function () {
	
	var code;
    $("#btnList").click(function(e){
    	
    	code = $("#title").val();
    	var count = 0;
    	var searchChar = ' '; // 찾으려는 문자
    	var pos = code.indexOf(searchChar); //pos는 0의 값을 가집니다.
    	while (pos !== -1) {
    		  count++;
    		  pos = code.indexOf(searchChar, pos + 1); // 첫 번째 a 이후의 인덱스부터 a를 찾습니다.
    	}
    	console.log(count);
       if(code == "") {

          alert("제목은 필수입니다.");

          $("#title").focus();
       }else if(count==code.length){
		   alert("제목은 필수입니다.");
	
	       $("#title").focus();
       }else{
    	   alert("작성완료");
    	   $("#writeForm").submit();
       }
       
   })
       
    
    $('#summernote').summernote({
      height: 500,                 
      minHeight: 500,            
      maxHeight: 500,            
      focus: true,                  
      lang: "ko-KR",					
      placeholder: '내용을 입력해주세요.',	
      toolbar: [
        ['fontname', ['fontname']],
        ['fontsize', ['fontsize']],
        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
        ['color', ['forecolor', 'color']],
        ['table', ['table']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['insert', ['picture', 'link', 'video']],
        ['view', ['fullscreen', 'help']]
      ],
      fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체',
        '굴림', '돋음체', '바탕체'],
      fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36',
        '50', '72']
    });
    
    
 });
