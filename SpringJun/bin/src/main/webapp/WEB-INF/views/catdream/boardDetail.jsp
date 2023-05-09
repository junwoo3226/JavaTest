<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="resources/css/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/boardDetail.css">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<%@ include file="header.jsp" %>
		<div class="container">
		    <h2 class="notice">공지사항</h2>
		    <div class="board">
		        <div class="top">
		            <h3 class="title">10월 대체공휴일 지정에 따른 출고 및 배송일정 안내</h3>
		            <span class="writer">캣드림</span>
		        </div>
		        <div class="center">
		            <p class="regdate">Posted at 2021-09-29 15:46:10</p>
		            <p class="content">
		                안녕하세요~ 오늘도 저희 고양이왕국을 찾아주셔서 대단히 감사드립니다.<br>
		                <span class="sunder">10월 4일, 10월 11일 대체 공휴일 지정</span>에 따른 출고 및 배송일정을 안내해드리오니 구매에 참고부탁드리겠습니다.<br><br>
		
		                <span class="sblue">10/4 (월) 개천절 대체공휴일</span> - 왕국 정상 출고(업체배송상품제외) / CJ택배 배송 휴무<br><br>
		
		                <span class="sred">10/9 (토) 한글날 - 왕국 출고 휴무 / CJ택배 배송 휴무</span><br><br>
		
		                <span class="sblue">10/11 (월) 한글날 대체공휴일</span> - 왕국 정상 출고(업체배송상품제외) / CJ택배 배송 휴무<br><br>
		
		
		                8일 오후 5시 이후 주문건은 11일부터 순차적으로 출고되신답니다~<br>
		                배송에 관해 좀 더 자세한 안내가 필요하실 경우 고양이왕국 고객센터1688-7079로 연락주시기 바랍니다!!<br><br>
		
		                감사합니다^^
		            </p>
		        </div>
		        <div class="bottom">
		            <a href="/board" class="btn" id="btnList">목록보기</a>
		            <a class="btn" id="btnWrite">글쓰기</a>
		        </div>
		    </div>
		</div>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>