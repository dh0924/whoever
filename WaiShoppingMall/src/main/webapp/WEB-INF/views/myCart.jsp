<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>WAI MAIN</title>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/mypagestyle.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/fontello/css/fontello.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_board.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_button_style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_paging.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<script   src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script>
   $(function()
   { //전체선택 체크박스 클릭 
      $("#allcheck").click(function()
      { //만약 전체 선택 체크박스가 체크된상태일경우 
         if($("#allcheck").attr("checked") == true)
         { //해당화면에 전체 checkbox들을 체크해준다 
            $("input[type=checkbox]").attr("checked","checked");  
         }
         else // 전체선택 체크박스가 해제된 경우
         { //해당화면에 모든 checkbox들의 체크를해제시킨다.
            $("input[type=checkbox]").attr("checked",""); 
         } 
      })
      
      $(".chk").click(function()
      { //만약 전체 선택 체크박스가 체크된상태일경우
         if($("input[name='chk']:checked").length != $("input[name='chk']").length)
         { //해당화면에 전체 checkbox들을 체크해준다 
            $("#allcheck").attr("checked","");  
         }
         else
         {
            $("#allcheck").attr("checked","checked");  
         }
      })
   })
   
   function gopay()
   {
      if($("input[name='chk']:checked").length == 0)
      {
         alert("상품을 선택해주세요");
         return false;
      }
      
      var con = confirm("선택된 상품을 주문하시겠습니까?");
       
      if(con==true)
      {
         var DATA = "";
         $("input[name='chk']:checked").each(function() 
         {
            DATA += $(this).val() + ",";
         });
         DATA = DATA.substring(0,DATA.length-1);
         
         location.href='payment?DATA='+DATA; 
      }
   }
   
   function cartdele()
   {
      if($("input[name='chk']:checked").length == 0)
      {
         alert("상품을 선택해주세요");
         return false;
      }
      
       var con = confirm("선택된 상품을 삭제하시겠습니까?");
         
         if(con==true)
         {
           var DATA = "";
         $("input[name='chk']:checked").each(function() 
         {
            DATA += $(this).val() + ",";
         });
         DATA = DATA.substring(0,DATA.length-1);
         
         location.href='cartdelete?DATA='+DATA;
            alert("삭제되었습니다");
         }  
   }
</script>

<body>
 <div class="StyledLayout">
		<div id="Header">
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
						<h3 style="text-align: left">My Cart</h3>
						<hr>
					</nav>

					<article class="grid__article">
						<c:if test="${check == 0}">
							<div class="warning">
								<ul>
									<li class="fontello">&#xe815</li>
									<li style="font-size: 30px; margin: 0;">장바구니에 상품이 없습니다.<br>장바구니에 상품을 담아주세요</li>
								</ul>
							</div>
						</c:if>
						<c:if test="${check != 0}">
						 <div style="overflow-y: auto; overflow-x: hidden; width: 100%; height: 700px;">
							<table class="table" border="1"
								style="table-layout: auto; margin: auto; width: 80%; text-align: center;">
								<tr style="background-color: #d3d3d3">
									<th><input type="checkbox" id="allcheck"></th>
									<th>이미지</th>
									<th>상품 정보</th>
									<th>판매가</th>
									<th>수량</th>
									<th>합계</th>
								</tr>
								<c:forEach var="imsi" items="${list1 }">
									<tr>
										<td><input type="checkbox" class="chk" name="chk"
											id="${imsi.cartno }" value="${imsi.cartno }"></td>
										<td><img
											src="<spring:url value='/C:/upload/test/${imsi.stored_fname }'/>"
											width="150" height="150" /></td>
										<td>${imsi.productsubject }<br>${imsi.productsize }
											SIZE<br>${imsi.productcolor } COLOR
										</td>
										<td>${imsi.productprice }원</td>
										<td>${imsi.productamount }개</td>
										<td>${imsi.productamount * imsi.productprice}원</td>
									</tr>
								</c:forEach>
							</table>
							</div>
							<br>
							<br>
							<table align="center">
								<tr>
									<td><input class="button" type="button" value="주문"
										onclick="gopay();"> <input class="button"
										type="button" value="삭제" onclick="cartdele()"></td>
								</tr>
							</table>
						</c:if>
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
   
</body>
</html>