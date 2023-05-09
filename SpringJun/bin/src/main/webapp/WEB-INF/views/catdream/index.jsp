<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>캣드림</title>
    <link rel="icon" href="resources/img/logo.png" type="image/x-icon">
    <link rel="stylesheet" href="resources/css/header.css">
    <link rel="stylesheet" href="resources/css/footer.css">
    <link rel="stylesheet" href="resources/css/containerStyle.css">
</head>
<body>
    <div id="wrap">
	<%@ include file="header.jsp" %>
        <div id="container">
            <div class="containerIn">
                <!-- .main1 -->
                <section class="main1">
                    <div class="main1Slide"><a href="#"><img src="resources/img/mainSlide01.jpg" alt="이벤트정보"></a></div>
                    <div class="main1Pager">
                        <ul>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                        </ul>
                    </div>
                </section>
                <!-- .main2 -->
                <section class="main2">
                    <div class="main2P">
                        <p class="lp"></p>
                        <p class="rp"></p>
                    </div>
                    <div class="main2Navi">
                        <ul>
                            <li class="on"><a href="#">최신</a></li>
                            <li><a href="#">베스트</a></li>
                            <li><a href="#">할인</a></li>
                            <li><a href="#">추천</a></li>
                            <!-- <li><a href="#">new</a></li>
                            <li><a href="#">best</a></li>
                            <li><a href="#">discount</a></li>
                            <li><a href="#">recommendation</a></li> -->
                            <!-- 새로운 배스트 할인 추천 -->
                        </ul>
                    </div>
                    <!-- 각 매뉴에맞는 상품으로 4가지씩 다따로 작성해야한다 -->
                    <div class="main2Box1">
                        <ul>
                            <!-- 4개정도씩 보여주기 -->
                            <li><a href="#">
                                <p class="main2Box1Poto"><img src="resources/img/ma1.jpg" alt=""><span class="main2BoxNew">NEW</span></p>
                                <p class="main2Box1Title">맛있는 사료</p>
                                <p class="main2Box1Price">1,000<span>원</span></p>
                            </a></li>
                            <li><a href="#">
                                <p class="main2Box1Poto"><img src="resources/img/ma1.jpg" alt=""><span class="main2BoxNew">NEW</span></p>
                                <p class="main2Box1Title">최근나온 사료</p>
                                <p class="main2Box1Price">2,500<span>원</span></p>
                            </a></li>
                            <li><a href="#">
                                <p class="main2Box1Poto"><img src="resources/img/ma1.jpg" alt=""><span class="main2BoxNew">NEW</span></p>
                                <p class="main2Box1Title">이런 사료</p>
                                <p class="main2Box1Price">1,500<span>원</span></p>
                            </a></li>
                            <li><a href="#">
                                <p class="main2Box1Poto"><img src="resources/img/ma1.jpg" alt=""><span class="main2BoxNew">NEW</span></p>
                                <p class="main2Box1Title">요런 사료</p>
                                <p class="main2Box1Price">1,500<span>원</span></p>
                            </a></li>
                        </ul>
                    </div>
                </section>
                <!-- .main3 -->
                <!-- 후기 -->
                <section class="main3">
                    <div class="main3Box">
                        <h2>구매 후기</h2>
                        <div class="main3List">
                            <ul>
                                <!-- 4개정도 아마 나중에 많이있어야할듯 총 16개-->
                                <li><a href="#">
                                    <p class="main3Title"><span><img src="resources/img/star_5.PNG" alt=""></span>2020-01-01</p>
                                    <p class="main3Contents"><span>배송이빠르네요</span><br>정말 빠르게왔어요</p>
                                    <p class="main3Info"><span>프로필</span>고객정보</p>
                                </a></li>
                                <li><a href="#">
                                    <p class="main3Title"><span><img src="resources/img/star_5.PNG" alt=""></span>날짜</p>
                                    <p class="main3Contents"><span>제목</span><br>내용</p>
                                    <p class="main3Info"><span>프로필</span>고객정보</p>
                                </a></li>
                                <li><a href="#">
                                    <p class="main3Title"><span><img src="resources/img/star_5.PNG" alt=""></span>날짜</p>
                                    <p class="main3Contents"><span>제목</span><br>내용</p>
                                    <p class="main3Info"><span>프로필</span>고객정보</p>
                                </a></li>
                                <li><a href="#">
                                    <p class="main3Title"><span><img src="resources/img/star_5.PNG" alt=""></span>날짜</p>
                                    <p class="main3Contents"><span>제목</span><br>내용</p>
                                    <p class="main3Info"><span>프로필</span>고객정보</p>
                                </a></li>
                            </ul>
                        </div>
                        <!-- .main3List -->
                        <!-- <p class="listPrev"><a href="#"><img src="./img/a_left.png" alt="이전으로"></a></p>
                        <p class="listNext"><a href="#"><img src="./img/a_right.png" alt="다음으로"></a></p> -->
                    </div>
                    <div class="main3Pager">
                        <ul>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                        </ul>
                    </div>
                    <p class="more">
                        <a href="#">더보기</a>
                    </p>
                </section>
                <!-- .main4 -->
                <!-- 배너 -->
                <section class="main4">
                    <div class="main4Box">
                        <a href="#"><img src="resources/img/slideGift01.jpg" alt="배너"></a>
                    </div>
                </section>
                <!-- .main5 -->
                <!-- 브랜드 -->
                <section class="main5">
                    <div class="main5Box">
                        <h2>브랜드</h2>
                        <ul>
                            <!-- 8개정도 -->
                            <li class="main5BoxLi1">
                                <a href="#">브랜드로고이미지1</a>
                            </li>
                            <li class="main5BoxLi2">
                                <a href="#">브랜드로고이미지2</a>
                            </li>
                            <li class="main5BoxLi3">
                                <a href="#">브랜드로고이미지3</a>
                            </li>
                            <li class="main5BoxLi4">
                                <a href="#">브랜드로고이미지4</a>
                            </li>
                            <li class="main5BoxLi5">
                                <a href="#">브랜드로고이미지5</a>
                            </li>
                            <li class="main5BoxLi6">
                                <a href="#">브랜드로고이미지6</a>
                            </li>
                            <li class="main5BoxLi7">
                                <a href="#">브랜드로고이미지7</a>
                            </li>
                            <li class="main5BoxLi8">
                                <a href="#">브랜드로고이미지8</a>
                            </li>
                        </ul>
                    </div>
                    <p class="more">
                        <a href="#">더보기</a>
                    </p>
                </section>
                <!-- .main5 -->
            </div>
            <!-- .containerIn -->
        </div> <!--#container-->
	<%@ include file="footer.jsp" %>
	</div>
</body>
</html>