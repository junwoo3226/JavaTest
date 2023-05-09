<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="/resources/css/member/login.css">
	<link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/resources/js/member/login.js"></script>
</head>
<body>
	<div id="wrap">
        <header class="member-header">
            <h1 class="logo">
                <a href="/" class="logoLink">
                    <img src="//static.coupangcdn.com/image/static/login/logo-coupang.x2.20201201.png" width="100%"
                        height="100%" class="member-logo__img-fixer" alt="coupang">
                </a>
            </h1>
        </header>

        <form action="/login" method="post">
            <table>
                <tr class="memberBox1">
                    <th>
                        <label for="userId">아이디</label>
                    </th>
                    <td>
                        <input type="text" name="id" id="userId" placeholder="아이디">
                    </td>
                </tr>
                <tr class="memberBox2">
                    <th>
                        <label for="userPw">비밀번호</label>
                    </th>
                    <td>
                        <input type="password" name="password" id="userPw" placeholder="비밀번호">
                    </td>
                </tr>

            </table>
            <div class="Utill">
	            <div class="idSave">
	            	<label><input type="checkbox" id="idSave"> 아이디 저장</label>
	            </div>
	          	<div class="UtillR">
					<div class="idSearch">
						<label class="idBtn"><a href="/idSearch">아이디 찾기</a></label>
					</div>
					<div class="pwSearch">
						<label class="pwBtn"><a href="/pwSearch">비밀번호 찾기</a></label>
					</div>
	          	</div>	          	
            </div>
			            
            <div class="login">
                <input type="submit" class="loginBtn" value="로그인">
            </div>
            
            
        </form>
		<div class="join">
			<a class="joinBtn" href="/member">회원가입</a>
		</div>
    </div>
</body>
</html>