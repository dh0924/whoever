<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
</head>
<body>
	<div class="grid threeGrid">
		<div class="grid__item">
			<ul>
				<li class="fontello">
					<a href="myCart">&#xe800<br><div style="font-size: 22px; font-family: 'Merriweather', serif;">MyCart</div></a>
				</li>
			</ul>
		</div>
		<div class="grid__item">
			<nav>
				<h3 style="text-align: left">Order List</h3>
				<p style="text-align: right;">
					<a href="myOrder">show all ></a>
				</p>
				<hr>
			</nav>
			<article class="grid__article">
				<div style="overflow-y: auto; overflow-x: hidden; width: 100%; height: 700px;">
					<table class="table" border="1"
						style="table-layout: auto; margin: auto; width: 80%; text-align: center;">
						<tr style="background-color: #d3d3d3">
							<th>이미지</th>
							<th>상품 정보</th>
							<th>주문일자</th>
							<th>주문 금액(수량)</th>
							<th>주문 상태</th>
							<th>비고</th>
						</tr>
						<c:forEach var="imsi" items="${list1 }">
							<tr>
								<td><img
									src="<spring:url value='/E:/upload/test/${imsi.stored_fname }'/>"
									width="150" height="150" /></td>
								<td>${imsi.productsubject }<br>${imsi.productsize }
									SIZE<br>${imsi.productcolor } COLOR
								</td>
								<td>${imsi.orderdate }</td>
								<td>${imsi.productprice }원(${imsi.productamount }개)</td>
								<td>${imsi.orderstate }</td>
								<c:if test="${imsi.orderstate == '배송 준비 중'}">
									<td><input class="button" type="button" value="주문 취소"
										onclick="orderdele('${imsi.orderno}');"></td>
								</c:if>
								<c:if test="${imsi.orderstate == '배송 완료'}">
									<td><input class="button" type="button" value="후기 작성"
										onclick="location.href='goreviewinsert?r_sangpum=${imsi.productsubject}&r_size=${imsi.productsize}&r_color=${imsi.productcolor}&orderno=${imsi.orderno }'"></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
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
				<a href="mytestMain"><div style="font-size: 22px; color: whitesmoke; font-family: 'Merriweather', serif;"></div></a>
			</li>
		</div>
	</div>
</body>
</html>