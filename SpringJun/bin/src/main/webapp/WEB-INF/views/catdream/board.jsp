<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <link rel="icon" href="./img/logo.png" type="resources/img/x-icon">
    <link rel="stylesheet" href="resources/css/badStyle.css">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/footer.css">
</head>
<body>

	<div id="wrap">
		<%@ include file="header.jsp" %>

	    <div id="container">
	        <div id="containerIn">
	            <h1 class="conTitle">공지사항</h1>
	            <div class="board">
	                <ul>
	                    <li class="main">
	                        <p class="mainNum">번호</p>
	                        <p class="mainTitle">제목</p>
	                        <p class="mainUser">작성자</p>
	                        <p class="mainDate">날짜</p>
	                        <p class="mainCheck">조회</p>
	                    </li>
	                    <li>
	                        <p class="gong">공지</p>
	                        <p class="title"><a href="/boardDetail">[결제] -Parameter가 정상적이지 않습니다 - 확인 시 조치방법 안내 (패치완료)</a></p>
	                        <p class="user">CatDream</p>
	                        <p class="date">2021-08-28</p>
	                        <p class="check">2381</p>
	                    </li>
	                    <li>
	                        <p class="gong">공지</p>
	                        <p class="title"><a href="/boardDetail">COVID-19 예방을 위한 캣드림의 체계적인 방역 관리 솔루션!</a></p>
	                        <p class="user">CatDream</p>
	                        <p class="date">2020-03-18</p>
	                        <p class="check">20204</p>
	                    </li>
	                    <li>
	                        <p class="num">1</p>
	                        <p class="title"><a href="/boardDetail">10월 대체공휴일 지정에 따른 출고 및 배송일정 안내</a></p>
	                        <p class="user">CatDream</p>
	                        <p class="date">2021-09-29</p>
	                        <p class="check">224</p>
	                    </li>
	                    <li>
	                        <p class="num">2</p>
	                        <p class="title"><a href="/boardDetail">[이벤트 종료]5만원 이상 구매시, 10,000원 상당 영양제 무료 증정!</a></p>
	                        <p class="user">CatDream</p>
	                        <p class="date">2021-02-17</p>
	                        <p class="check">2545</p>
	                    </li>
	                </ul>
	            </div> <!--.board-->
	
	        </div>  <!--#containerIn-->
	    </div> <!--#container-->



		<%@ include file="footer.jsp" %>

    </div>
</body>
</html>