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
   <link href="${pageContext.request.contextPath}/resources/theme_1/all/all_paging.css" rel="stylesheet">
   <link href="${pageContext.request.contextPath}/resources/theme_1/all/all_button_style.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<script>
   function orderdele(orderno)
   {
       var con = confirm("주문을 취소하시겠습니까?");
         
       if(con==true)
       {
         location.href="orderdel?orderno="+orderno;
         alert("주문이 취소되었습니다");
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
                  <h3 style="text-align: left">My Order</h3>
                  <hr>
               </nav>
               <article class="grid__article">
                  <c:if test="${check == 0}">
                     <div class="warning">
                        <ul>
                           <li class="fontello">&#xe815</li>
                           <li style="font-size: 30px; margin: 0;">Order 내역이 없습니다.<br>제품을 구매해주세요</li>
                        </ul>
                     </div>
                  </c:if>
                  <c:if test="${check != 0}">
                     <div style="overflow-y: auto; overflow-x: hidden; width: 100%; height: 700px;">
                        <table class="table" border="1"
                           style="table-layout: auto; margin: auto; width: 80%; text-align: center;">
                           <tr style="background-color: #d3d3d3">
                              <th>이미지</th>
                              <th>상품 정보</th>
                              <th>주문일자</th>
                              <th>주문 금액(수량)</th>
                              <th>주문 상태</th>
                              <th>비고</th>
                           </tr>
                           <c:forEach var="imsi" items="${list1 }">
                              <tr>
                                 <td><img
                                    src="<spring:url value='/E:/upload/test/${imsi.stored_fname }'/>"
                                    width="150" height="150" /></td>
                                 <td>${imsi.productsubject }<br>${imsi.productsize }
                                    SIZE<br>${imsi.productcolor } COLOR
                                 </td>
                                 <td>${imsi.orderdate }</td>
                                 <td>${imsi.productprice }원(${imsi.productamount }개)</td>
                                 <td>${imsi.orderstate }</td>
                                 <c:if test="${imsi.orderstate == '배송 준비 중'}">
                                    <td><input class="button" type="button" value="주문 취소"
                                       onclick="orderdele('${imsi.orderno}');"></td>
                                 </c:if>
                                 <c:if test="${imsi.orderstate == '배송 완료'}">
                                    <td><input class="button" type="button" value="후기 작성"
                                       onclick="location.href='goreviewinsert?r_sangpum=${imsi.productsubject}&r_size=${imsi.productsize}&r_color=${imsi.productcolor}&orderno=${imsi.orderno }'"></td>
                                 </c:if>
                              </tr>
                           </c:forEach>
                        </table>
                     </div>
                     <div id="co"></div>
                     <div class="all-paging2">
                     <c:forEach var="i" begin="1" end="${totalnum2}" step="1">
                        <li><a href="javascript:void(0);" class="pagebutton" onclick="location.href='myOrder?page=${i}'">${i }</a></li>
                     </c:forEach>
                     </div>
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
            <%-- <div id="all-paging2">
            <c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
               <li>
                  <a href="javascript:void(0);" onclick="paging(${i })">${i }</a>
               </li>
            </c:forEach>
            </div> --%>
       
   </div>



   <script   src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
   
  
  
   
</body>
</html>