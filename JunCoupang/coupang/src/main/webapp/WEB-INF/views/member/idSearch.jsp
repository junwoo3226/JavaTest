<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 찾기</title>
	<link rel="stylesheet" href="resources/css/member/email.css">
	<link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/resources/js/member/login.js"></script>
</head>
<body>
	<div id="warp">
		<header class="member-header">
			<h1 class="logo">
				<a href="/" class="logoLink">
					<img src="//static.coupangcdn.com/image/static/login/logo-coupang.x2.20201201.png" width="100%" height="100%" class="member-logo__img-fixer" alt="coupang">
				</a>
			</h1>
		</header>
		
		<c:choose>
			<c:when test="${idResult eq 0}">
				<form action="/idSearch" method="post">
					<div>
						<h2>아이디 찾기</h2>
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