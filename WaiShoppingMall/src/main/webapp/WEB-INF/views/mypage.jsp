<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>WAI MAIN</title>
	
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/mypagestyle.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/fontello/css/fontello.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_board.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<div class="StyledLayout">
		<div class="Header">
			<jsp:include page="Header.jsp"></jsp:include>
		</div>
		<div class="Main">
			<jsp:include page="Main.jsp"></jsp:include>
		</div>
		
		<!-- <div id="Footer">
				<jsp:include page="Footer.jsp"></jsp:include>
			</div> 
		-->
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>