<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_slide.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/theme_1/fontello/css/fontello.css" rel="stylesheet">
<script	src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>



</head>
<body>
	<div id="all-container">
		<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>
		<div id="all-content">
			<br>
			<h1>공지사항</h1><br>
			<table id="main_list" class="table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="imsi" items="${list1 }">
					<tr>
						<td>${imsi.noticeno }</td>
						<td><a href="noticeview?noticeno=${imsi.noticeno }">${imsi.noticesubject }</a></td>
						<td>${imsi.noticeid }</td>
						<td>${imsi.noticedate }</td>
					</tr>
				</c:forEach>
			</table>
		<c:if test="${sessionScope.user == 'admin'}">
			<table align="right">
			<tr>
				<td colspan = 6><input class="button" type="button" value="작성하기" onclick="location.href='gonoticeinsert'"></td>
			</tr>
		</table>
		</c:if>

	<div id="all-paging">
				<ul>
					<c:if test="${totalnum2 > 1 && p > 1}">
						<li class="fontello" style="font-family: fontello;"><a href="gonoticeboard?page=${p - 1}">&#xf191</a></li>
					</c:if>
					<c:forEach var="i" begin="1" end="${totalnum2}" step="1">
						<li><a href="gonoticeboard?page=${i}">${i}</a></li>
					</c:forEach>
					<c:if test="${totalnum2 > 1 && p < totalnum2}">
						<li class="fontello" style="font-family: fontello;"><a href="gonoticeboard?page=${p + 1}">&#xf152</a></li>
					</c:if>
					

				</ul>
			</div>
	</div>
	</div>
</body>
</html>