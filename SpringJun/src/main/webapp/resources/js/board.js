/**
 * 
 */
$(document).ready(function(){
	var actionForm = $("#actionForm");
	// 현재 페이지 번호를 클릭하면 form태그 안에 있는 search
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	})

	$(".AS").on("click",function(){
		actionForm.find("input[name='pageNum']").val("1");
	})

	// 선택체크 상자 선언
	var hjwObj = document.getElementsByName("RowCheck");
	// 선택체크 상자 길이 선언
	var rowCnt = hjwObj.length;
	// 선택체크상자 배열 선언
	var hjw_listArr = $(hjwObj); 

	// 전체 체크상자 활성 비활성
	if(hjw_listArr.length == 0){
		console.log("RowCheck의 갯수가 0이면 전체선택 비활성화");
		$("#allCheck").attr("disabled", true);
	}else{
		console.log("RowCheck의 개수가 1개이상임 전체선택 활성");
	}
	
	// 전체선택상자 활성화
	$(hjwObj).click(function() {
		if ($(hjwObj.checked).length == rowCnt) {
			$("input[name='allCheck']")[0].checked = true;
		} else {
			$("input[name='allCheck']")[0].checked = false;
		}
	});
	
	// 전체 체크상자 클릭했을때 모두 선택
	$("input[name='allCheck']").click(function() {
		for (let i = 0; i < hjw_listArr.length; i++) {
			hjw_listArr[i].checked = this.checked;
		}
	});
	
	// 전체 체크상자 바꿨을때 선택삭제 상자 활성 비활성
	$("input[name='allCheck']").change(function(){
		if($(this).prop("checked")){
			$(".chooseBtn").removeClass("none");
		}else{
			$(".chooseBtn").addClass("none");
		}
		
	});
	
	// 선택상자 바꿨을때 선택삭제 상자 활성 비활성
	$(hjwObj).change(function(){
		// 활성화 구분하기위한 선언
		var boolnone = false;
		for (let i = 0; i < hjw_listArr.length; i++) {
			if($(hjwObj)[i].checked == true){
				boolnone= true;					
			}
		}
		if(boolnone){
			$(".chooseBtn").removeClass("none");				
		}else{
			$(".chooseBtn").addClass("none");
		}
		
	});
	
	

})


// 삭제 함수 선언
function deleteValue() {
	var url = "remove"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
	var valueArr = new Array();
	var list = $("input[name='RowCheck']");
	
	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
			valueArr.push(list[i].value);
		}
	}
	
	if (valueArr.length == 0) {
		alert("선택된 글이 없습니다.");
	} else {
		confirm("정말 삭제하시겠습니까?");
		$.ajax({
			url : url, // 전송 URL
			type : 'POST', // GET or POST 방식
			traditional : true,
			data : {
				valueArr : valueArr
			// 보내고자 하는 data 변수 설정
			},
			success : function(data) {
				if (data = 1) {
					alert("삭제 성공");
					location.replace("board")
				} else {
					alert("삭제 실패");
				}
			}
		});
	}
}