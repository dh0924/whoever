<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAI MAIN</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_slide.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_item.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<style>
h4 {
	text-align: center;
}
		
.item {
	margin-right: 81px;
}
</style>
</head>
<script>
	$(document).ready(function()
	{
		if('${viewmethod}' == 'productdate')
		{
			$("#viewmethod").val('최신순').attr("selected", "selected");
		}
		else if('${viewmethod}' == 'productpriceup')
		{
			$("#viewmethod").val('가격 높은순').attr("selected", "selected");
		}
		else if('${viewmethod}' == 'productpricedown')
		{
			$("#viewmethod").val('가격 낮은순').attr("selected", "selected");
		}
	}); 



	function select()
	{
	   var selectitem = $("#viewmethod").val();
	   
	   if(selectitem == "최신순")
	   {
		   location.href='shoes?viewmethod=productdate';
	   }
	   else if(selectitem == "가격 높은순")
	   {
		   location.href='shoes?viewmethod=productpriceup'
	   }
	   else if(selectitem == "가격 낮은순")
	   {
		   location.href='shoes?viewmethod=productpricedown'
	   }	   
	}
	
	
	
</script>
<body>
<div id="all-container">

	<div id="user-header">
		<jsp:include page="../loginout.jsp"></jsp:include>
	</div>
	<div id="user-sidebar">
		<jsp:include page="../sidebar.jsp"></jsp:include>
	</div>

<div id="all-content">
	<h4>신발</h4><hr>
	<table>
	<tr>
	<td>
	<select name="viewmethod" id="viewmethod" onchange="select()">
		<option value="최신순">최신순</option>
		<option value="가격 높은순">가격 높은순</option>
		<option value="가격 낮은순">가격 낮은순</option>
	</select>
	</td>
	</tr>
	</table>
	
	<c:forEach var="imsi" items="${mlist }">
		<div class = "item">
			<c:if test="${imsi.original_fname != 'noFile'}">
				<a href="goproductdetail?productcode=${imsi.productcode }"> <img src="<spring:url value='/C:/upload/test/${imsi.stored_fname }'/>" width="250" height="250" /> </a>
			</c:if>
			<c:if test="${imsi.original_fname == 'noFile'}">
				이미지
			</c:if>
			<h3><a href="goproductdetail?productcode=${imsi.productcode }">${imsi.productsubject }</a></h3>
			<p>${imsi.productprice }    원</p>
		</div>
	</c:forEach>

</div>

			<div class="all-paging2">
		<c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
           <li>
           	<c:if test="${viewmethod == null}">
              <a href="javascript:void(0);" onclick="location.href='shoes?page=${i }'">${i }</a>
            </c:if>
            <c:if test="${viewmethod == 'productdate'}">
              <a href="javascript:void(0);" onclick="location.href='shoes?viewmethod=productdate&page=${i }'">${i }</a>
            </c:if>
            <c:if test="${viewmethod == 'productpriceup'}">
              <a href="javascript:void(0);" onclick="location.href='shoes?viewmethod=productpriceup&page=${i }'">${i }</a>
            </c:if>
            <c:if test="${viewmethod == 'productpricedown'}">
              <a href="javascript:void(0);" onclick="location.href='shoes?viewmethod=productpricedown&page=${i }'">${i }</a>
            </c:if>
           </li>
		</c:forEach>
		</div>
			
</div>
</body>
</html>