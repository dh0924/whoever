<%@page import="com.test.imsi.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<script>

var id;

function admincg(id) {
	
	var userid = id.id;
	var useradmin = id.name;
	
	var userData = { userid: userid, useradmin: useradmin };	
 	
	$.ajax ({
		data : JSON.stringify(userData),
		dataType : "json",
		type : "post",
		url : "admin",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(data.rs == 2) {
				alert("권한을 해제할 수 없습니다");
			} else if (data.rs == 0) {
				alert("관리자 권한이 해제되었습니다.");
				window.location.reload()
			} else if (data.rs == 1) {
				alert("관리자 권한이 부여되었습니다.");
				window.location.reload()
			}
		},
	
		   error : function(request,error,xhr1 , status)
	         {
	            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			
		}
		
	}); 
	
}


</script>
</head>
<body>
<div id="all-container">
<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>

<div id="all-content">
	<h1>회원 명단</h1>
	
		<form action="search_member">
		<table>
		<tr>
		<td>
		<input class="txtBox00" type="text" placeholder="ID입력" name="searchID" value="${searchID }">
		</td>
		<td>
		<input class="button" type="submit" value="검색">
		</td>
		</table>
		</form>

	
	
	<form name="up" method="get">
	<table class="table">
	
	<tr><th>이름</th> <th>아이디</th> <th>주소</th> <th>연락처</th> <th>이메일</th> <th>관리자 권한</th> <th>권한 변경</th></tr>

	

	
	<c:forEach var="imsi" items="${mlist}">	

	<tr>

	<td>${imsi.name}</td>
	<td>${imsi.id }</td>
	<td>${imsi.ad1 } ${imsi.ad2 } ${imsi.ad3 }</td>
	<c:if test="${imsi.hp1 ==null}">
		<td></td>
	</c:if>
	<c:if test="${imsi.hp1 !=null}">
		<td>${imsi.hp1}-${imsi.hp2}-${imsi.hp3}</td>
	</c:if>
	<td>${imsi.email}</td>
	<c:if test="${imsi.admin == 0 }">
		<td>x</td>
	</c:if>
	<c:if test="${imsi.admin != 0 }">
		<td>o</td>
	</c:if>
	<c:if test="${imsi.pw == null}">
		<td><input class="button" type="button" value="탈퇴한 회원" id="${imsi.id }" name="${imsi.admin}"></td>
  	</c:if>
	<c:if test="${imsi.admin == 2}">
		<td><input class="button" type="button" value="최고관리자" id="${imsi.id }" name="${imsi.admin}"></td>
  	</c:if>
  	<c:if test="${imsi.admin != 2 && loginid != imsi.id &&imsi.pw != null}">
		<td><input class="button" type="button" value="권한부여" id="${imsi.id }" name="${imsi.admin}" onclick="admincg(${imsi.id})"></td>
  	</c:if>
    </tr>	
	</c:forEach>
	</table>
	</form>

<div class="all-paging2">
	<c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
  		<li>
  			<a href="javascript:void(0);" onclick="location.href='memberAllData?page=${i }&searchID=${searchID }'">${i }</a>
  		</li>
	</c:forEach>
	</div>
	</div>
</div>

</body>
</html>