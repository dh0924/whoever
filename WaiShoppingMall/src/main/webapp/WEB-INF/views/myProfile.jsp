<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>

	<meta charset="UTF-8">

	<meta http-equiv="pragma" content="no-cache">

	<meta http-equiv="cache-control" content="no-store,no-cache">
	
	

	<title>WAI MAIN</title>

 <script>
  
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
 

<script>

	function bye() {
		
  	  var check = confirm("정말로 탈퇴하시겠습니까?");
  	  /* if(check == true) else false */
  	  if(check) {
  		  document.getElementById("updateform").action = "bye";
  		document.getElementById("updateform").submit();
		  alert("탈퇴처리되었습니다."); 
	 } else alert("취소되었습니다.");
		
	}
	 

	function logout() {

		

		document.update.action="logout";

		document.update.submit();

		

	}

 

 

	function updatechk() {

		if (!document.getElementById("pw").value) {
			alert("비밀번호를 입력해주세요.")
			return false;

		}
		
		if(document.getElementById("pw").value.length < 6){
			alert("6자리 이상 비밀번호를 사용해주세요.")
			signup.pw.value="";
		}
		
		
		var pattern = /[ ()_+|<>{}%/]/gi;
	        
	    if( pattern.test(document.getElementById("pw").value)) {

	         alert("()_+|<>{}%/ 등의 문자는 사용하실 수 없습니다.");
	          return false;
	       }
		

 

		if (!document.getElementById("pwchk").value) {

			alert("비밀번호 확인란에 비밀번호를 입력해주세요.")

			return false;

		}

 
	    if( pattern.test(document.getElementById("pwchk").value)) {

	         alert("()_+|<>{}%/ 등의 문자는 사용하실 수 없습니다.");
	          return false;
	       }
		
		
		

		if (document.getElementById("pw").value != document.getElementById("pwchk").value) {

			alert("비밀번호 확인이 일치하지 않습니다.")

			return false;

		}
		

	    
		if(!document.getElementById("hp1").value || !document.getElementById("hp2").value || !document.getElementById("hp3").value){
			alert("연락처를 입력해주세요.")
			return false;
		}
		

	 	var pattern2 = /^[0-9]+$/
	 		
		 if( !pattern2.test(document.getElementById("hp1").value) || !pattern2.test(document.getElementById("hp2").value) || !pattern2.test(document.getElementById("hp3").value)) {

	         alert("연락처에는 숫자만 입력가능합니다.");
	          return false;
	       }
		
		
		if(document.getElementById("hp1").value.length < 3 || document.getElementById("hp2").value.length < 4 || document.getElementById("hp3").value.length < 4){
			alert("올바른 핸드폰 번호를 입력해주세요.")
			return false;
		}	

 
		if (!document.getElementById("sample3_postcode").value || !document.getElementById("sample3_address").value) {

			alert("주소를 입력해주세요.")

			return false;

		}
		 if( !pattern2.test(document.getElementById("sample3_postcode").value)) {

	         alert("우편번호에는 숫자만 입력가능합니다.");
	          return false;
	       }
		
		

	    if( pattern.test(document.getElementById("sample3_postcode").value) || pattern.test(document.getElementById("sample3_address").value) || pattern.test(document.getElementById("sample3_detailAddress").value)) {

	         alert("()_+|<>{}%/ 등의 문자는 사용하실 수 없습니다.");
	          return false;
	       }
		
		
		
		if (!document.getElementById("email").value) {
			alert("이메일을 입력해주세요.")
			return false;
		}
	
		
		var pattern4 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/
	
	    if( !pattern4.test(document.getElementById("email").value)) {
	        alert("올바른 형식의 이메일주소를 입력해주세요.");
	         return false;
	      }


		document.getElementById("updateform").action = "update";
		document.getElementById("updateform").submit();
		
		alert("회원정보가 수정되었습니다.");

	}

	

	

</script>

 

<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<link href="${pageContext.request.contextPath}/resources/theme_1/all/mypagestyle.css" rel="stylesheet">

	<link href="${pageContext.request.contextPath}/resources/theme_1/fontello/css/fontello.css" rel="stylesheet">

	<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_board.css" rel="stylesheet">

	<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_button_style.css" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">


