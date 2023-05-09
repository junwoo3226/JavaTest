<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>공지사항</title>
	<link rel="icon" href="/resources/img/logo.png" type="image/x-icon">
	<link rel="stylesheet" href="/resources/css/badStyle.css">
	<link rel="stylesheet" href="/resources/css/header.css">
	<link rel="stylesheet" href="/resources/css/footer.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="../resources/js/board.js"></script>
</head>
<body>

	<div id="wrap">
	<!-- tnwjd -->
		<%@ include file="../header.jsp"%>


		<div id="container">
			<div id="containerIn">
				<h1 class="conTitle">공지사항</h1>
				<table class="board"> 
					<thead>
						<tr>
							<c:choose>
								<c:when test="${login!=null}">
									<th style="background-color:#fafafa;"><input id="allCheck" type="checkbox" name="allCheck"/></th>
								</c:when>
								<c:otherwise>								
									<th style="background-color:#fafafa;"><input id="notAllCheck" type="checkbox" name="notAllCheck" disabled/></th>
								</c:otherwise>
							</c:choose>
							
							
							<th class="mainNum">게시판 번호</th>
							<th class="mainTitle">제목</th>
							<th class="mainUser">작성자</th>
							<th class="mainDate">작성일</th>
							<th class="mainCheck">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="board">
							<tr>
								<c:choose>
									<c:when test="${login.id eq board.memberId}">
										<td class="checkbox"><input name="RowCheck" type="checkbox" value="${board.bno}"/></td>
									</c:when>
									<c:otherwise>
										<td class="checkbox"><input name="notRowCheck" type="checkbox" value="${board.bno}" disabled/></td>
									</c:otherwise>
								</c:choose>
								
								
								<td class="gong"><a href="/board/boardDetail?bno=${board.bno}">${board.bno}</a></td>
								<td class="title"><a href="/board/boardDetail?bno=${board.bno}">${board.title}</a></td>
								<td class="user">${board.writer}(${board.memberId})</td>
								<td class="date">${board.regdate}</td>
								<td class="check">${board.cnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<input class="chooseBtn none" type="button" value="선택삭제" onclick="deleteValue();">
				<c:if test="${login!=null}">
					<div id="boardWrite">
						<a href="/board/write">글쓰기</a>
					</div>
				</c:if>
				<form id="actionForm" action="/board/board" method="get">
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

					<div>
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

			</div>
			<!--#containerIn-->
		</div>
		<!--#container-->
		<%@ include file="../footer.jsp"%>
	</div> <!-- #wrap -->
</body>
</html>