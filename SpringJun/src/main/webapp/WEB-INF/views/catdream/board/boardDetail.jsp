<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<link rel="stylesheet" type="text/css" href="../resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="../resources/css/header.css">
<link rel="stylesheet" type="text/css" href="../resources/css/boardDetail.css">
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../resources/js/uploadAjax2.js"></script>
<script type="text/javascript" src="../resources/js/detail.js"></script>
<link rel="icon" href="/resources/img/logo.png" type="resources/img/x-icon">
</head>
<body>
	<div id="wrap">
	<!-- sdd -->
		<%@ include file="../header.jsp" %>
		<div class="container">
		    <h2 class="notice">공지사항</h2>
		    <div class="board">
		        <div class="top">
		        	<div class="col-sm-12 mb-3 mb-sm-0" id="bno">${detail.bno}</div>
		            <h3 class="title">${detail.title}</h3>
		            <span class="writer">${detail.writer}(${detail.memberId})</span>
		        </div>
		        <div class="center">
		            <p class="regdate">Posted at ${detail.regdate}</p>
		            <div class="content">${detail.content}</div>
           			<div id="attachBox">
					    <input class="btn btnAtch" value="첨부파일" onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '숨기기';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '더보기';}" type="button" />
					    <div style="display: none;" id="uploadResult">
							<ul id="testBox"></ul>
						</div>
		        	</div>
		        </div>
		        <div class="reply">
		        	<c:forEach items="${reply}" var="content">
		        		<div class="replyBoxing">
	                  		<div class="replyBox">
	                  			<div class="hbgBtn">
	                  				<div class="line"></div>
	                  				<div class="line"></div>
	                  				<div class="line"></div>
	                  				<c:set var="memberId" value="${content.memberId}"/>
	                  				<c:if test="${login.id eq memberId}">
	                  					<div class="replyMenu">
	                  						<ul>
	                  							<li><input type="button" class="replyMode" value="수정"></li>
	                  							<li><input type="button" class="replyDelete" value="삭제"></li>
	                  						</ul>
                  						</div>
	                  				</c:if>
	                  				<c:if test="${login.id ne memberId}">
	               						<div class="replyMenu">
		                  					<ul>
		                  						<li><a href="#">신고</a></li>
		                  					</ul>
	                  					</div>
                  					</c:if>
	                  			</div>
	                  			<div class="replyWriter">${content.replyer}<span class="replyDate">${content.replydate}</span></div>
	                  			<div class="replyContainer">${content.reply}</div>
							</div> <!-- replyBox -->
							<div class="modeComment">
			        			<form action="/reply/modify/${detail.bno}" method="post">
		                  			<div class="replyWriter">${login.name}</div>
		                  			<input type="hidden" name="bno" value="${detail.bno}">
		                  			<input type="hidden" name="rno" class="rno" value="${content.rno}">
		                  			<div>
		                      			<textarea class="replyContent" id="modeRcoment" name="reply" rows="3" cols="100" placeholder="댓글을 입력해주세요">${content.reply}</textarea>
		                      		</div>
		                      		<input type="button" class="replySubmit reModify" value="댓글 수정">
		                      		<input type="button" class="replySubmit cancel" value="취소">
			        			</form>
		      		 		</div>
						</div>
                	</c:forEach>
		        </div>
		        <!-- 새로운 댓글 작성 -->
		        <div id="writeComent">
		        	<form action="/reply/new" method="post">
                  			<div class="replyWriter">${login.name}</div>
                  			<input type="hidden" name="replyer" value="${login.name}">
                  			<input type="hidden" name="bno" value="${detail.bno}">
           			        <input type="hidden" name="memberId" value="${login.id}">
                  			<div>
                      			<textarea class="replyContent" name="reply" rows="3" cols="100" placeholder="댓글을 입력해주세요" id="replyWrite"></textarea>
                      		</div>
                      		<c:choose>
	                      		<c:when test="${login!=null}">
		                      		<input type="button" class="replySubmit" value="댓글 작성" class="btn btn-primary btn-icon-split" id="rewrite">
	                 			</c:when>
	                 			<c:otherwise>
		                      		<input type="button" class="replySubmit" value="댓글 작성" class="btn btn-primary btn-icon-split" id="rewrite2">
	                 			</c:otherwise>
                      		</c:choose>
		        	</form>
		        </div>
		        <div class="bottom">
		            <a href="/board/board" class="btn" id="btnList">목록보기</a>
		            <c:set var="memberId" value="${detail.memberId}"/>
		            <c:if test="${login.id eq memberId}">
			            <a href="/board/modify?bno=${detail.bno}" class="btn" id="btnWrite">글 수정</a>
			            <a href="/board/remove?bno=${detail.bno}" class="btn" id="btnDelete">글 삭제</a>
		            </c:if>
		        </div>
		    </div>
		</div> <!-- wrap 끝 -->
		<%@ include file="../footer.jsp" %>
	</div>
</body>
</html>