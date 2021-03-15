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

</head>
<script>
	function paycom()
	{
		if(!paycomp.recipient.value){
			alert("수령인/배송지명을 입력해주세요.")
			return false;
		}
		
		if(!paycomp.name.value){
			alert("구매자 이름을 입력해주세요.")
			return false;
		}
		
		
		if(!paycomp.phone_number.value){
			alert("수령인 전화번호를 입력해주세요.")
			return false;
		}
		
		if(!paycomp.email.value){
			alert("이메일을 입력해주세요.")
			return false;
		}
		
		if(!paycomp.address.value){
			alert("배송지 주소를 입력해주세요.")
			return false;
		}
		
		if(!paycomp.myphone_number.value){
			alert("구매자 전화번호를 입력해주세요.")
			return false;
		}
		
		if(!paycomp.message.value){
			alert("배송 메세지를 입력해주세요.")
			return false;
		}
		document.paycomp.total.value = $("#total_gold").html();
		paycomp.submit();
	}
	
	   function pointlimit()
	   {
	      var regex= /[^0-9]$/;
	      var v = paycomp.point.value;
	      
	      if(regex.test(v))
	      {
	         alert("숫자만 입력해주세요.");
	         $("#point").val("0");
	      }
	         var percent = $("#grade_discount").val() 
	         var u_point =  ${mloginvo.point };

	         if( paycomp.point.value > u_point )
	         {
	            $("#point").val(u_point);
	         }
	         
	         $("#p_point").html($("#point").val());
	         
	         var total_g = $("#totalprice2").html();
	         
	         $("#total_gold").html(total_g - $("#grade_discount").html() - $("#p_point").html());
	         
	         var num = parseInt($("#total_gold").html())
	     /*     alert(num); */
	         
	         if(num<0)
	         {
	        	 $("#point").html(${totalprice - percent})
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
			<table class="table" border="1" class="table" style="width: 80%; height: 600px; margin: 40px; margin-left: 100px; font-size: 1rem; font-weight: 600;" >
				<tr>
					<th colspan=2>수령자 정보</th>
					<th colspan=2>구매자 정보</th>
				</tr>
				<tr>
					<td>수령인/배송지명</td>
					<td>${map.recipient }</td>
					<td>이름</td>
					<td>${map.name }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${map.phone_number }</td>
					<td>이메일</td>
					<td>${map.email }</td>
				</tr>
				<tr>
					<td>배송지 주소</td>
					<td>${map.ad1 } ${map.ad2 } ${map.ad3 }</td>
					<td>전화번호</td>
					<td>${map.myphone_number }</td>
				</tr>
				<tr>
					<td>배송메세지</td>
					<td>${map.message }</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td>적립금 사용</td>
					<td>${map.point }</td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td>결제 수단</td>
					<td colspan=3>${map.paymethod }</td>
				</tr>
				<tr>
					<td align="right" colspan=4 style="padding-right: 20px;">총 결제금액 : ${map.total }</td>
				</tr>
			</table>
			<input type="button" value="확인" class="button"	onclick="location.href='myOrder?page=1'">
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
</body>
</html>