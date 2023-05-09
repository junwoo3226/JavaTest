<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="./resources/js/idInput.js"></script>
</head>
<body>
	<div>
		<h2>비밀번호 찾기</h2>
	</div>
	<form action="/infoSearch" method="post">
		<div>
			<h2>아이디를 입력하세요</h2>
			<input type="text" name="id" class="inputText1" id="userId">
		</div>
		<div>
			<input type="submit" id="idSubmit" value="입력하기">
		</div>
	</form>
</body>
</html>