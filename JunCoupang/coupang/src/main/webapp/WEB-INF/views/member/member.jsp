<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="/resources/css/member/member.css">
	<link rel="shortcut icon" href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico" type="image/x-icon">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/resources/js/member/member.js"></script>
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
        
        <div id="title">
            <p>회원 정보를 입력하세요.</p>
        </div>

        <form action="/member" method="post">
            <table>
                <tr class="memberBox1">
                    <th>
                        <label for="userId">아이디</label>
                    </th>
                    <td>
                        <input type="text" name="id" id="userId" placeholder="아이디">
                        <div id="idCheck" class="waring"></div>
                    </td>
                </tr>
                <tr class="memberBox2">
                    <th>
                        <label for="userPw">비밀번호</label>
                    </th>
                    <td>
                        <input type="password" name="password" id="userPw" placeholder="비밀번호">
                        <div id="pwCheck" class="waring"></div>
                    </td>
                </tr>
                <tr class="memberBox3">
                    <th>
                        <label for="userPwOk">비밀번호 확인</label>
                    </th>
                    <td>
                        <input type="password" id="userPwOk" placeholder="비밀번호 확인">
                        <div id="pwOkCheck" class="waring"></div>
                    </td>
                </tr>
                <tr class="memberBox4">
                    <th>
                        <label for="userName">이름</label>
                    </th>
                    <td>
                        <input type="text" name="name" id="userName" placeholder="이름">
                        <div id="nameCheck" class="waring"></div>
                    </td>
                </tr>
                <tr class="memberBox5">
                    <th>
                        <label for="userEmail">이메일</label>
                    </th>
                    <td>
                        <input type="email"  name="email" id="userEmail" placeholder="이메일">
                        <div id="emailCheck" class="waring"></div>
                        <div id="emailNum">
                            <input type="text" class="emailOK" placeholder="인증번호" disabled>
                            <div class="emailBtn">인증번호 받기</div>
                        </div>
                        <div id="emailOkCheck" class="waring"></div>
                    </td>
                </tr>


                
                
            </table>
            <div class="join">
                <input type="submit" class="joinBtn" value="가입하기">
            </div>
        </form>
    </div>
</body>
</html>