<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/login.css">
    <title>로그인</title>
</head>
<body>
    <div id="loginWrap">
        <div class="loginIn">
            <h1>로그인</h1>

            <div class="loginBox1">
                <h2 class="loginTitle">회원 로그인</h2>
                <div class="loginUser">
                    <div class="loginL">
                        <div class="loginLUp">
                            <input type="text"  class="inputText1" id="userId" placeholder="아이디">
                        </div>
                        <div class="loginLDown">
                            <input type="text" class="inputText1" id="userPw"  placeholder="비밀번호">
                        </div>
                    </div>
                    <div class="loginR">
                        <a href="">
                            <div class="loginButton">로그인</div>
                        </a>
                    </div>
                </div>
                <div class="loginBox2">
                    <div class="loginMember">
                        <a href="/member">
                            <div class="memberButton">회원가입</div>
                        </a>
                    </div>
                    <div class="idSearch">
                        <a href="">
                            <div class="idButton">아이디 찾기</div>
                        </a>
                    </div>
                    <div class="pwSearch">
                        <a href="">
                            <div class="pwButton">비밀번호 찾기</div>
                        </a>
                    </div>
                </div>
                <div class="facebookLogin">
                    <a href="">
                        <div class="facebookButton">페이스북아이디로그인</div>
                    </a>
                </div>
                <h2 class="noneMemberOrder">비회원 주문조회</h2>
                <div class="noneUser">
                    <div class="noneMemberOrderL">
                        <div class="noneMemberOrderLUp">
                            <input type="text" class="inputText1" placeholder="주문자명">
                        </div>
                        <div class="noneMemberOrderLDown">
                            <input type="text" class="inputText1" placeholder="주문번호">
                        </div>
                    </div>
                    <div class="noneMemberOrderR">
                        <div class="checkButton">확인</div>
                    </div>
                </div>
                <p class="cautions">주문번호와 비밀번호를 잊으신 경우, 고객센터로 문의하여 주시기 바랍니다.</p>
            </div>
        </div>
    </div>
</body>
</html>