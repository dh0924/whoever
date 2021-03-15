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
	<div class="header threeGrid">
		<div class="header__column">
			<ul>
				<li class="fontello"><a href="gohome" style="font-size: 45px; text-align: left;">&#xe807</a></li>
				<li>
					<c:if test="${mloginvo.grade == 'bronze'}">
						<h4 style="color: #cc8e35">Bronze</h4>
					</c:if>
					<c:if test="${mloginvo.grade == 'silver'}">
						<h4 style="color: #bdc3c7">Silver</h4>
					</c:if>
					<c:if test="${mloginvo.grade == 'gold'}">
						<h4 style="color: #eccc68">Gold</h4>
					</c:if>
					</li>
				<li>${mloginvo.id}님</li>
				<li><a href="logout">logout</a></li>
			</ul>
		</div>
		<div class="header__column">
			<ul>
				<li class="fontello">&#xe812</li>
				<li><a href="myPoint">${loginvo.point} Point</a></li>
			</ul>
		</div>
		<div class="header__column">
			<ul>
				<li class="fontello">&#xe816</li>
				<li><a href="myOrder">Order details</a></li>
			</ul>
		</div>
		<div class="header__column">
			<ul>
				<li class="fontello">&#xe802</li>
				<li><a href="myreview">My reviews</a></li>
			</ul>
		</div>
		<div class="header__column">
			<ul>
				<li class="fontello">&#xe804</li>
				<li><a href="myQnA">My Q&A</a></li>
			</ul>
		</div>
	</div>
</body>
</html>