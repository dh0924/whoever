<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAI MAIN</title>
	<style>
		.container{
			display: flex;
			flex-direction: column;
		}
		header{
			background-color: lightgray;
			border_bottom: 1px solid gray;
			display: flex;
			flex-direction: row;
			flex-basis: 150px;
		}
		nav{
			border_bottom: 1px solid black;
		}
		.content{
			flex-direction: column;
		}
		.item{
			background-color: tomato;
			border: 1px solid white;
			flex-grow: 1;
			text-align: center;
		}
		.item:nth-child(3){
			padding-top:50px;
		}
	</style>
</head>
<script>
function cartdel(cartno)
{
	var con = confirm("정말로 삭제하시겠습니까?");
	
	if(con==true)
	{
		location.href="cartdelete?cartno="+cartno;
		alert("삭제되었습니다");
	}
}
</script>

<body>
	<div class="container">
		<header>
				<div class="item">
					<li><a href="gohome">메인</a></li>
					<br>
					<li><a href="#">Gold<br>홍길동님
					</a></li>
					<br>
					<li><a href="logout">로그아웃</a>|<a href="#">내 정보 보기</a></li>
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
		</header>
		<section class="content">
			<nav>
				<h3 style="text-align: left; font-size: 40px">My Cart</h3>
				<p style="text-align: right;">
					<a href="#">전체 보기 ></a>
				</p>
				<hr>
			</nav>
			<main> 
				<table border="1" style="table-layout: auto; margin: auto; width: 80%; text-align: center;">
					<tr style="background-color: #d3d3d3">
						<th>img</th>
						<th>cartno</th>
						<th>id</th>
						<th>productcode</th>
						<th>수량</th>
					</tr>
				<c:forEach var="imsi" items="${list1 }">
					<tr>
						<td><img src="<spring:url value='/E:/upload/test/${imsi.stored_fname }'/>" width="150" height="150" /></td>
						<td>${imsi.cartno}</td>
						<td>${imsi.id}</td>
						<td>${imsi.productcode}</td>
						<td>${imsi.productamount}</td>
						<td>
							<input class="button-mini" type="button" value="삭제"
							onclick="cartdel('${imsi.cartno }');">
						</td>
					</tr>
				</c:forEach>
			</table>
			</main>
		</section>
	</div>

	<script	src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
	<script	src="${pageContext.request.contextPath }/resources/theme_1/js/wai_jquery.js"></script>
	
</body>
</html>