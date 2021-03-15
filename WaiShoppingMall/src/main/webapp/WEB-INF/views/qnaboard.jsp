<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 게시판</title>
<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<script>
   function viewcon(number1,page1,productcode1)
   {      
      var num = { number: number1 , page: page1 , productcode: productcode1 };
   
      $.ajax(
      {   
         url : "contents1" ,   
         type : "POST" , 
         data :  JSON.stringify(num) ,   
         dataType : "json" , 
         contentType : "application/json; charset=UTF-8" ,
         success : function(Data)   
         {          
            list(Data);
         } ,
         error : function(request,error,xhr1 , status)
         {
            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
         }
      });
   }
    
   function list(Data)
   {
      var resultVO = [];
      var content = "";
      
      var temp = "\""+Data.productcode+"\"";

      content += "<table class='table' id='main_list'>";
      content += "<tr><th>번호</th><th>분류</th><th>제목</th><th>작성자</th><th>작성일</th><th>답변여부</th></tr>"
      
      for(i=0;i<Data.list2.length;i++)
      {         
         resultVO = Data.list2[i];
         
         content += "<tr>";
         content += "<td>"+resultVO.qnano+"</td>";
         content += "<td>"+resultVO.qnakind+"</td>";
         if(resultVO.qnalock == 0)
            content += "<td><a href='javascript:void(0);' onclick='viewcon(" + resultVO.qnano + "," + Data.page + "," + temp + ");'>" + resultVO.qnasubject + "</a></td>";
         else
            content += "<td><a href='javascript:void(0);' onclick='viewcon(" + resultVO.qnano + "," + Data.page + "," + temp + ");'>" + resultVO.qnasubject + "&nbsp;<img style='width:15px;height:15px;' src='${pageContext.request.contextPath }/resources/img/lock.png'></a></td>";   
         
         
         content += "<td>"+resultVO.memberid+"</td>";
         content += "<td>"+resultVO.qnadate+"</td>";
         if(resultVO.qnaanswer == 0)
            content += "<td><b>준비 중</b></td>";
         else
            content += "<td><b style='color:red;'>답변 완료</a></td>";
         content += "</tr>";
         
         if(resultVO.qnano == Data.number1)
         {
            if(resultVO.qnalock==0)
            {
               content += "<tr><td colspan=6><pre>" + Data.content1 + "</pre></td></tr>";
               if(resultVO.qnaanswer == 1)
                  content += "<tr><td colspan=6><b>[관리자]</b>&nbsp;" + Data.qnaanswercontent + "</td></tr>";
            }
            else
            {
               if((resultVO.memberid == "${sessionScope.loginid}") || (1 == "${sessionScope.admin}"))
               {
                  content += "<tr><td colspan=6><pre>"  + Data.content1 + "</pre></td></tr>";
                  if(resultVO.qnaanswer == 1)
                     content += "<tr><td colspan=6><b>[관리자]</b>&nbsp;" + Data.qnaanswercontent + "</td></tr>";
               }
               else
               {
                  content += "<tr><td colspan=6><i>비밀글 입니다</i></td></tr>";
               }
            }
            
            if(1 == "${sessionScope.admin}" && resultVO.qnaanswer == 0)
            {
               content += "<tr><td colspan=6><form action='goqnaans' name='qnaanscont'><input type='hidden' name='number1' value=" + resultVO.qnano + "></form><form action='qnadel' name='qnadel'><input type='hidden' name='number1' value=" + resultVO.qnano + "></form>";
               content += "<input class='button' type='button' value='답변' onclick='qnaanscon();'>&nbsp;&nbsp;<input class='button' type='button' value='삭제' onclick='qnadele();'></td></tr>";
            }
            
         }
         
            
      }
      
      $("#main_list").remove();
      $("#co").append(content);
   }    
   
   function qnadele()
   {
      var con = confirm("정말로 삭제하시겠습니까?");
      
      if(con==true)
      {
         qnadel.submit();
         alert("삭제되었습니다");
      }   
/*       
      var num = { number: number1 };
      
      $.ajax(
      {   //$.ajax() //$.get . $.post
         url : "qnadel" ,   //open(method,url,async)
         type : "POST" , 
         data :  JSON.stringify(num) ,   //hello.jsp?name=hong&na2=35
         dataType : "json" , //reponseText, responseXML   //open
         contentType : "application/json; charset=UTF-8" ,
         success : function(Data)   //json //4,200
         {   
            alert(Data);
         } ,
         error : function(request,error,xhr1 , status)
         {
            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
         }
      }); */
      
      
 
   }
   
   function qnaanscon()
   {
      window.open("goqnaans","popupname","width=400, height=300, left=100, top=50")
      document.qnaanscont.target = "popupname";
      document.qnaanscont.method = "get";
      document.qnaanscont.submit();
   }   
   
   function paging(page1 , productcode1)
   {      
      var num = { page: page1 , productcode: productcode1 };
      
      $.ajax(
      {   
         url : "qnapage" ,   
         type : "POST" , 
         data :  JSON.stringify(num) ,   
         dataType : "json" , 
         contentType : "application/json; charset=UTF-8" ,
         success : function(Data)   
         {            
            list2(Data);
         } ,
         error : function(request,error,xhr1 , status)
         {
            alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
         }
      });
   }
   
   function list2(Data)
   {
      var resultVO = [];
      var content = "";
      var temp = "\""+Data.productcode+"\"";

      content += "<table class='table' id='main_list'>";
      content += "<tr><th>번호</th><th>분류</th><th>제목</th><th>작성자</th><th>작성일</th><th>답변여부</th></tr>"
      
      for(i=0;i<Data.list2.length;i++)
      {         
         resultVO = Data.list2[i];
         
         content += "<tr>";
         content += "<td>"+resultVO.qnano+"</td>";
         content += "<td>"+resultVO.qnakind+"</td>";
         if(resultVO.qnalock == 0)
            content += "<td><a href='javascript:void(0);' onclick='viewcon(" + resultVO.qnano + "," + Data.page + "," + temp + ");'>" + resultVO.qnasubject + "</a></td>";
         else
            content += "<td><a href='javascript:void(0);' onclick='viewcon(" + resultVO.qnano + "," + Data.page + "," + temp + ");'>" + resultVO.qnasubject + "&nbsp;<img style='width:15px;height:15px;' src='${pageContext.request.contextPath }/resources/img/lock.png'></a></td>";   
         
         
         content += "<td>"+resultVO.memberid+"</td>";
         content += "<td>"+resultVO.qnadate+"</td>";
         if(resultVO.qnaanswer == 0)
            content += "<td><b>준비 중</b></td>";
         else
            content += "<td><b style='color:red;'>답변 완료</b></td>";
         content += "</tr>";   
      }
      
      $("#main_list").remove();
      $("#co").append(content);
   }
   
   function gogo()
   {
      var sess = "<%=(String)session.getAttribute("loginid")%>";
      
      if(sess == "null")
      {
         alert("로그인이 필요합니다.");
         var result = confirm("로그인 페이지로 이동하시겠습니까?");
         
         if(result)
         {
            location.href='gologin';
         }
      }
      else
      {
    	  location.href='goqnainsert?productcode=${productcode}&productsubject=${productsubject}';
      }
      
   }
