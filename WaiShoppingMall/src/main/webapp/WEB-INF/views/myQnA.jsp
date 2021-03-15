<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <%  
    response.setHeader("Cache-Control","no-store");  
    response.setHeader("Pragma","no-cache");  
    response.setDateHeader("Expires",0);  
 
    if (request.getProtocol().equals("HTTP/1.1")) {
        response.setHeader("Cache-Control", "no-cache");
    }
%>
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
function viewcon(number1,page1)
{      
   var num = { number: number1 , page: page1};

   $.ajax(
   {   //$.ajax() //$.get . $.post
      url : "contents3" ,   //open(method,url,async)
      type : "POST" , 
      data :  JSON.stringify(num) ,   //hello.jsp?name=hong&na2=35
      dataType : "json" , //reponseText, responseXML   //open
      contentType : "application/json; charset=UTF-8" ,
      success : function(Data)   //json //4,200
      {
/*             alert("함수 호출 전"); */
         list(Data);

/*             alert("성공"); */
         
/*             $.each(Data,function()
         {
            $('#main_list').append("<tr><td>" + this.number1 + "</td><td>" + this.content1 + "</td></tr>");
         }) */
         

/*          
         var html = "";
         html += "<table border=2 id='coTb' class='mytable'>";
         html += "<tr><th>ID</th></tr>";
         
         $.each(Data.content1,function(index,element)
         {
            html += "<tr><td>"+Data.content1+"</td></tr>";
         });
         html += "</table>";
         $("#co").append(html); */
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
   
   /* var user = "${sessionScope.user}"; */

   content += "<table class='table' id='main_list' style='table-layout: auto; margin: auto; width: 80%; text-align: center;'>";
   content += "<tr style= 'background-color: #d3d3d3'><th>번호</th><th>분류</th><th>제목</th><th>작성자</th><th>작성일</th><th>답변 여부</th></tr>"
   
   for(i=0;i<Data.list2.length;i++)
   {         
      resultVO = Data.list2[i];
      
   /*    alert(typeof(resultVO.memberid));
      alert(typeof(user)); */
      
/*          if(resultVO.memberid == user)
         alert("맞아");
      else if(resultVO.member != user)
         alert("아냐"); */
      /* alert("나도 " + "${sessionScope.user}"); */
      
      content += "<tr>";
      content += "<td>"+resultVO.qnano+"</td>";
      content += "<td>"+resultVO.qnakind+"</td>";
      if(resultVO.qnalock == 0)
         content += "<td><a href='javascript:void(0);' onclick='viewcon(" + resultVO.qnano + "," + Data.page + ");'>" + resultVO.qnasubject + "</a></td>";
      else
         content += "<td><a href='javascript:void(0);' onclick='viewcon(" + resultVO.qnano + "," + Data.page + ");'>" + resultVO.qnasubject + "&nbsp;<img style='width:15px;height:15px;' src='${pageContext.request.contextPath }/resources/img/lock.png'></a></td>";   
      
      
      content += "<td>"+resultVO.memberid+"</td>";
      content += "<td>"+resultVO.qnadate+"</td>";
      if(resultVO.qnaanswer == 0)
         content += "<td><b>준비 중</b></td>";
      else
         content += "<td><b style='color:red;'>답변 완료</b></td>";
      content += "</tr>";
      
      if(resultVO.qnano == Data.number1)
      {
      content += "<tr><td colspan=6><pre>"  + Data.content1 + "</pre></td></tr>";
      if(resultVO.qnaanswer == 1)
      content += "<tr><td colspan=6><b>[관리자]</b>&nbsp;" + Data.qnaanswercontent + "</td></tr>";

      content += "<tr><td colspan=6><form action='goqnainsert' name='qnamodi'><input type='hidden' name='number1' value=" + resultVO.qnano + "></form><form action='qnadel' name='qnadel'><input type='hidden' name='number1' value=" + resultVO.qnano + "></form>";
      content += "<input class='button' type='button' value='수정' onclick='qnamodify();'>&nbsp;&nbsp;<input class='button' type='button' value='삭제' onclick='qnadele();'></td></tr>";
         
         
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
}

function qnamodify()
{
   qnamodi.submit();
}   

function paging(page1 )
{      
   var num = { page: page1 };
   
   $.ajax(
   {   
      url : "myqnapage" ,   
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

   content += "<table class='table' id='main_list' style='table-layout: auto; margin: auto; width: 80%; text-align: center;'>";
   content += "<tr style= 'background-color: #d3d3d3'><th>번호</th><th>분류</th><th>제목</th><th>작성자</th><th>작성일</th><th>답변여부</th></tr>"
   
   for(i=0;i<Data.list2.length;i++)
   {         
      resultVO = Data.list2[i];
      
      content += "<tr>";
      content += "<td>"+resultVO.qnano+"</td>";
      content += "<td>"+resultVO.qnakind+"</td>";
      if(resultVO.qnalock == 0)
         content += "<td><a href='javascript:void(0);' onclick='viewcon(" + resultVO.qnano + "," + Data.page + ");'>" + resultVO.qnasubject + "</a></td>";
      else
         content += "<td><a href='javascript:void(0);' onclick='viewcon(" + resultVO.qnano + "," + Data.page + ");'>" + resultVO.qnasubject + "&nbsp;<img style='width:15px;height:15px;' src='${pageContext.request.contextPath }/resources/img/lock.png'></a></td>";   
      
      
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
</script>

<body>
   <div class="StyledLayout">
        <div class="Header">
      <jsp:include page="Header.jsp"></jsp:include>
     </div>
      <div class="grid threeGrid">
      <div class="grid__item">
         <ul>
            <li class="fontello">
               <a href="myCart">&#xe800<br>
               <div style="font-size: 22px; font-family: 'Merriweather', serif;">MyCart</div></a>
            </li>
         </ul>
      </div>
      <div class="grid__item">
         <nav class="header__nav">
            <h3 style="text-align: left">My Q&A</h3>
            <hr>
         </nav>
            <article class="grid__article">
               <c:if test= "${check == 0}">
                  <div class="warning">
                     <ul>
                        <li class="fontello">&#xe815</li>
                        <li style="font-size: 30px; margin: 0;">Q&A 내역이 없습니다.<br>Q&A를 작성해주세요</li>
                     </ul>
                  </div>
               </c:if>
               <c:if test= "${check != 0}">
                  <table class= "table" id="main_list" style="table-layout: auto; margin: auto; width: 80%; text-align: center;">
                     <tr style="background-color: #d3d3d3">
                        <th>번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>답변 여부</th>
                     </tr>
                     <c:forEach var="imsi" items="${list1}">
                        <tr>
                           <td>${imsi.qnano }</td>
                           <td>${imsi.qnakind }</td>
                           <c:if test="${imsi.qnalock == 0}">
                              <td><a href="javascript:void(0);" onclick="viewcon(${imsi.qnano } , ${page } );">${imsi.qnasubject }</a></td>
                           </c:if>
                           <c:if test="${imsi.qnalock == 1}">
                              <td><a href="javascript:void(0);" onclick="viewcon(${imsi.qnano } , ${page } );">${imsi.qnasubject }&nbsp;<img style="width:15px;height:15px;" src="${pageContext.request.contextPath }/resources/img/lock.png"></a></td>
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
                  <div id="co"></div>
                  
                  <div class="all-paging2">
                  <c:forEach var="i" begin="1" end="${totalnum2}" step="1">
                          <li><a href="javascript:void(0);" class="pagebutton" onclick="paging(${i})">${i }</a></li>
                    </c:forEach>
                    </div>
               </c:if>
               
               
            </article>
         </div>
      <div class="grid__item">
         <ul>
            <li class="fontello">
               <a href="myProfile">&#xf2be<br>
               <div style="font-size: 22px; font-family: 'Merriweather', serif;">My Profile</div></a>
            </li>
         </ul>
      </div>
      <div class="grid__item">
      
      </div>
   </div>

   <script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
   
</body>
</html>