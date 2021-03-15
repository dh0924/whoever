<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_slide.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

</head>
<script>
function paycom()
{
	
	if(!paycomp.recipient.value){
		alert("수령인/배송지명을 입력해주세요.")
		return false;
	}
		
	
	var regexp = /^[가-힣\s]+$/ 		

		if( !regexp.test(paycomp.recipient.value) ) {

			alert("올바른 한글이름을 입력해주세요.");
			return false;
		}
    
	
	
	
	if(!paycomp.phone_number.value){
		alert("수령인 전화번호를 입력해주세요.")
		return false;
	}
	

 	var pattern2 = /^[0-9]*-[0-9]*-[0-9]+$/
 		
	 if( !pattern2.test(paycomp.phone_number.value)) {

         alert("연락처는 '010-0000-0000' 형식으로 입력해주세요.");
          return false;
       }
 	
 	 if(paycomp.phone_number.value.length < 13 || paycomp.phone_number.value.length > 13) {
 	    alert("연락처는 '010-0000-0000' 형식으로 입력해주세요!");
          return false;
 	 }
	
	if (!document.getElementById("sample3_postcode").value || !document.getElementById("sample3_address").value) {
		alert("주소를 입력해주세요.")
		return false;
	}
	
	var pattern3 = /^[0-9]+$/
	 if( !pattern3.test(document.getElementById("sample3_postcode").value)) {

         alert("우편번호에는 숫자만 입력가능합니다.");
          return false;
       }
	
	
	var pattern = /[()_+|<>{}%/]/gi;
	
    if( pattern.test(document.getElementById("sample3_postcode").value) || pattern.test(document.getElementById("sample3_address").value) || pattern.test(document.getElementById("sample3_detailAddress").value)) {
         alert("()_+|<>{}%/ 등의 문자는 사용하실 수 없습니다.");
          return false;
       }

	

	document.paycomp.total.value = $("#total_gold").html();
	paycomp.submit();
}
	
