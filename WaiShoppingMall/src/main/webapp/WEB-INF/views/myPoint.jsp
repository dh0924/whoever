<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>WAI MAIN</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/mypagestyle.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/fontello/css/fontello.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_board.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_paging.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<div class="StyledLayout">
		<div id="Header">
			<jsp:include page="Header.jsp"></jsp:include>
		</div>
		<div class="Main">
			<div class="grid threeGrid">
				<div class="grid__item">
					<ul>
						<li class="fontello"><a href="myCart">&#xe800<br>
							<div style="font-size: 22px; font-family: 'Merriweather', serif;">MyCart</div></a>
						</li>
					</ul>
				</div>
				<div class="grid__item">
					<nav class="header__nav">
						<h3 style="text-align: left">My Point</h3>
						<hr>
					</nav>
					
					<article>
						<c:if test="${check == 0}">
							<div class="warning">
								<ul>
									<li class="fontello">&#xe815</li>
									<li style="font-size: 30px; margin: 0;">포인트 적립내역이 없습니다.<br>포인트를 적립해주세요</li>
								</ul>
							</div>
						</c:if>
						<c:if test="${check != 0}">
							<table class= "table" border="1" style="table-layout: auto; margin: auto; width: 80%; text-align: center;">
							<tr style="background-color: #d3d3d3">
								<th>적립금</th>
								<th>적립 내역</th>
								<th>적립 일자</th>
								
							</tr>
							<c:forEach var="imsi" items="${list1}">
							<tr>
								<td>${imsi.point}</td>
								<td>${imsi.contents}</td>
								<td>${imsi.time}</td>
							</tr>
							</c:forEach>
						</table>
							<div id="co"></div>
							
							<div class="all-paging2">
							<c:forEach var="i" begin="1" end="${totalnum2}" step="1">
								<li><a href="javascript:void(0);" onclick="location.href='myPoint?page=${i}'">${i }</a></li>
							</c:forEach>
							</div>
							
						</c:if>
					</article>
				</div>
				<div class="grid__item">
					<ul>
						<li class="fontello">
							<a href="myProfile">&#xf2be<br><div style="font-size: 22px; font-family: 'Merriweather', serif;">My Profile</div></a>
						</li>
					</ul>
				</div>
				<div class="grid__item">
					<li class="fontello">
						<a href="mypage"><div style="font-size: 22px; color: whitesmoke; font-family: 'Merriweather', serif;">what the hell am i doing?</div></a>
					</li>
				</div>
			</div>
		</div>

			<!-- <div id="Footer">
				<jsp:include page="Footer.jsp"></jsp:include>
			</div> 
		-->	
	</div>

	<script	src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
	
</body>
</html>