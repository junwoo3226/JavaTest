<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" href="resources/css/email.css">
    	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="./resources/js/email.js"></script>
		<script type="text/javascript" src="./resources/js/infoSearch.js"></script>
</head>
<body>
	<div>
		<a href="/catdream">
            <h1 class="">Cat Dream</h2>
        </a>

	<c:choose>
		<c:when test="${idResult eq 0}">
			<form action="/idSearch" method="post">
			<div>
				<h2>아이디 찾기</h1>
			</div>
			<div>
				<h2>이름</h2>
				<input name="name" type="text" class="inputText1" id="userName" placeholder="이름">
			</div>
			<div class="emailBox">
				<h2>이메일</h2>
				<input name="email" type="text" class="inputText1" id="userEmail">
				<div class="emailCheckBox">
					<div class="emailCheckInputBox" id="emailCheckInputBoxFalse">
			        	<input name="emailCheckInput" type="text" class="inputText1" id="userEmailCheckInput" placeholder="인증번호 입력하세요" disabled="disabled">
		            </div>
		            <div class="emailButton">인증번호 받기</div>
				</div>
		        <span class="ErrorMsg"></span>
			</div>
			<div>
				<input type="submit" value="아이디찾기">
			</div>
		</form>
		</c:when>
		
		<c:when test="${idResult eq 1}">
			<form action="/passwordReset" method="post">
				<input type="hidden" name="id" class="inputText1" id="userId" value="${id}">
				<div>
					<h2>비밀번호 찾기</h1>
				</div>
				<div>
					<h2>이름</h2>
					<input name="name" type="text" class="inputText1" id="userName" placeholder="이름">
				</div>
				<div class="emailBox">
					<h2>이메일</h2>
					<input name="email" type="text" class="inputText1" id="userEmail">
					<div class="emailCheckBox">
						<div class="emailCheckInputBox" id="emailCheckInputBoxFalse">
				        	<input name="emailCheckInput" type="text" class="inputText1" id="userEmailCheckInput" placeholder="인증번호 입력하세요" disabled="disabled">
			            </div>
			            <div class="emailButton">인증번호 받기</div>
					</div>
			        <span class="ErrorMsg"></span>
				</div>
				<div>
					<input type="submit" value="비밀번호찾기">
				</div>
			</form>
		</c:when>
		<c:otherwise>
			<div>없음</div>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>