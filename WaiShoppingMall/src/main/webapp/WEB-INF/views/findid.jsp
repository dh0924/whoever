<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>

<!-- <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
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
	
	/* 	alert("아이디찾기");
		alert(form.name.value);
		alert(form.rnum1.value);
		alert(form.rnum2.value); */
		
		if(!form.name.value)	 {
			alert("이름을 입력해주세요.")
			return false;
		}

		
		var regexp = /^[가-힣\s]+$/ 		

			if( !regexp.test(form.name.value) ) {
				alert("올바른 한글이름을 입력해주세요.");
				return false;
			}

		if(!form.rnum1.value || !form.rnum2.value)	 {
			alert("주민번호를 입력해주세요.")
			return false;
		}	
		
		
		var regexp2 = /^[0-9]+$/	

			if( !regexp2.test(form.rnum1.value) || !regexp2.test(form.rnum2.value)) {

				alert("주민번호 자리에는 숫자만 입력할 수 있습니다.");
				return false;
			}
		
	 	var name = form.name.value;
	 	var rnum1 = form.rnum1.value;
	 	var rnum2 = form.rnum2.value;
	 	
	 	var data = { name: name, rnum1: rnum1, rnum2: rnum2 };


		$.ajax ({
			data : JSON.stringify(data),
			dataType : "json",
			type : "post",
			url : "dofindid",
			contentType : "application/json; charset=UTF-8",
			success : function(data){
				if(data.rs!=null) {
					document.getElementById('id').innerHTML="찾으시는 아이디는 "+data.rs+"입니다."
				} else  {
					alert("해당 아이디가 없습니다.");
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
<form name="form" method="post">
<br><br><br><br><br>
<h1>아이디 찾기</h1>
<br>
<input class="txtBox00" type="text" name="name" placeholder="이름을 입력하세요"  onkeyup="enterkey()"> <br><br>
<input class="txtBox00" type="text" name="rnum1" placeholder="주민번호 앞 6자리" maxlength="6" onkeyup="enterkey()" > - <input class="txtBox00" type="password" name="rnum2" placeholder="주민번호 뒷 7자리" maxlength="7" onkeyup="enterkey()">


<br><br>
<input class="button" type="button" value="아이디 찾기" onclick="dofind()" onkeyup="enterkey()"> <br>
<br><br>
<p style="font-size:20px;color:red;font-weight:bold;"id="id"></p>

<a href="gologin">로그인</a>
<a href="findpw">비밀번호 찾기</a>



</form >
</div>
</div>
</body>
</html>