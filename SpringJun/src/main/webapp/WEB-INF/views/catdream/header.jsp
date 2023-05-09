<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<!-- 위에주석 -->
        <header id="header">
            <div id="headerIn">
                <h1 class="logo">
                    <a href="/catdream">캣드림</a>
                </h1>
                <nav class="hGnb">
                    <ul>
                        <li><a href="/brands">브랜드별 사료</a></li>
                        <li class="feed2">
                            <a href="/subcatdream" >기능별 사료</a>

                            <!-- 
                            <div class="feed2Div">
                                <ul class="feed2Detail">
                                    <li class="on"><a href="#">전체상품</a></li>
                                    <li><a href="#">자묘용</a></li>
                                    <li><a href="#">성묘용</a></li>
                                    <li><a href="#">전연령</a></li>
                                    <li><a href="#">노묘용</a></li>
                                    <li><a href="#">헤어볼</a></li>
                                    <li><a href="#">저칼로리</a></li>
                                    <li><a href="#">기능성</a></li>
                                    <li><a href="#">피부,모질용</a></li>
                                    <li><a href="#">그레인프리/글루텐프리</a></li>
                                    <li><a href="#">유리너리사료</a></li>
                                    <li><a href="#">인도어(실내생활묘)</a></li>
                                    <li><a href="#">입맛까다로운 냥이용</a></li>
                                    <li><a href="#">하이포알러지 사료</a></li>
                                    <li><a href="#">자묘용(생후1년까지)</a></li>
                                    <li><a href="#">대용량(30.000원이상)</a></li>
                                    <li><a href="#">대용량(30.000원이하)</a></li>
                                    <li><a href="#">오븐에 구운 사료</a></li>
                                    <li><a href="#">에어드라이사료</a></li>
                                    <li><a href="#">동결건조사료</a></li>
                                    <li><a href="#">분유/우유</a></li>
                                </ul>
                            </div>
                             -->
                        </li>
                        <li><a href="">화장실</a></li>
                        <li><a href="">생활용품</a></li>
                        <li><a href="">장난감</a></li>

                        <li><a href="/board/board">공지사항</a></li>

                    </ul>
                </nav> <!--.pc_gnb-->
                <div class="hUtil">
                    <ul>
                    	<c:choose>                 	
	                    	<c:when test="${login == null}">
		                        <li class="point"><a href="/member">회원가입</a></li>
								<li><a href="/login">로그인</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/logout">로그아웃</a></li>
							</c:otherwise>
	                    </c:choose>
	                    <li><a href="">고객센터</a></li>
                    </ul>
                </div> <!--.pc_util-->
                <div class="hSearch">
                    <form action="" name="h_search_box">
                        <fieldset>
                            <legend>상품검색</legend>
                            <input type="text" name="hs_pd_name" id="hs_pd_name" class="hsText">
                            <input type="button" value="" name="hs_search_submit" id="hs_search_submit" class="hsBtn">
                        </fieldset>
                    </form>
                </div>
                <div class="hIcons">
                    <p class="btnUser">
                        <a href="">내 정보</a>
                    </p>
                    <p class="btnCart">
                        <a href="">장바구니</a>
                        <span class="count">0</span>
                    </p>
                </div> <!--.icons-->
            </div> <!--#headerIn-->
        </header> <!--#header-->
        
        
        <!-- 밑에 주석 git에 잘 올라가는지 확인 -->