function pointlimit()
{
   var regex= /[^0-9]$/;
   var v = paycomp.point.value;
   
    if(v.substring(0,1) == 0)
      $("#point").val(v.substring(1,2)); 
   
   if( paycomp.point.value == "")
          $("#point").val(0);
   
   if(regex.test(v))
   {
      alert("숫자만 입력해주세요.");
      $("#point").val("0");
   }
      var percent = $("#grade_discount").html();
      var u_point =  ${mloginvo.point };

      if( paycomp.point.value > u_point )
      {
         $("#point").val(u_point);
      }
      
      $("#p_point").html($("#point").val());
      
      var total_g = $("#totalprice2").html();
      
      $("#total_gold").html(total_g - $("#grade_discount").html() - $("#p_point").html());
      
      var num = parseInt($("#total_gold").html());
      
      var ttp = $("#totalprice2").html();
      
      if(num<0)
      {
         $("#point").val(ttp-percent);
          $("#total_gold").html("0");
      }
}
</script>
<body>

	<div id="all-container">

		<div id="user-header">
			<jsp:include page="loginout.jsp"></jsp:include>
		</div>
		<div class="user-sidebar">
			<jsp:include page="sidebar.jsp"></jsp:include>
		</div>

		<div id="all-content">
			<h1>상품 주문/결제</h1>
			<hr>
			<form name="paycomp" action="paycomple">
				<table class="table" border="1" style="width: 100%; margin-top: 40px;">
					<tr>
						<th>이미지</th>
						<th>상품정보</th>
						<th>판매가</th>
						<th>수량</th>
						<th>합계</th>
					</tr>
					<c:set var="totalprice" value="0" />
					<c:forEach var="imsi" items="${list1 }">
						<tr>
							<td><img src="<spring:url value='/C:/upload/test/${imsi.stored_fname }'/>"width="150" height="150" /></td>
							<td>${imsi.productsubject }<br>${imsi.productsize }
								SIZE<br>${imsi.productcolor } COLOR
							</td>
							<td>${imsi.productprice }원</td>
							<td>${imsi.productamount }개</td>
							<td>${imsi.productamount * imsi.productprice}원</td>
							<c:set var="totalprice"
								value="${totalprice + (imsi.productamount * imsi.productprice)}" />
							<c:if test="${hid == 1}">
								<input type="hidden" name="hid" value="1">
								<input type="hidden" name="stored_fname"
									value="${imsi.stored_fname }">
								<input type="hidden" name="productsubject"
									value="${imsi.productsubject }">
								<input type="hidden" name="productsize"
									value="${imsi.productsize }">
								<input type="hidden" name="productcolor"
									value="${imsi.productcolor }">
								<input type="hidden" name="productprice"
									value="${imsi.productprice }">
								<input type="hidden" name="productamount"
									value="${imsi.productamount }">
								<input type="hidden" name="totalprice" value="${totalprice }">
							</c:if>
						</tr>
					</c:forEach>
				</table>
				<table class="table" border="1" style="width: 100%; height: 500px;">
					<tr>
						<th colspan=2>수령자 정보</th>
						<th colspan=2>구매자 정보</th>
					</tr>
					<tr>
						<td>수령인/배송지명</td>
						<td><input type="text" value="${mloginvo.name }" name="recipient"></td>
						<td>이름</td>
						<td><input type="text" value="${mloginvo.name }" name="name"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" value="${mloginvo.hp1}-${mloginvo.hp2}-${mloginvo.hp3}" name="phone_number"></td>
						<td>이메일</td>
						<td><input type="text" value="${mloginvo.email}" name="email"></td>
					</tr>
					<tr>
						<td>배송지 주소</td>
						<td>
	<input type="text" name="ad1"  id="sample3_postcode" value="${mloginvo.ad1 }" placeholder="우편번호" ><br>
	<input type="text" name="ad2" id="sample3_address" value="${mloginvo.ad2 }" placeholder="주소" ><br>
	<input type="text" name="ad3" id="sample3_detailAddress" value="${mloginvo.ad3 }" placeholder="상세주소"><br><br>
	<input class="button-long2" type="button" onclick="sample3_execDaumPostcode()" value="주소 수정 하기"><br>
	<input type="hidden" id="sample3_extraAddress" placeholder="참고항목"></td>
						<td>전화번호</td>
						<td><input type="text" value="${mloginvo.hp1}-${mloginvo.hp2}-${mloginvo.hp3}" name="myphone_number"></td>
					</tr>
					<tr>
						<td>배송메시지</td>
						<td><input type="text" placeholder="메시지를 입력해주세요." name="message"></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>적립금 사용</td>
						<td><input style="width:50px;"type="text" value="0" name="point" id="point"
							onKeyUp="pointlimit()">원 (총 보유 적립금 ${mloginvo.point }원)</td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td>결제 수단</td>
						<td colspan=3><input type="radio" name="paymethod"
							value="신용카드" checked="checked">신용카드 <input type="radio"
							name="paymethod" value="무통장 입금">무통장 입금 <input
							type="radio" name="paymethod" value="계좌이체">계좌이체 <input
							type="radio" name="paymethod" value="모바일 결제">모바일 결제</td>
					</tr>
					<tr>
						<td align="right" colspan=4>총 상품금액 : <span id="totalprice2">${totalprice}</span>
							원 - 등급할인: <span id="grade_discount">
							<c:if test="${mloginvo.grade == 'bronze'}">
									<fmt:parseNumber var="percent" value="0"
										integerOnly="true" />${percent }</c:if>
							<c:if test="${mloginvo.grade == 'silver'}">
									<fmt:parseNumber var="percent" value="${totalprice *0.03 }"
										integerOnly="true" />${percent }</c:if> <c:if
									test="${mloginvo.grade == 'gold' }">
									<fmt:parseNumber var="percent" value="${totalprice *0.05 }"
										integerOnly="true" />${percent }</c:if></span>원 - 적립금 <span id="p_point">0</span>원
							= <span id="total_gold">${totalprice - percent}</span>원
						</td>
					</tr>
				</table>
				<input class="button" style="margin: 30px;" type="button" value="결제하기" onclick="paycom();">
				<input type="hidden" name="total" value="">
				<c:if test="${hid != 1 }">
					<input type="hidden" name="DATA" value="${DATA }">
				</c:if>
			</form>
		</div>
	</div>

	<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
</body>
</html>
