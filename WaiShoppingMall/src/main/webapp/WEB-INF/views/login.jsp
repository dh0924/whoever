<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>



<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script>



function signup() {
	
	document.loginform.action="chkmem";
	document.loginform.submit();
	
}

//header 부분 함수 gologin() 수정


function gologin() {
	
	if(!loginform.id.value) {
		alert("아이디를 입력하세요")
		return false;
		}
	
		var regexp =  /^[A-Za-z0-9]+$/	

			if( !regexp.test(loginform.id.value) ) {
				alert("아이디는 영문과 숫자만 입력가능합니다.")			
				return false;
			}
	
	
		if(!loginform.pw.value) {
		alert("비밀번호를 입력하세요")
		return false;
			}
	        	      
    	var pattern = /^[()_+|<>:{}%/]+$/
        
	    if( pattern.test(loginform.pw.value)) {

	         alert("()_+|<>:{}%/ 등의 문자는 사용하실 수 없습니다.");
	          return false;
	       }
//alert("로그인하러 옴 ");
	
var id = loginform.id.value;
var pw = loginform.pw.value;

/* alert(loginform.id.value);
alert(loginform.pw.value); */

var userData = { id: id, pw: pw };	
	
$.ajax ({
	data : JSON.stringify(userData),
	dataType : "json",
	type : "post",
	url : "loginchk",
	contentType : "application/json; charset=UTF-8",
	success : function(data){
		if(data.rs == 1) {
			
			alert("로그인하셨습니다.")
			document.loginform.action="login";
			document.loginform.submit();
			
			
		} else if (data.rs == 0) {
			alert("가입된 정보가 없습니다.");
			
			document.loginform.action="login";
			document.loginform.submit();
			
		} 
	},

	   error : function(request,error,xhr1 , status)
         {
            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		
	}
	
}); 

}



 function saveId() {	
	 
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var key = getCookie("key");
    $("#userId").val(key); 
     
    if($("#userId").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("key");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("#userId").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            setCookie("key", $("#userId").val(), 7); // 7일 동안 쿠키 보관
        }
    });
    
    

}
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>



<meta charset="EUC-KR">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>

<title>로그인</title>
</head>
	<style>
		body{
			display: flex;
			align-items: center;
			justify-content: center;
			background-image: url('https://images.unsplash.com/photo-1515549832467-8783363e19b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80'); 
			background-size: cover;
		}
		.container{
			display: flex;
		}
		nav{
			border-right: 1px solid gray;
		}
		article{
			text-align: center;
			border: 1px solid black;
			padding: 50px;
			padding-top: 50%;
			margin: 20px;
			width: 80%;
		}
		
		
	</style>
<body onload="saveId();">
<div id="all-container">
<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>


<div id="all-content">
		<article style="margin: 0; padding: 0; margin-top: 300px; margin-left: 100px; border: 0;">
			<div id="login">
				<form name="loginform" method="post">
				<input type="hidden" name="oldurl" value="${oldurl }">
					
						<h1>Login</h1><br>
						<input class="txtBox00" type="text" name="id" id="userId" placeholder="id">
						<input class="txtBox00" type="password" name="pw" placeholder="pw"><br><br><br>
						<input class="button" type="button" value="로그인" onclick="gologin()">
						<input class="button" type="button" value="회원가입"	onclick="signup()">
						<input type="checkbox"	checked="checked" id="idSaveCheck" name="remember"> ID 기억하기<br><br><br>		
						<a href="findid">아이디 찾기</a>
						<a href="findpw">비밀번호 찾기</a>
					</form>			
			</div>
		</article>
	</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
