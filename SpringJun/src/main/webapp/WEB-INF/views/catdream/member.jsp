<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" href="resources/img/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="resources/css/member.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="./resources/js/member.js"></script>
    <title>회원가입</title>
</head>
<body>
    <div id="memberWrap">
        <div class="memberIn">
        <a href="/catdream">
            <h2 class="memberTitle">Cat Dream</h2>
        </a>
            <form action="/member" method="post" onsubmit="return boolarrcheck();">
            
            <ul>
             	<li class="memberBox0">
                    <!-- 
                    	<h3>
                        	<label for="">직급</label>
                    	</h3>
                     -->
                    <input type="hidden" name="jobrand" class="inputText1" id="userJobrand">
                </li>
                <li class="memberBox1">
                    <h3>
                        <label for="">아이디(필수)</label>
                    </h3>
                    <input type="text" name="id" class="inputText1" id="userId">
                    <h4></h4>
                </li>
                <li class="memberBox2">
                    <h3>
                        <label for="" >비밀번호(필수)</label>
                    </h3>
                    <input type="password" name="password" class="inputText1" id="userPw">
                    <h4></h4>
                </li>
                <li class="memberBox3">
                    <h3>
                        <label for="">비밀번호 재확인(필수)</label>
                    </h3>
                    <input type="password" class="inputText1" id="userPwCheck">
                    <h4></h4>
                </li>
                <li class="memberBox4">
                    <h3>
                        <label for="">이름(필수)</label>
                    </h3>
                    <input name="name" type="text" class="inputText1" id="userName">
                    <h4></h4>
                </li>
                <li class="memberBox5">
                    <h3>
                        <label for="">생년월일(필수)</label>
                    </h3>
                    <input type="text" class="inputText2" id="userYy" placeholder="년(4자)">
                    <select class="inputText3" id="userMm" >
                        <option value="none">월</option>
                        <option value="01">1월</option>
                        <option value="02">2월</option>
                        <option value="03">3월</option>
                        <option value="04">4월</option>
                        <option value="05">5월</option>
                        <option value="06">6월</option>
                        <option value="07">7월</option>
                        <option value="08">8월</option>
                        <option value="09">9월</option>
                        <option value="10">10월</option>
                        <option value="11">11월</option>
                        <option value="12">12월</option>
                    </select>
                    <input type="text"  class="inputText2" id="userDd"  placeholder="일(2자)">
                    <h4></h4>
                    
                    <input name="birth" class="inputText1" type="hidden" id="userBirth">
                </li>
                <li class="memberBox6">
                    <h3>
                        <label for="">성별(필수)</label>
                    </h3>
                    <select name="gender" class="inputText1" id="userGender">
                        <option value="none" selected>성별</option>
                        <option value="M">남자</option>
                        <option value="F">여자</option>
                        <option value="U">선택 안함</option>
                    </select>
                    <h4></h4>
                </li>
                <li class="memberBox7">
                    <h3>
                        <label for="" placeholder="선택입력">본인 확인 이메일(필수)</label>
                    </h3>
                    <input name="email" type="text" class="inputText1" id="userEmail">
                    <div class="number">
                    	<div class="emailCheckInputBox" id="emailCheckInputBoxFalse">
	                        <input name="emailCheckInput" type="text" class="inputText4" id="userEmailCheckInput" placeholder="인증번호 입력하세요" disabled="disabled">
                    	</div>
                        <div class="emailButton">인증번호 받기</div>
                    </div>
                    <h4 class="ErrorMsg"></h4>
                </li>
                <li class="memberBox8">
                    <h3>
                        <label for="">휴대전화(번호만)</label>
                    </h3>
                    <select name="" class="inputText1" id="">
                        <option value="82" selected>대한민국 +82</option>
                        <option value="233">가나 +233</option>
                        <option value="30">그리스 +30</option>
                        <option value="224">기니 +224</option>
                    </select>
                    <div class="number">
                    	<div id="phoneCheckInputBoxFalse">
	                        <input name="phone" type="text" class="inputText4" id="userPhone" placeholder="전화번호 입력하세요">                    	
                    	</div>
                        <div class="phoneButton">인증번호 받기</div>
                    </div>
                    <h4></h4>
                    <input type="text" class="inputText1" id="" placeholder="인증번호 입력하세요" disabled="disabled">
                </li>

                <li class="memberBox9">
                	<input type="submit" class="memberButton" value="가입하기">
                    <!-- <a href=""><div class="memberButton">가입하기</div></a> -->
                </li>
            </form>
                <li class="memberBox10">
                    <label for=""><a href="">이용약관</a></label><label for="" id="point"><a href="">개인정보처리방침</a></label><label for=""><a href="">책임의 한계와 법적고지</a></label><label for=""><a href="">회원정보 고객센터</a></label>
                </li>
            </ul>
        </div>
        
    </div>
</body>
</html>