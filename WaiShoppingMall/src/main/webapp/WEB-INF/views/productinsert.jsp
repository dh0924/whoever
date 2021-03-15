<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 상품 등록하기</title>
</head>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function()
   {
      $("#category").val("${pvo.productcategory}").attr("selected", "selected");
      $("#${pvo.productgender}").attr("checked", "checked");
      $("#productsize").val("${pvo.productsize}").attr("selected", "selected");
   }) 
   
     function select()
   {
      var dress = ["S","M","L","XL"];
      var shose = ["210","220","230","240","250","260","270","280"];
      var bag = ["BACKPACK","CROSS","TOTE"];
      var acce = ["RING","NECKLACE","WATCH","EARRING"];
      
      var selectitem = $("#category").val();
      var changeitem;
      
      if(selectitem == "상의" || selectitem == "하의")
      {
         changeitem = dress;
      }
      else if(selectitem == "신발")
      {
         changeitem = shose;
      }
      else if(selectitem == "가방")
      {
         changeitem = bag;
      }
      else if(selectitem == "액세서리")
      {
         changeitem = acce;
      }
      else
      {
         changeitem = 1;   
      }
      
      var size = changeitem.length;
      
      $('#productsize').empty();
      $('#productsize').append("<option>사이즈</option>");
      
      if(changeitem != 1)
      {
         for(var count = 0; count < size; count++)
         {
            var option = $("<option>" + changeitem[count] + "</option>");
            $('#productsize').append(option);
         }
      }
   }
   
   
   function aa()
   {
      var fileName = $('.file_input input[type=file]').val();
      var fileCount = $('.file_input input[type=file]').get(0).files.length;
      if($('.file_input input[type=file]').get(0).files.length == 1)
      {
         $('.file_input input[type=text]').val(fileName);
      }
      else 
      {
         $('.file_input input[type=text]').val('파일 '+fileCount+'개');
      }
   }
   

   
</script>

<style>
.file_input label {
    position:relative;
    cursor:pointer;
    display:inline-block;
    vertical-align:middle;
    overflow:hidden;
    width:100px;
    height:30px;
    background:#777;
    color:#fff;
    text-align:center;
    line-height:30px;
}
.file_input label input {
    position:absolute;
    width:0;
    height:0;
    overflow:hidden;
}
.file_input input[type=text] {
    vertical-align:middle;
    display:inline-block;
    width:400px;
    height:28px;
    line-height:28px;
    font-size:11px;
    padding:0;
    border:0;
  /*   border:1px solid #777; */
}

</style>
<body>
<div id="all-container">
<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>
      

<div id="all-content">
   <h1>상품등록</h1>
   <br>
<form action="productins" name="productinfo" id="productinfo" method="post" enctype="multipart/form-data">
   <table align="center">
      <tr>
         <td>카테고리</td>
         <c:if test="${pvo.productcode == null }">
         <td align="left">
            <select name="category" id="category" onchange="select()">
               <option value="">카테고리선택</option>
               <option value="상의">상의</option>
               <option value="하의">하의</option>
               <option value="가방">가방</option>
               <option value="신발">신발</option>
               <option value="액세서리">액세서리</option>
            </select>
         </td>
         </c:if>
         <c:if test="${pvo.productcode != null }">
            <td>${pvo.productcategory }</td>
         </c:if>
      </tr>
      <tr>
         <td>상품명</td>
         <td colspan=2 style="width:500px;"><input type="text" name="productsubject" style="width:100%; height:25px; border-radius:5px;" placeholder="상품명을 입력해주세요" value="${pvo.productsubject }"></td>
      </tr>
      <tr>
         <td>판매가</td>
         <td colspan=2><input type="text" name="productprice" style="width:100%; height:25px; border-radius:5px;" placeholder="판매가를 입력해주세요" value="${pvo.productprice }"></td>
      </tr>
      <tr>
         <td>옵션(기타)</td>
         <td align="left">
         <c:if test="${pvo.productcode != null }">
            사이즈 : ${pvo.productsize }
         </c:if>
         <c:if test="${pvo.productcode == null }">
            <select name="productsize" id="productsize">
               <option>사이즈</option>
            </select>
         </c:if>
         &nbsp;&nbsp;&nbsp;
         <c:if test="${pvo.productcode != null }">
            색상 : ${pvo.productcolor }
         </c:if>
         <c:if test="${pvo.productcode == null }">
            <input type="text" name="productcolor" style="width:50%; height:25px; border-radius:5px;" placeholder="색상">
         </c:if>
         </td>
      </tr>
      <tr>
         <td>재고</td>
         <td colspan=2><input type="text" name="productstock" style="width:100%; height:25px; border-radius:5px;" placeholder="제목을 입력해주세요" value="${pvo.productstock }"></td>
      </tr>
      <tr>
         <td>성별</td>
         <td align="left">
            <input type="radio" name="gender" id="남" value="남">남
            <input type="radio" name="gender" id="여" value="여">여
            <input type="radio" name="gender" id="unisex" value="unisex">unisex
         </td>
      </tr>
      <tr>
         <td>상품 설명</td>
         <td colspan=2><textarea name="productcontents" style="width:100%; height:500px; border-radius:5px; resize:none;" placeholder="내용을 입력해주세요">${pvo.productcontents }</textarea></td>
      </tr>
      <tr>
      
         <td colspan=2><div class = "file_input"><label>File Upload<input type="file" name="file" multiple="multiple" onchange="aa();"></label><input type="text" readonly="readonly" value="${pvo.original_fname }" title="File Route"></div></td>
      
         <c:if test="${pvo.productcode != null }">
            <td colspan=3><input class="button" type="button" value="수정" onclick="$('#productinfo').submit();"></td>
            <input type="hidden" name="edit" value="1">
            <input type="hidden" name="productcode" value="${pvo.productcode }">
         </c:if>
         <c:if test="${pvo.productcode == null }">
            <td colspan=3><input class="button" type="button" value="등록" onclick="$('#productinfo').submit();"></td>
         </c:if>
      </tr>
   </table>
</form>
</div>
</div>
</body>
</html>