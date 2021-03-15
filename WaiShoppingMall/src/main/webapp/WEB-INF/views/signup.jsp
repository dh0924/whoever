<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  
   	function makeid() {
   		
   		var regexp =  /^[A-Za-z+]{1,}[0-9+]{1,}$/	

   			if( !regexp.test(signup.id.value) ) {
   				document.getElementById('id').innerHTML="<p style='color:red;'><b>아이디는 영문+숫자 조합으로 입력해주세요."
   				return false;
   			} else {
   				document.getElementById('id').innerHTML=""
   				return false;
   			}
   	}
  
    function sample3_execDaumPostcode() {
      
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample3_postcode').value = data.zonecode;
                document.getElementById("sample3_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample3_detailAddress").focus();

              
            },
            
        }).open();
    }
</script>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>	

/*function load() {
	
    $("#id").removeAttr("readonly");
} */

var idchk = 0;

function idchker() {
	
 	var id = signup.id.value;
 	var id2 = { id: id };
 	
	var regexp =  /^[A-Za-z+]{1,}[0-9+]{1,}$/

/* 	alert(JSON.stringify(id2)); */

	$.ajax ({
		data : JSON.stringify(id2),
		dataType : "json",
		type : "post",
		url : "idchk",
		contentType : "application/json; charset=UTF-8",
		success : function(data){
			if(id =="") {
				alert("아이디를 입력해주세요.");
				
			} else if( !regexp.test(signup.id.value) ) {
					alert("아이디는 영문+숫자 조합으로 입력해주세요.");
		}else if (data.rs == 0) {
				alert("사용 가능한 아이디 입니다.");
				idchk=1;
				 $("#idchk").attr("readonly", true);
				
			} else if (data.rs == 1) {
				alert("이미 사용 중인 아이디 입니다.");
			}
		},
	
		   error : function(request,error,xhr1 , status)
	         {
	            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			
		}
		
	});
	
}



function memberchk() {
	
	if(!signup.id.value){
		alert("아이디를 입력하세요.")
		return false;
	}
	
	
    if(idchk==0){
        alert("아이디 중복체크를 해주세요")
        return false; }
	
	if(!signup.pw.value){
		alert("비밀번호를 설정해주세요.")
		return false;
	}
	
 	var pattern = /^[()_+|<>{}%/]+$/
        
    if( pattern.test(signup.pw.value)) {

         alert("()_+|<>{}%/ 등의 문자는 사용하실 수 없습니다.");
          return false;
       }
	
	
	if(!signup.pwchk.value){
		alert("비밀번호 확인란에 비밀번호를 입력해주세요.")
		return false;
	}
	
	 if( pattern.test(signup.pwchk.value)) {

         alert("()_+|<>{}%/ 등의 문자는 사용하실 수 없습니다.");
          return false;
       }
	
	
	if(signup.pw.value.length < 6){
		alert("6자리 이상 비밀번호를 사용해주세요.")
		signup.pw.value="";
	}
	
	if(signup.pw.value != signup.pwchk.value) {
		alert("비밀번호 확인이 일치하지 않습니다.")
		return false;
	}
	
	
	if(!signup.hp1.value || !signup.hp2.value || !signup.hp3.value){
		alert("연락처를 입력해주세요.")
		return false;
	}
	
	
 	var pattern2 = /^[0-9]+$/
	
	 if( !pattern2.test(signup.hp1.value) || !pattern2.test(signup.hp2.value) || !pattern2.test(signup.hp3.value)) {

         alert("연락처에는 숫자만 입력가능합니다.");
          return false;
       }
	
	
	if(signup.hp1.value.length < 3 || signup.hp2.value.length < 4 || signup.hp3.value.length < 4){
		alert("올바른 핸드폰 번호를 입력해주세요.")
		return false;
	}	

	
	if(!signup.ad1.value){
		alert("주소를 입력해주세요.")
		return false;
	}
	
	var pattern3 = /^[_+|<>{}%/]+$/
	
    if( pattern3.test(signup.ad1.value) || pattern3.test(signup.ad2.value) || pattern3.test(signup.ad3.value)) {

        alert("_+|<>{}%/ 등의 문자는 사용하실 수 없습니다.");
         return false;
      }
	
	
	if(!signup.email.value){
		alert("이메일을 입력해주세요.")
		return false;
	}
	
	var pattern4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
	
	
		
    if( !pattern4.test(signup.email.value)) {

        alert("올바른 형식의 이메일주소를 입력해주세요.");
         return false;
      }

      		alert("회원가입을 축하합니다");
	
	document.signup.action="signup";
	document.signup.submit();
}




</script>


</head>
<body onload="load()">
<div id="all-container">


<jsp:include page="sidebar.jsp"></jsp:include>
<div id="all-content">
<div align="center">
<form name="signup" method="post">
<br><br>
<h1>회원가입</h1>
<table>
<tr>
<td>이름</td>
</tr>
<tr>
<td><input class="txtBox01" type="text" name="name" value="${ name }" readonly></td>
</tr>
<tr>
<td>아이디</td>
</tr>
<tr>
<td><input style="width:300px;" class="txtBox01" type="text" name="id" id="idchk" onkeyup="makeid()" > <input class="button" type="button" name="idchk" value="아이디 중복확인" onclick="idchker()" > <a id="id"></a></td>
</tr>
<tr>
<td>비밀번호</td>
</tr>
<tr>
<td><input class="txtBox01" type="password" name="pw" onkeyup="makepw()"></td>
</tr>
<tr>
<td>비밀번호 확인</td>
</tr>
<tr>
<td><input class="txtBox01" type="password" name="pwchk"></td>
</tr>
<tr>
<td>핸드폰 번호</td>
</tr>
<tr>
<td><input style="width:100px;" class="txtBox01" type="text" name="hp1" maxlength="3"> - <input style="width:100px;" class="txtBox00" type="text" name="hp2" maxlength="4"> - <input style="width:100px;" class="txtBox00" type="text" name="hp3" maxlength="4"></td>
</tr>
<tr>
<td>주소</td>
</tr>
<tr>
<td><input style="width:300px;" class="txtBox01" type="text" name="ad1" id="sample3_postcode" placeholder="우편번호"> <input class="button" type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기"></td>
</tr>
<tr>
<td><input class="txtBox01" type="text" name="ad2" id="sample3_address"  placeholder="주소"></td>
</tr>
<tr>
<td><input class="txtBox01" type="text" name="ad3" id="sample3_detailAddress" placeholder="상세주소"></td>
</tr>
<tr>
<td>이메일</td>
</tr>
<tr>
<td><input class="txtBox01" type="text" name="email"></td>
</tr>
<tr>
<td>주민번호</td>
</tr>
<tr>
<td><input style="width:175px;" class="txtBox00" type="text" name="r_num1"  value="${r_num1 }" readonly> - <input style="width:175px;" class="txtBox00" type="password" name="r_num2"  value="${r_num2 }" readonly></td>
</tr>
<tr>
<td>성별</td>
</tr>
<tr>
<td><input class="txtBox01" type="text" name="gender" value="${ gender }" readonly></td>
</tr>

</table>

<!-- 가입날짜 : 오늘날짜 --> <input type="hidden" name="m_date" value="${ m_date }">
<!-- 관리자여부 : x --> <input type="hidden" name="admin" value="0">
<!-- 등급 : 브론즈 --> <input type="hidden" name="grade" value="bronze">
<input type="hidden"  id="sample3_extraAddress" >
<br>

<input class="button-long" type="button" value="가입하기" onclick="memberchk()">


</form>
</div>
</div>
</div>
</body>
</html>