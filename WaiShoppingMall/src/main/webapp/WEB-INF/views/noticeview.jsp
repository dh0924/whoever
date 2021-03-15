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
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_writepost.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<script	src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script	src="${pageContext.request.contextPath }/resources/theme_1/js/wai_jquery.js"></script>
</head>
<script>
	function noticeboarddel()
	{
		var con = confirm("정말로 삭제하시겠습니까?");
		
		if(con==true)
		{
			location.href="noticeboarddelete?noticeno=${nvo.noticeno}";
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
			<div id="all-writepost">
				<br>
				<h1>공지사항</h1><br>
				<form id="noticeview" action="gonoticeinsert">
					<input type="text" class="textborder1" name="noticesubject"	value="${nvo.noticesubject }" readonly><br><br><hr><br>
					<textarea class="textborder2" name="noticecontents"	style="font-size: 15px;" readonly>${nvo.noticecontents }</textarea>
					<input type="hidden" name="edit" value="1"> 
					<input type="hidden" name="noticeno" value="${nvo.noticeno }">
				</form>
				<table style="width: 750px;" align="center">
					<tr>
						<td align="left">
							<input class="button" type="button"	value="목록으로" onclick="location.href='gonoticeboard?page=1'">
						</td>
						<c:if test="${sessionScope.user == 'admin'}">
							<td align="right">
								<input class="button" type="button" value="수정"	onclick="$('#noticeview').submit();">
								<input class="button" type="button" value="삭제" onclick="noticeboarddel();">
							</td>
						</c:if>
					</tr>
				</table>
		</div>	
	</div>
	</div>
	
	
	
</body>
</html>