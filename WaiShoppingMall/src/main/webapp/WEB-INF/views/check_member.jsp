<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>회원가입</title>
	
	
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script>

	
	function rnumchk() {
		
		if(!rnum.name.value) {
			alert("이름을 입력해주세요")
			return false;
		}
		
		var regexp = /^[가-힣\s]+$/ 		

			if( !regexp.test(rnum.name.value) ) {

				alert("올바른 한글이름을 입력해주세요.");
				return false;
			}
		
		if(!rnum.rnum1.value || !rnum.rnum2.value){
			
			alert("주민번호를 입력해주세요")
			return false;
		}
		
		
		var regexp2 = /^[0-9]+$/	

			if( !regexp2.test(rnum.rnum1.value) || !regexp2.test(rnum.rnum2.value)) {

				alert("주민번호란에는 숫자만 입력할 수 있습니다.");
				return false;
			}
		
		if(rnum.rnum1.value.length <6 || rnum.rnum2.value.length<7) {
			alert("주민번호를 끝까지 입력해주세요.");
			return false;
		}
		
		
		if(rnum.rnum2.value.substring(0,1)!=1 && rnum.rnum2.value.substring(0,1)!=2 && rnum.rnum2.value.substring(0,1)!=3 && rnum.rnum2.value.substring(0,1)!=4 ) {
			alert("주민번호가 올바르지 않습니다.")
			return false;
		}
	
	
		
		
/* 	 	alert(rnum.rnum1.value);
		alert(rnum.rnum2.value); */
	 	
		var name = rnum.name.value;
		var rnum1 = rnum.rnum1.value;
		var rnum2 = rnum.rnum2.value;
		
		var userData = { name: name, rnum1: rnum1, rnum2: rnum2 };	
	 	
		$.ajax ({
			data : JSON.stringify(userData),
			dataType : "json",
			type : "post",
			url : "chkrnum",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.rs == 1) {
					alert("이미 가입된 주민번호 입니다");
					
					location.href='gologin';
					
				} else if (data.rs == 2) {
					alert("가입가능한 주민번호 입니다.");
					
					document.rnum.action="gosignup";
					document.rnum.submit();
				} 
			},
		
			   error : function(request,error,xhr1 , status)
		         {
		            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				
			}
			
		}); 
		
	}
	
	</script>
	
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>

</head>
<body>

<div id="all-container">
<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>


<div id="all-content">
<form name="rnum" method="post">

<br><br><br><br><br>
<h1>회원 여부 확인</h1>
<br>

<input class="txtBox00" type="text" name="name" placeholder="이름"> <br><br>
<input class="txtBox00" type="text" name="rnum1" placeholder="주민등록번호" maxlength="6"> - <input class="txtBox00" type="password" name="rnum2" maxlength="7"> <br>
<br>
<input class="button" type="button" value="확인" onclick="rnumchk()">




</form>
</div>
</div>



</body>
</html>