</head>

<body>

	<div class="StyledLayout">

		<div class="Header">

			<jsp:include page="Header.jsp"></jsp:include>

		</div>

		<div class="Main">

			<div class="grid threeGrid">

				<div class="grid__item">

					<ul>

						<li class="fontello"><a href="myCart">&#xe800<br>

							<div style="font-size: 22px; font-family: 'Merriweather', serif;">MyCart</div></a>

						</li>

					</ul>

				</div>

				<div class="grid__item">

					<nav class="header__nav">

						<h3 style="text-align: left">My Profile</h3>

						<hr>

					</nav>

					<article class="grid__article">
	<div style="overflow-y: auto; overflow-x: hidden; width: 100%; height: 700px;">
						<form id="updateform" method="post" >

							<div class="grid__myprofile" style="margin: 0; padding: 0;">

								<div class="myprofile__list" style="margin-top: 0; padding-top: 0;">

									<div class="myprofile__item">
										<span class="profile__name">이름 : ${mloginvo.name} </span>
									</div>

									<div class="myprofile__item">

										<span class="profile__name">아이디 : ${mloginvo.id}</span>
											<input type="hidden" name="id" value="${mloginvo.id}" >

									</div>

									<div class="myprofile__item">

										<span align="left" class="profile__name">비밀번호<br><input type="password" name="pw" id="pw" value="${mloginvo.pw}" ></span>

									</div>

									<div class="myprofile__item">

										<span align="left" class="profile__name">비밀번호 확인<br><input type="password" name="idchk" id="pwchk" value="${mloginvo.pw}" ></span>

									</div>

									<div class="myprofile__item">

										<span align="left" class="profile__name">전화번호<br>
										<input style="width:50px;" type="text" id="hp1" name="hp1" value="${mloginvo.hp1}"> - <input style="width:50px;"  type="text" id="hp2" name="hp2" value="${mloginvo.hp2}"> - <input style="width:50px;"  type="text" id="hp3" name="hp3" value="${mloginvo.hp3}"></span>

									</div>

									<div class="myprofile__item">

										<span align="left" class="profile__name">주소<br>
	<input type="text" name="ad1"  id="sample3_postcode" value="${mloginvo.ad1 }" placeholder="우편번호" >
	<input class="button-long2" type="button" onclick="sample3_execDaumPostcode()" value="주소 수정 하기"><br>
	<input type="text" name="ad2" id="sample3_address" value="${mloginvo.ad2 }" placeholder="주소" ><br>
	<input type="text" name="ad3" id="sample3_detailAddress" value="${mloginvo.ad3 }" placeholder="상세주소"> <br>
	<input type="hidden" id="sample3_extraAddress" placeholder="참고항목"></span>

									</div>

									<div class="myprofile__item">

										<span align="left" class="profile__name">이메일<br><input type="text" id="email" name="email" value="${mloginvo.email}"></span>

									</div>

									<div class="myprofile__item">

										<span class="profile__name">포인트 : ${mloginvo.point}</span>

									</div>

									<div class="myprofile__item">

										<span align="left" class="profile__name">누적 포인트 : ${mloginvo.a_point}</span>

									</div>

									<input class="button" type="button" value="수정하기"  class="button" style="margin-top: 30px;" onclick="updatechk()">
									<input class="button" type="button" value="회원탈퇴"  class="button" style="margin-top: 30px;" onclick="bye()">
								</div>

						</form>
</div>
					</article>	

				</div>

				<div class="grid__item">

					<ul>

						<li class="fontello">

							<a href="myProfile">&#xf2be<br><div style="font-size: 22px; font-family: 'Merriweather', serif;">My Profile</div></a>

						</li>

					</ul>

				</div>

				<div class="grid__item"></div>

			</div>

		</div>

		

		<!-- <div id="Footer">

				<jsp:include page="Footer.jsp"></jsp:include>

			</div> 

		-->

	</div>



 

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<script	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

</body>

</html>
