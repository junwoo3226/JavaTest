<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="../resources/css/header.css">
<link rel="stylesheet" type="text/css" href="../resources/css/write.css">
<link rel="stylesheet" type="text/css" href="../resources/css/summernote-lite.css">
<link rel="icon" href="/resources/img/logo.png" type="resources/img/x-icon">
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../resources/js/summernote-lite.js"></script>
<script type="text/javascript" src="../resources/js/summernote-ko-KR.js"></script>
<script type="text/javascript" src="../resources/js/uploadAjax2.js"></script>
<script type="text/javascript" src="../resources/js/write.js"></script>
<title>글쓰기</title>
</head>
<body>
	<div id="wrap">
		<%@ include file="../header.jsp" %>
		<div id="container">
        	<h2 class="notice">공지사항 글쓰기</h2> 
        	<div class="term"><hr></div>
        	
	        <div class="board">
	            <form role="form" action="/board/write" method="post" id="writeForm">
	            	<input type="hidden" name="writer" value="${login.name}">
	            	<input type="hidden" name="memberId" value="${login.id}">
	                <div class="title">
	                    <label for="title">글 제목</label>
	                    <div class="titleBox">
	                        <input type="text" name="title" id="title">
	                    </div>
	                </div>
	                <div class="content">
	                    <label for="content">글 내용</label>
	                    <div class="contentBox">
	                        <textarea name="content" id="summernote"></textarea>
	                    </div>
	                </div>
	                <div>
						<input type="file" name="uploadFile" multiple>
					</div>
					<div id="uploadResult">
						<ul></ul>
					</div>
	                <div class="bottom">
	                    <input type="button" class="btn" id="btnList" value="완료">
	                </div>
	            </form>
	        </div>
    	</div>
		<%@ include file="../footer.jsp" %>
	</div>
</body>
</html>