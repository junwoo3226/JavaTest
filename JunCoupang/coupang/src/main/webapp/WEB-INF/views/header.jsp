<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header id="header">
        <div id="headerIn">
            <h1 class="logo">
                <a href=""></a>
            </h1>
            <nav class="hGnb">
                <ul>
                    <li><a href="">로켓배송</a></li>
                    <li><a href="">로켓프레시</a></li>
                    <li><a href="">쿠팡비즈</a></li>
                    <li><a href="">로켓직구</a></li>
                    <li><a href="">골드박스</a></li>
                    <li><a href="">와우회원할인</a></li>
                    <li><a href="">이벤트/쿠폰</a></li>
                    <li><a href="">기획전</a></li>
                    <li><a href="">여행/티켓</a></li>
                </ul>
            </nav> <!--.pc_gnb-->
            <div class="hUtil">
                <ul>
					<c:choose>                 	
						<c:when test="${login == null}">
							<li><a href="/member">회원가입</a></li>
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