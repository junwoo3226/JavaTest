var replyService=(function(){
	//댓글 쓰기
	function add(reply,callback){
		console.log("add...")
		$.ajax({
			url:"/replies/new",
			type:"post",
			data:JSON.stringify(reply),
			contentType:"application/json; charset=UTF-8",
			success:function(result){	
				console.log(result);
				if(callback)
					callback(result);
			},	
			error:function(){		 	
			}
		})
	}

	//댓글 목록 가져오기
	function getList(param,callback){
		var bno=param.bno;
		$.getJSON(
				"/replies/list/"+bno+".json",
				function(data){
					if(callback)
						callback(data);
				}	
		)
	}
	
	//댓글 수정을 하기위한 함수
	function reupdate(reply,callback){
		$.ajax({
			url:"/replies/update",
			type:"put",
			data:JSON.stringify(reply),
			contentType:"application/json; charset=UTF-8",
			success:function(result){	
				if(callback)
					callback(result);
			},	
			error:function(){		
				
			}
		})
		
	}
	
	//댓글 삭제를 하기 위한 함수 선언
	function remove(reply,callback){
		$.ajax({
			url:"/replies/remove",
			type:"delete",
			data:JSON.stringify(reply),
			contentType:"application/json; charset=UTF-8",
			success:function(result){	
				console.log(reply)
				if(callback)
					callback(result);
			},	
			error:function(){		
				
			}
		})
		
	}
	
	return {
		bbb:add,
		ccc:getList,
		reupdate:reupdate,
		remove:remove
		};
	
})()



$(document).ready(function(){

	//bno값 출력하기
	var bno=$("#bno").html();

	// 상세페이지가 시작되자마자 이미지를 출력하가 위한 ajax
	$.getJSON(				
			"/board/fileList/"+bno+".json",
			function(data){		
				console.log(data)
				
				var str="";
				
				$(data).each(function(i,obj){
					 var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
				     var fileCallPath2 = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName)
					 if(!obj.image){
				         str+="<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-fileName='" + obj.fileName + "' data-type='" + obj.image + "'>"
				         str+="<a href='/download?fileName="+ fileCallPath +"'>"+obj.fileName+"</a></li>"
				      }else{
				         console.log(fileCallPath);
				         str+="<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-fileName='" + obj.fileName + "' data-type='" + obj.image + "'>"
				         str+="<img src='/display?fileName=" + fileCallPath2 + "'></li>"
				      }
				})
				
				$("#uploadResult ul").html(str);
				
				console.log($("#testBox").html());
				if($("#testBox").html()==""){
					$("#attachBox").css("display","none");
				}
			}	
	)
	

	//댓글 작성 버튼을 클릭하면
	$("#rewrite").on("click",function(){
		var reply=$("#replyWrite").val()
		var replyer=$("input[name='replyer']").val()
		var memberId=$("input[name='memberId']").val()
		
		replyService.bbb({reply:reply,replyer:replyer,bno:bno,memberId:memberId},
			function(result){
				$("#replyWrite").val('');
				location.reload();
		});
	})
	
	//댓글 작성 버튼을 클릭하면 비회원일시
	$("#rewrite2").on("click",function(){
		alert("로그인 해주세요!!!");
	})

	
	//햄버거버튼
	$(".hbgBtn").on("click",function(e){
		e.stopPropagation();
		$(this).children(".replyMenu").toggle();
	})

	//1. 수정
	$(".replyMode").on("click",function(e){
		e.stopPropagation();
		$(this).closest('.replyBoxing').children(".replyBox").hide();
		$(this).closest('.replyBoxing').children(".modeComment").css('display','block');
	})
	
	//1-1. 댓글 수정 버튼을 클릭하면
	$(".reModify").on("click",function(){
		var reply={rno:$(this).closest('.modeComment').find(".rno").val(),reply:$(this).closest('.modeComment').find('#modeRcoment').val()};
		replyService.reupdate(reply,function(update){
			location.reload();
		})
		
		
	})
	
	//1-2. 취소 클릭시
	$(".cancel").on("click",function(e){
		location.reload();
	})
	
	//2. 삭제
	$(".replyDelete").on("click",function(e){	
		console.log($(this).closest('.replyBoxing').find(".rno").val())
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			var reply={rno:$(this).closest('.replyBoxing').find(".rno").val()}
			replyService.remove(reply,function(remove){
		    	   location.reload();
			})
	    }else{
	       e.preventDefault();
	    }
		
	})
	
	
	
	
	
	
	
	
	
	
	
	$(document).click(function(){
	    $('.replyMenu').hide();
	});
	
	
	
	
	
	
	
	
	

	
})   //$(document).ready(function(){ 끝











