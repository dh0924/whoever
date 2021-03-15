<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="item">
		<li><a href="gohome">main</a></li>
		<br>
		<li><a href="#">Gold<br>${sessionScope.loginid}님
		</a></li>
		<br>
		<li><a href="logout">logout</a>|<a href="#">my info</a></li>
	</div>
	<div class="item">
		<img src="https://image.flaticon.com/icons/svg/138/138281.svg" width="60px" height="70px">
		<br>
		<a href="myPoint">적립금</a>
	</div>
	<div class="item">
		<a href="myOrder">주문 내역 조회</a>
	</div>
	<div class="item">
		<a href="myreview">내가 등록한 상품 후기</a>
	</div>
	<div class="item">
		<a href="myQnA">내가 등록한 Q&A</a>
	</div>
</body>
</html>