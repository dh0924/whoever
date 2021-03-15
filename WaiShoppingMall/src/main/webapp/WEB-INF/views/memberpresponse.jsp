<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery-1.4.4.min.js"></script>
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
</head>
<script>
	function check(orderno)
	{
		location.href = "orderupdate?orderno="+orderno;
	}
</script>

<body>
  <div id="all-container">
     <div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>
<div id="all-content">
<h1>회원 구매 요청 확인</h1>
<br>
<form action="gomemberpresponse">
<table style="margin-left: 100px;;">
<tr>
<td><input class="txtBox00" type="text" placeholder="ID입력" name="searchID" value="${searchID }"></td>
<td><input class="button" type="submit" value="검색"></td>
</tr>
</table>
</form>
<br>
            <table border="1" class="table" style="table-layout: auto; margin: auto; width: 80%; text-align: center;">
               <tr style="background-color: #d3d3d3">
                  <th>번호</th>
                  <th>이름(ID)</th>
                  <th>상품명</th>
                  <th>옵션/수량</th>
                  <th>배송지 주소</th>
               </tr>
               <c:forEach var="imsi" items="${list1 }" varStatus="status">
                  <tr>
                     <td>${imsi.orderno }</td>
                     <td>${imsi.id }</td>
                     <td>${imsi.productsubject }</td>
                     <td>${imsi.productsize }/${imsi.productcolor }/${imsi.productamount }</td>
                     <td>${list2[status.index].ad1 } / ${list2[status.index].ad2 } / ${list2[status.index].ad3 }</td>
                  </tr>
        		</c:forEach>
            </table>
		<div id="all-paging">
			<c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
				<li><a href="gomemberpresponse?page=${i }">${i }</a></li>
			</c:forEach>
		</div>
		</div>
 </div>
</body>
</html>