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
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="../resources/js/summernote-lite.js"></script>
<script type="text/javascript" src="../resources/js/summernote-ko-KR.js"></script>
<script type="text/javascript" src="../resources/js/detail.js"></script>
<script type="text/javascript" src="../resources/js/write.js"></script>
<title>글수정</title>
<link rel="icon" href="resources/img/logo.png" type="resources/img/x-icon">
</head>
<body>
<!-- dd -->
	<div id="wrap">
		<%@ include file="../header.jsp" %>
		<div id="container">
        	<h2 class="notice">글수정</h2>
	        <div class="board">
	            <form action="/board/modify" method="post">
	                <div class="title">
	                    <label for="title">글 제목</label>
	                    <input type="hidden" name="bno" value="${detail.bno}">
	                    <div class="titleBox">
	                        <input type="text" name="title" id="title" value="${detail.title}">
	                    </div>
	                </div>
	                <div class="content">
	                    <label for="content">글 내용</label>
	                    <div class="contentBox">
	                        <textarea name="content" id="summernote">${detail.content}</textarea>
	                    </div>
	                </div>
	                <div class="bottom">
	                    <input type="submit" class="btn" id="btnList" value="완료">
	                </div>
	            </form>
	        </div> <!-- board end -->
    	</div>
		<%@ include file="../footer.jsp" %>
	</div>
</body>
</html>