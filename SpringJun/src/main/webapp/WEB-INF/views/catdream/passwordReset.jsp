<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="passwordResetGo" method="post">
			<input type="hidden" name="id" class="inputText1" id="userId" value="${id}">
			<h2>비밀번호 재설정</h2>
			<input type="password" name="password" class="inputText1" id="userPw">
			<h2>비밀번호 재설정 재확인</h2>
			<input type="password" class="inputText1" id="userPwCheck">
			<input type="submit" class="" value="변경하기">
		</form>
	</div>
</body>
</html>