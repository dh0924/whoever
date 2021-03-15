<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_slide.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_writepost.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/theme_1/js/wai_jquery.js"></script>

</head>
<body>
   <div id="all-container">
    <div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>
      <div id="all-content">
      <!-- <div id="all-board"> -->
      <div id="all-writepost">
         <br>
         <h1>공지사항</h1><br>
         <form id="noticeinsert" action="noticeboardinsert">
            <c:if test="${noticesubject != null}">
               <input type="text" class="textborder1" name="noticesubject" value="${noticesubject }" required>
               <input type="hidden" name="edit" value="1">
               <input type="hidden" name="noticeno" value="${noticeno }">
            </c:if>
            <c:if test="${noticesubject == null}">
               <input type="text" class="textborder1" name="noticesubject" placeholder="제목을 입력해주세요" autofocus required><br>
            </c:if>
            <br>
            <hr>
            <br>
            <textarea class="textborder2" name="noticecontents" placeholder="내용을 입력해주세요" style="font-size: 15px;" required><c:if test="${noticecontents != null }">${noticecontents }</c:if></textarea>
            <input type="hidden" name="page" value="1">  
         </form>
         </div>
         
         <table style="width: 750px;" align="center">
         
            <c:if test="${noticeno != null }">
               <tr>
                  <td align="right"><input class="button" type="button" value="등록" onclick="$('#noticeinsert').submit();">
                  <input class="button" type="button" value="취소" onclick="location.href='noticeview?noticeno=${noticeno}'"></td>
               </tr>
            </c:if>
            
            <c:if test="${noticeno == null }">
               <tr>
                  <td>
                  	<input class="button" type="button" value="등록" onclick="$('#noticeinsert').submit();"> 
                  	<input class="button" type="button" value="취소" onclick="location.href='gonoticeboard?page=1'">
                  </td>
               </tr>
            </c:if>
         </table>

      
      </div>
   </div>
  
   
</body>
</html>