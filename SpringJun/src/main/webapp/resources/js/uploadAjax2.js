/**
 * 
 */

$(document).ready(function(){


	
   //파일의 크기와 확장자를 검사하는 함수 선언
   //서버에서 설정해 놓은 파일크기 설정
   var maxSize=5242880; //5MB
   //서버에서 허용 가능한 확장자 설정(정규식)
   var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
   
                         //파일크기 , 확장자
   function checkExtension(fileSize,fileName){
      //사용자가 선택한 파일의 크기가 서버에서 설정해 놓은 파일의 크기보다 이상이면
      if(fileSize>=maxSize){
         alert("파일 사이즈 초과");
         return false;
      }
      //사용자가 선택한 파일의  확장자가 서버에서 설정해 놓은 파일의 확장자와 일치하지 않으면
      if(regex.test(fileName)){
         alert("해당 종류의 파일은 업로드 할 수 없습니다.");
         return false;
      }
      return true;
   }
   
   
   var formObj = $("form[role='form']")
   // 글쓰기 버튼을 클릭하면
   $("input[type='submit']").on("click",function(e){
      e.preventDefault();
      var str="";
      $("#uploadResult ul li").each(function(i,obj){
         console.log(obj);
         str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+$(obj).data("filename")+"'>"
         str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+$(obj).data("uuid")+"'>"
         str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+$(obj).data("path")+"'>"
         str+="<input type='hidden' name='attachList["+i+"].image' value='"+$(obj).data("type")+"'>"
      })
    
      formObj.append(str).submit();
      
   })
   
   
   // 파일 선택의 내용이 변경되면
   $("input[type='file']").on("change",function(e){
      //가상의 form태그
      var formData = new FormData();
      var inputFile = $("input[name='uploadFile']");
      var files = inputFile[0].files;
   
      
      for(var i=0;i<files.length;i++){
         if(!checkExtension(files[i].size,files[i].name)){
            return false;
         }
         formData.append("uploadFile",files[i]);
         
      }
      
      $.ajax({
         url:"/uploadAjaxAction",
         type:"post",
         data:formData,
         processData:false, 
         contentType:false,
         success:function(result){ //사용자가 선택한 파일을 원하는 경로에 성공적으로 업로드 한 후
            showUploadedFile(result);
         }
      })//$.ajax 끝
      
   })
})// $(document).ready 끝

//사용자가 선택한 파일을 원하는 경로에 성공적으로 업로드 한 후 웹브라우저에 파일을 띄워라에 대한 함수 선언(showUploadedFile)
function showUploadedFile(uploadResultArr){
   
   var str="";                    //번째,값
   
   $(uploadResultArr).each(function(i,obj){ //each jquery의 반복문
      console.log(obj);

      var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
      var fileCallPath2 = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName)
      if(!obj.image){
         //사용자가 업로드 한 파일의 타입이 이미지가 아니면(excel문서파일,ppt파일),
         console.log("이미지 파일 아님");
         str+="<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-fileName='" + obj.fileName + "' data-type='" + obj.image + "'>"
         str+="<a href='/download?fileName="+ fileCallPath +"'>"+obj.fileName+"</a></li>"
      }else{
         //var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName)
         // 사용자가 업로드 한 파일의 타입이 이미지이면 (.jpg,.png,.gif)
         // img태그를 사용해서 웹브라우저 이미지 출력
         console.log(fileCallPath);
         str+="<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-fileName='" + obj.fileName + "' data-type='" + obj.image + "'>"
         str+="<img src='/display?fileName=" + fileCallPath2 + "'></li>"
      }
    })
    
   $("#uploadResult ul").html(str);
}
