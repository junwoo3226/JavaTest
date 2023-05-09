<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/header.css">
<link rel="stylesheet" type="text/css" href="resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="resources/css/subStyle.css">
<link rel="icon" href="resources/img/logo.png" type="image/x-icon">
<meta charset="UTF-8">
<title>기능별사료</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../resources/js/brands.js"></script>
</head>
<body>
<div id="wrap">
<%@ include file="header.jsp" %>
 <div id="container">
            <div class="row1">
                <h2>브랜드별사료</h2>

                <div class="mainGnb">
                    <ul>
                        <li class="on"><a href="#">전체상품</a></li>
                        <li><a href="#">오리젠</a></li>
                        <li><a href="#">아카나</a></li>
                        <li><a href="#">로얄 캐닌</a></li>
                        <li><a href="#">뉴트로</a></li>
                        <li><a href="#">내추럴발란스</a></li>
                        <li><a href="#">힐스</a></li>
                        <li><a href="#">now</a></li>
                        <li><a href="#">지위픽</a></li>
                        <li><a href="#">네이처스 버라이어티</a></li>
                        <li><a href="#">퓨리나 팬시피스트</a></li>
                        <li><a href="#">로우즈</a></li>
                        <li><a href="#">알모네이쳐</a></li>
                    </ul>
                </div> <!--.mainGnb-->
                
                <div class="mainGnbList">
                    <ul>
                        <li><a href="/catdream">HOME</a></li>
                        <li class="point"><a href="#">기능별사료</a></li>
                    </ul>
                </div> <!--.mainGnbList-->
            </div> <!--.row1-->

            <div class="row2">
                <div class="mainUtil">
                    <ul>
                        <li class="point"><a href="#">전체상품</a></li>
                        <li><a href="#">인기순</a></li>
                        <li><a href="#">최신순</a></li>
                        <li><a href="#">낮은가격</a></li>
                        <li><a href="#">높은가격</a></li>
                        <li><a href="#">상품명</a></li>
                        <li><a href="#">브랜드</a></li>
                    </ul>
                </div> <!--.mainUtil-->
    
                <div class="main">
                    <ul>
						<c:forEach items="${list}" var="product">
	                        <li>
	                            <a href="/product/detail?pno=${product.pno}">
	                                <p class="itemImg"><img class="imgs" data-id="${product.pno}" src='/product/display?pimgname=${product.puploadpath}/${product.puuid}_${product.pimgname}'></p>
	                                <p class="itemName">${product.pname}</p>
	                                <p class="itemPrice">${product.pprice}</p>
	                            </a>
	                        </li>
						</c:forEach>
                    </ul>
                </div> <!--.main-->
                
				<form id="actionForm" action="/subcatdream" method="get">
					<div class="search">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<select class="selectBox" name="search">
							<option value="T" <c:out value="${pageMaker.cri.search eq 'T'?'selected' : ''}"/>>제목</option>
							<option value="C" <c:out value="${pageMaker.cri.search eq 'C'?'selected' : ''}"/>>내용</option>
							<option value="W" <c:out value="${pageMaker.cri.search eq 'W'?'selected' : ''}"/>>작성자</option>
							<option value="TC" <c:out value="${pageMaker.cri.search eq 'TC'?'selected' : ''}"/>>제목 + 내용</option>
							<option value="TCW" <c:out value="${pageMaker.cri.search eq 'TCW'?'selected' : ''}"/>>제목 + 내용 + 작성자</option>
						</select>
						<input class="textBox" type="text" name="keyword" value="${pageMaker.cri.keyword}">
						<input class="AS" type="submit" value="검색">


					</div>

					<div class="mainPager">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<!-- jsp문법 ja문법을 html처럼 사용 -->
								<li class="paginate_button"><a href="${pageMaker.startPage-1}"
									aria-controls="dataTable" data-dt-idx="0" tabindex="0">이전</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="paginate_button"><a href="${num}">${num}</a></li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="paginate_button" id="dataTable_next">
									<a href="${pageMaker.endPage+1}" aria-controls="dataTable"
									data-dt-idx="7" tabindex="0" class="page-link">다음</a>
								</li>
							</c:if>
						</ul>
					</div> 


				</form>
                
<!--
                <div class="mainPager">
                    <ul>
                        <li class="on"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                        <li><a href="#">8</a></li>
                        <li><a href="#">9</a></li>
                        <li><a href="#">10</a></li>
                    </ul>
                </div> .mainPager-->
                
            </div> <!--.row2-->

        </div> <!--#container-->
<%@ include file="footer.jsp" %>
</div>
</body>
</html>