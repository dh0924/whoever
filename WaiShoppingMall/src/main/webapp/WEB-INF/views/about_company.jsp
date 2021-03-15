<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사 소개</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script src="${pageContext.request.contextPath }/resources/theme_1/js/wai_map.js"></script>
</head>
<body>
<div id="all-container">
<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>
<jsp:include page="sidebar.jsp"></jsp:include>
<div id="all-content">
<!-- <h1>회사 소개</h1>
<br>
<table align="center">
<tr>
<th><img src="https://iconmonstr.com/wp-content/g/gd/makefg.php?i=../assets/preview/2012/png/iconmonstr-help-1.png&r=255&g=5&b=5" width="70" height="70">
<td>
WAI(와이)<br>
옷은 자신을 나타내는 방법 중 하나입니다.<br>
많은 사람들이 저희 쇼핑몰을 이용하면서 나 자신을 찾게 되었으면 좋겠다는 의미로<br>
Who Am I?(나는 누구인가?)의 첫 글자를 땄습니다.
</tr>
0</table>
<br>
<hr>-->
<br>
<h3>회사 위치</h3>
<br>
<table border="1" style="padding:10px;">
<tr>
<td><div id="googleMap" style="width:1050px;height:500px;"></div></td>
</tr>
</table>
<table>
<tr>
<td><input type="button" class="button-map" disabled value="주소">인천광역시 동구 샛골로 500<input type="button" class="button-map" disabled value="오시는 길">택시타고 한번에</td>
</tr>
</table>
<!-- <tr>
<td><input type="button" class="button-map" disabled value="주소">서울특별시 종로구 돈화문로 26, 4층<input type="button" class="button-map" disabled value="오시는 길">3호선 종로3가역 [9번 출구]/1호선 종로3가역 [10번 출구] 단성사 빌딩 4층</td>
</tr>
</table> -->
</div>
</div>

</body>
</html>