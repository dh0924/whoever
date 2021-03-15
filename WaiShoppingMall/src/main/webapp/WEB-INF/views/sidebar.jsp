<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">

<style>
@font-face {
     font-family: 'BRBA_B';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/BRBA_B.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

.title a {
	font-family: 'BRBA_B';
}

.title a:hover {
	color:#ff81a1 !important;
}
</style>

</head>
<body>

<c:if test="${loginid == null || admin == 0 }">
<div id="user-sidebar">
<br>
<br>
<div class=title><h1 style="font-size:50px;text-align:center;cursor:pointer;text-decoration:none;" ><a href="gohome">아무나</a></h1></div>
<ul>
<li class="menu" style="cursor:pointer;"><a>MAN</a>
<ul>
<li><a href="M_Top">상의</a></li>
<li><a href="M_Bottom">하의</a></li>
<li><a href="bag">가방</a></li>
<li><a href="shoes">신발</a></li>
<li><a href="Accessories">액세서리</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>WOMAN</a>
<ul>
<li><a href="W_Top">상의</a></li>
<li><a href="W_Bottom">하의</a></li>
<li><a href="bag">가방</a></li>
<li><a href="shoes">신발</a></li>
<li><a href="Accessories">액세서리</a></li>
</ul>
</li>
</ul>
<hr>

<!-- <div id="all-search"> -->
<form action="search_product">
<table>
<tr>
<td><input class="txtBox00" style="width:150px;" type="text" placeholder="상품명 입력" name="searchProduct" value="${search }"></td>
<td><input class="button-mini2" type="submit" value="검색"></td>
</tr>
</table>
</form>
<!-- </div> -->
<br>
(주)아무나<br><br>
010-9852-3813<br><br>
AAAA@email.com<br><br>
<a href="goaboutcompany">회사 소개</a><br>
<table style="height:1000px;width:0px;"><tr><td></td></tr></table>
</div>
</c:if>

<c:if test="${admin == 1 }">
<div id="user-sidebar">
<h1 style="font-size:50px;text-align:center;cursor:pointer;text-decoration:none"><a href="gohome">WAI</a></h1>

<ul>
<li class="menu" style="cursor:pointer;"><a>상품 관리</a>
<ul>
<li><a href="goproductlistpage?page=1">상품 목록</a></li>
<li><a href="goproductinsert">상품 등록</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>회원 관리</a>
<ul>
<li><a href="memberAllData">회원 목록</a></li>
<li><a href="gomemberprequest?page=1">회원 구매 요청</a></li>
<li><a href="gomemberpresponse?page=1">회원 구매 확인</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>게시글 관리</a>
<ul>
<li><a href="goqnaboard1?user=admin&page=1">회원 Q&A목록</a></li>
<li><a href="goreviewboard1?user=admin">회원 Review목록</a></li>
<li><a href="gonoticeboard?user=admin&page=1">공지사항</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>MAN</a>
<ul>
<li><a href="M_Top">상의</a></li>
<li><a href="M_Bottom">하의</a></li>
<li><a href="bag">가방</a></li>
<li><a href="shoes">신발</a></li>
<li><a href="Accessories">액세서리</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>WOMAN</a>
<ul>
<li><a href="W_Top">상의</a></li>
<li><a href="W_Bottom">하의</a></li>
<li><a href="bag">가방</a></li>
<li><a href="shoes">신발</a></li>
<li><a href="Accessories">액세서리</a></li>
</ul>
</li>
</ul>
<hr>
<form action="search_product">
<table>
<tr>
<td><input class="txtBox00" style="width:150px;" type="text" placeholder="상품명 입력" name="searchProduct" value="${search }"></td>
<td><input class="button-mini2" type="submit" value="검색"></td>
</tr>
</table>
</form>
<!-- </div> -->
<br>
(주)AAAA<br><br>
010-9852-3813<br><br>
AAAA@email.com<br><br>
<a href="goaboutcompany">회사 소개</a><br>
<table style="height:1000px;width:0px;"><tr><td></td></tr></table>
</div>
</c:if>

</body>
</html>