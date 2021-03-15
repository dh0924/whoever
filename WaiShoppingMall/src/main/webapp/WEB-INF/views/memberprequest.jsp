<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery-1.4.4.min.js"></script>
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">



</head>

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
      

   function check(orderno)
   {
      
      if($("input[name='chk']:checked").length == 0)
      {
         alert("선택된 요청이 없습니다.");
         return false;
      }
      
      var con = confirm("선택된 요청을 확인하시겠습니까?");
       
      if(con==true)
      {
         var DATA = "";
         $("input[name='chk']:checked").each(function() 
         {
            DATA += $(this).val() + ",";
         });
         DATA = DATA.substring(0,DATA.length-1);
         
         location.href='orderupdate?DATA='+DATA; 
      }
   }
</script>
<body>
   <div id="all-container">
     <div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>
<div id="all-content">
<h1>회원 구매 요청</h1>
<br>
            <table class="table" border="1" style="table-layout: auto; margin: auto; width: 80%; text-align: center;">
               <tr style="background-color: #d3d3d3">
                    <th><input type="checkbox" id="allcheck"></th>
                  <th>번호</th>
                  <th>이름(ID)</th>
                  <th>상품명</th>
                  <th>옵션/수량</th>
                  <th>배송지 주소</th>
               </tr>
               <c:forEach var="imsi" items="${list1 }" varStatus="status">
                  <tr>
                      <td><input type="checkbox" class="chk" name="chk" id="${imsi.orderno }" value="${imsi.orderno }"></td>
                     <td>${imsi.orderno }</td>
                     <td>${imsi.id }</td>
                     <td>${imsi.productsubject }</td>
                     <td>${imsi.productsize }/${imsi.productcolor }/${imsi.productamount }</td>
                     <td>${list2[status.index].ad1 } / ${list2[status.index].ad2 } / ${list2[status.index].ad3 }</td>
                  </tr>
              </c:forEach>
            </table>
            <br>
            <table border="0" align="center">
          		 <tr>
                  <td><input class="button" type="button" value="확인" onclick="check();"></td>
                  </tr>
            </table>
           
      <div class="all-paging2">
         <c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
            <li><a href="gomemberprequest?page=${i }">${i }</a></li>
         </c:forEach>
      </div>

     
   </div>
</div>

   
</body>
</html>