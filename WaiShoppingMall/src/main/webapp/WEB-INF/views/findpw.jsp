<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비밀번호 찾기</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>

<script>


function enterkey() {
    if (window.event.keyCode == 13) {
    		dofind();
	}
}


function dofind() {
	
/* 	alert("비밀번호 찾기");
	alert(form.id.value);
	alert(form.name.value); */
	
	
	if(!form.name.value)	 {
		alert("이름을 입력해주세요.")
		return false;
	}
	
	var regexp = /^[가-힣\s]+$/ 		

		if( !regexp.test(form.name.value) ) {
			alert("올바른 한글이름을 입력해주세요.");
			return false;
		}
	
	if(!form.id.value)	 {
		alert("아이디를 입력해주세요.")
		return false;
	}
	
	var regexp =  /^[A-Za-z+]{1,}[0-9+]{1,}$/	

		if( !regexp.test(form.id.value) ) {

			alert("아이디는 영문+숫자 조합형태여야 합니다.");
			signup.id.value = "";
			return false;
		}

 	var id = form.id.value;
 	var name = form.name.value;
 	
 	var data = { id: id, name: name };


	$.ajax ({
		data : JSON.stringify(data),
		dataType : "json",
		type : "post",
		url : "dofindpw",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if (data.rs!=null) {
				document.getElementById('pw').innerHTML="찾으시는 비밀번호는 "+data.rs+"입니다."
			} else  {
				alert("해당 정보가 없습니다.");
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
<div id="all-container">
<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>


<div id="all-content">
<form name="form" method="post">
<br><br><br><br><br>
<h1>비밀번호 찾기</h1>

<input class="txtBox00" type="text" name="name" placeholder="이름을 입력하세요." onkeyup="enterkey()"><br><br>
<input class="txtBox00" type="text" name="id" placeholder="아이디를 입력하세요." onkeyup="enterkey()">

<br><br>
<input class="button" type="button" value="비밀번호 찾기" onclick="dofind()" onkeyup="enterkey()" >
<br><br>
<p style="font-size:20px;color:red;font-weight:bold;" id="pw"></p>

<a href="gologin">로그인</a>

</form>
</div>
</div>
</body>
</html>