</script>
</head>
<body>
   <table class="table" id = "main_list">
      <tr>
         <th>번호</th>
         <th>분류</th>
         <th>제목</th>
         <th>작성자</th>
         <th>작성일</th>
         <th>답변여부</th>
      </tr>
      <c:forEach var="imsi" items="${list1 }">
         <tr>
            <td>${imsi.qnano }</td>
            <td>${imsi.qnakind }</td>
            <c:if test="${imsi.qnalock == 0}">
               <td><a href="javascript:void(0);" onclick="viewcon(${imsi.qnano } , ${page } , '${imsi.productcode }');">${imsi.qnasubject }</a></td>
            </c:if>
            <c:if test="${imsi.qnalock == 1}">
               <td><a href="javascript:void(0);" onclick="viewcon(${imsi.qnano } , ${page } , '${imsi.productcode }');">${imsi.qnasubject }&nbsp;<img style="width:15px;height:15px;" src="${pageContext.request.contextPath }/resources/img/lock.png"></a></td>
            </c:if>
            <td>${imsi.memberid }</td>
            <td>${imsi.qnadate }</td>
            <c:if test="${imsi.qnaanswer == 0}">
               <td><b>준비 중</b></td>
            </c:if>
            <c:if test="${imsi.qnaanswer == 1}">
               <td><b style="color:red;">답변 완료</b></td>
            </c:if>
         </tr>
      </c:forEach>
   </table>
   <div id = "co">
   </div>
   <c:if test="${sessionScope.user != 'admin'}">
      <table align="right">
         <tr>
            <td colspan = 6><input class="button" type="button" value="작성하기" onclick="gogo();"></td>
         </tr>
      </table>
   </c:if>
   <br><br><br>
   <div id="all-paging">
   <c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
        <li>
           <a href="javascript:void(0);" onclick="paging(${i } , '${productcode }')">${i }</a>
        </li>
   </c:forEach>
   </div>
</body>
</html>