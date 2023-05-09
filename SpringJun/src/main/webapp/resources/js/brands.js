$(document).ready(function(){
   console.log("brands.js 실행");
   
   //기존의 src값 가져오기
   var pno = $("img").data("id");
   var img=$(".imgs")
   var aft=$("img[data-id = '"+ pno +"']").attr('src');
      //기존의 src 값에서 \(백슬럿
      
      for(let i=1;i<=img.length;i++){
         aft = $("img[data-id = '"+ i +"']").attr('src');
         aft=aft.replaceAll('\\', '/');
         console.log(i);
         console.log(aft);
         $("img[data-id = '"+ i +"']").attr('src',aft);
      }
   


})