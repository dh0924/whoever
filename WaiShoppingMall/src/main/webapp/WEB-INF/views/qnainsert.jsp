<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_writepost.css" rel="stylesheet">
</head>
<script>
$(document).ready(function()
		   {
		      var test = '';
		      test = '${qvo.qnalock}';
		      
		      $("#${qvo.qnakind}").attr("checked", "checked");
		      if(test == '1')
		         $("#qnalock").attr('checked', 'checked');      
		   })
		   
	function qnainst()
	{

	if(!qnain.qnasubject.value) {
		alert("제목을 입력하세요")
		return false;
			}
	        	      
    	var pattern = /^[()_+|<>{}%/]+$/
        
	    if( pattern.test(qnain.qnasubject.value)) {

	         alert("()_+|<>:{}%/ 등의 문자는 사용하실 수 없습니다.");
	          return false;
	       }
		
		if(qnain.qnasubject.value.length > 30) {
			alert("30글자 이내로 제목을 입력해주세요.")
			return false;
				}
		
		if(!qnain.qnacontents.value) {
			alert("후기 본문을 입력하세요")
			return false;
				}
		        	      
	    	var pattern = /^[()_+|<>{}%/]+$/
	        
		    if( pattern.test(qnain.qnacontents.value)) {

		         alert("()_+|<>{}%/ 등의 문자는 사용하실 수 없습니다.");
		          return false;
		       }
	    
			if(qnain.qnacontents.value.length > 100) {
				alert("100글자 이내로 본문을 입력해주세요.")
				return false;
					}
		qnain.submit();
	}
	
</script>
<body>
<div id="all-container">
<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>

<div id="all-content">
   <c:if test="${qvo != null}">
      <h1>Q&A 수정</h1>
   </c:if>
   <c:if test="${qvo == null}">
      <h1>Q&A 작성</h1>
   </c:if>
	
	<form name="qnain" action="qnains">
		<table id="qnaintab" align="center">
			<tr>
			<td><input type="radio" name="kind" id="상품" checked="checked" value="상품">상품</td>
            <td><input type="radio" name="kind" id="주문" value="주문">주문</td>
            <td><input type="radio" name="kind" id="배송" value="배송">배송</td>
            <td><input type="radio" name="kind" id="반품" value="반품">반품</td>
            <td><input type="radio" name="kind" id="기타" value="기타">기타</td>
			</tr>
		</table>
		<br>
		<br>
		<div id="all-writepost">
		<input type="text" class="textborder1" name="qnasubject" placeholder="제목을 입력해주세요" value="${qvo.qnasubject }">
		<br>
		<hr>
		<br> 
		<textarea style="font-size:20px;" class="textborder2"  name="qnacontents" placeholder="상품/색상/사이즈를 꼭 입력해주세요!!!!!!!!!"><c:if test="${qvo.qnacontents == null}">상품명 : ${productsubject }</c:if><c:if test="${qvo.qnacontents != null}">${qvo.qnacontents }</c:if></textarea>
		</div>
		<table style="width:750px;" align="center">
			<tr>
				<td align="left"><input type="checkbox" name="qnalock" value=1>비공개</td>
				 <c:if test="${qvo == null}">
               <td align="right"><input class="button" type="button" value="등록" onclick="qnainst();">
               <input class="button" type="button" value="취소" onclick="location.href='goproductdetail?productcode=${productcode}'"></td>
            </c:if>
            <c:if test="${qvo != null}">
               <td align="right"><input class="button" type="button" value="수정" onclick="qnainst();">
               <input type="hidden" name="edit" value="1">
               <input type="hidden" name="qnano" value="${qvo.qnano }">
               <input class="button" type="button" value="취소" onclick="location.href='myQnA'"></td>
            </c:if>
			</tr>
		</table>
		<input type="hidden" name="productsubject" value="${productsubject }">
		<input type="hidden" name="productcode" value="${productcode }">
	</form>
	</div>
	</div>
</body>
</html>