<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>상품 후기 작성</title>
<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_slide.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_writepost.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/js/jquery.raty.js"></script>
<script>
</script>
<script type="text/javascript">
        $(function() {
            $('div#star').raty({
                score: 5
                ,path : "${pageContext.request.contextPath}/resources/img"
                ,width : 200
                ,half: false
                ,click: function(score, evt) {
                    $("#starRating").val(score);
                    $("#displayStarRating").html(score);
                }
            });
        });
        
   function go()
   {
/*       document.gogo.len.value = $("#displayStarRating").text();
   
      gogo.submit();   */

      if(!review.title.value) {
      alert("제목을 입력하세요")
      return false;
         }
                    
     var pattern = /^[()_+|<>:{}%/]+$/
      
       if( pattern.test(review.title.value)) {

            alert("()_+|<>:{}%/ 등의 문자는 사용하실 수 없습니다.");
             return false;
          }

      if(review.title.value.length <10) {
         alert("10글자 이상 제목을 입력해주세요.")
         return false;
            }
      
      
      if(review.title.value.length > 30) {
         alert("30글자 이내로 제목을 입력해주세요.")
         return false;
            }
      
      if(!review.naeyong.value) {
         alert("후기 본문을 입력하세요")
         return false;
            }
                       
          var pattern = /^[()_+|<>:{}%/]+$/
           
          if( pattern.test(review.naeyong.value)) {

               alert("()_+|<>:{}%/ 등의 문자는 사용하실 수 없습니다.");
                return false;
             }

         if(review.naeyong.value.length <10) {
            alert("10글자 이상 본문을 입력해주세요.")
            return false;
               }
       
         if(review.naeyong.value.length > 200) {
            alert("200글자 이내로 본문을 입력해주세요.")
            return false;
               }
      
         document.review.star1.value = $("#displayStarRating").text();
         
         /* document.review.naeyong.value = $("#k").val(); */
         
      
         document.review.submit();  
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
</head>
<body>
<div id="all-container">

<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>
<div id="all-content">
<h1>상품 후기 작성</h1>
   <form action="goreview" id="aaaa" name="review" method="post" enctype="multipart/form-data">
   <br>
       <table border=0 align="center">
        <tr>
           <td>평점&nbsp;</td><td width="350"><div id="star"></div></td>
           <td>
             <span id="displayStarRating">5</span>
           </td>
        </tr>
       </table> 
       <br><br>
            <div id="all-writepost">
            <input class="textborder1" type="text" name="title" placeholder="제목을 입력해주세요(10~30글자)">
            <br>
            <hr>
            <br> 
            <textarea class="textborder2" id = "k" name="naeyong" placeholder="내용을 입력해주세요(10~30글자)"></textarea>
            </div>
            <table align="center">
            <tr>
            <td><div class = "file_input"><label>File Upload<input type="file" name="file" multiple="multiple" onchange="aa();"></label><input type="text" readonly="readonly" value="${pvo.original_fname }" title="File Route"></div></td>
            <td><input class="button" type="button" onclick="go();" value="리뷰작성"></td>
            </tr>
            </table>
      
      <input type="hidden" name="star1" value="">
      <input type="hidden" name="r_sangpum" value="${r_sangpum }">
      <input type="hidden" name="r_size" value="${r_size }">
      <input type="hidden" name="r_color" value="${r_color }">
      <input type="hidden" name="orderno" value="${orderno }">
      <!-- <input type="text" name="naeyong" value="감자국에는 고기가 들어간다"> -->
      
   </form>
   </div>
   </div>
   <!-- <form action="upload" method="post" enctype="multipart/form-data">
   <input type="file" name="file">
   <input type="text" name="test">
   <input type="submit" value="전송">
   </form> -->
</body>
</html>