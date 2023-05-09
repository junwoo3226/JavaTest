<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/member.css">
    <title>회원가입</title>
</head>
<body>
    <div id="memberWrap">
        <div class="memberIn">
            <h2 class="memberTitle">회원가입</h2>
            <ul>
                <li class="memberBox1">
                    <h3>
                        <label for="">아이디</label>
                    </h3>
                    <input type="text" class="inputText1" id="userId">
                </li>
                <li class="memberBox2">
                    <h3>
                        <label for="" >비밀번호</label>
                    </h3>
                    <input type="password" class="inputText1" id="userPw">
                </li>
                <li class="memberBox3">
                    <h3>
                        <label for="">비밀번호 재확인</label>
                    </h3>
                    <input type="password" class="inputText1" id="userPwCheck">
                </li>
                <li class="memberBox4">
                    <h3>
                        <label for="">생년월일</label>
                    </h3>
                    <input type="text" class="inputText2" id="" placeholder="년(4자)">
                    <select name="" class="inputText3" id="" >
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
                    <input type="text"  class="inputText2" id=""  placeholder="일">
                </li>
                <li class="memberBox5">
                    <h3>
                        <label for="">성별</label>
                    </h3>
                    <select name="" class="inputText1" id="">
                        <option value="none" selected>성별</option>
                        <option value="M">남자</option>
                        <option value="F">여자</option>
                        <option value="U">선택 안함</option>
                    </select>
                </li>
                <li class="memberBox6">
                    <h3>
                        <label for="" placeholder="선택입력">본인 확인 이메일</label><span>(선택)</span>
                    </h3>
                    <input type="text" class="inputText1" id="">
                </li>
                <li class="memberBox7">
                    <h3>
                        <label for="">휴대전화</label>
                    </h3>
                    <select name="" class="inputText1" id="">
                        <option value="82" selected>대한민국 +82</option>
                        <option value="233">가나</option>
                        <option value="30">그리스</option>
                        <option value="224">기니</option>
                    </select>
                    <div class="number">
                        <input type="text" class="inputText4" id="" placeholder="전화번호 입력">
                        <a href="">
                            <div class="numberButton">인증번호 받기</div>
                        </a>
                    </div>
                    <input type="text" class="inputText1" id="" placeholder="인증번호 입력하세요">
                </li>
                <li class="memberBox8">
                    <a href=""><div class="memberButton">가입하기</div></a>
                </li>
                <li class="memberBox9">
                    <a href=""><label for="">이용약관</label></a>
                    <a href=""><label for="">개인정보처리방침</label></a>
                    <a href=""><label for="">책임의 한계와 법적고지</label></a>
                    <a href=""><label for="">회원정보 고객센터</label></a>
                </li>
            </ul>
        </div>
        
    </div>
</body>
</html>