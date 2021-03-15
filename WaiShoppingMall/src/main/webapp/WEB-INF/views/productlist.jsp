<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 상품 목록 보기</title>
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">

</head>
<script>
	function productdel(procode)
	{
		var con = confirm("정말로 삭제하시겠습니까?");
		
		if(con==true)
		{
			location.href="productdelete?productcode="+procode;
			alert("삭제되었습니다");
		}
	}
</script>
<body>
<div id="all-container">
<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>


<div id="all-content">
<h1>상품 목록</h1>
<form action="goproductlistpage">
<table>
<tr>
<td><input class="txtBox00" type="text" placeholder="상품명 입력" name="searchProduct" value="${searchProduct }"></td>
<td><input class="button" type="submit" value="검색"></td>
</tr>
</table>
</form>
		<table class="table">
			<tr>
				<th>번호</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>판매가</th>
				<th>옵션(기타)</th>
				<th>재고</th>
				<th>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;</th>
			</tr>
			<c:forEach var="imsi" items="${list1 }">
				<tr>
					<td>${imsi.productcode }</td>
					<c:if test="${imsi.original_fname != 'noFile'}">
						<td><img src="<spring:url value='/C:/upload/test/${imsi.stored_fname }'/>" width="150" height="150" /></td>
					</c:if>
					<c:if test="${imsi.original_fname == 'noFile'}">
						<td>이미지</td>
					</c:if>
					<td><a href="goproductdetail?productcode=${imsi.productcode }">${imsi.productsubject }</a></td>
					<td>${imsi.productprice }    원</td>
					<td>${imsi.productcolor } , ${imsi.productsize }</td>
					<td>${imsi.productstock }</td>
					<td><input class="button-mini" type="button" value="수정" onclick="location.href='goproductinsert?productcode=${imsi.productcode }'"><br><br><input class="button-mini" type="button" value="삭제" onclick="productdel('${imsi.productcode }');"></td>
				</tr>
			</c:forEach>
		</table>
		
		<div class="all-paging2">
		<c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
           <li>
              <a href="javascript:void(0);" onclick="location.href='goproductlistpage?page=${i }'">${i }</a>
           </li>
		</c:forEach>
		</div>
		</div>
		</div>
</body>
</html>