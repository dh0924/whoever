<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<title>Insert title here</title>

<style> 
/* 마스크 뛰우기 */
#mask {  
    position:absolute;  
    z-index:9000;  
    background-color:#000;  
    display:none;  
    left:0;
    top:0; 
	
 

} 
.window{
	display: none;
    position:absolute;  
   	left:50%;
    top:50%;
    transform:translate(-50%, -50%);
    margin: 15% auto;
    width:550px;
    height:550px;
    z-index:10000;
   /*  background-color:#ffffff; */
}
 .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
 
/*   .right {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
           
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
	.left {
            color: #aaa;
            float: left;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }        
 */
</style>

<script>
function like_func(number1,user1){
	
	  var num = { number: number1, user: user1 };
	  
	  $.ajax({
	    url: "check_like",
	    type: "POST",
	    dataType: "json",
	    data: JSON.stringify(num) ,
	    contentType : "application/json; charset=UTF-8" ,
	    success: function(data) {
	      var msg = '';
	      var like_img = '';
	      msg += data.msg;
	      alert(msg);
	     
	      if(data.like_check == 1){
	        like_img = "<img src=<spring:url value='/C:/upload/test/positive-c.png'/> />";
	      } else {
	        like_img = "<img src=<spring:url value='/C:/upload/test/positive-b.png'/> />";
	      }      

	      $('#'+number1+'like_img').html(like_img);
	      $('#'+number1+'like_cnt').html(data.like_cnt);
	      $('#like_check').html(data.like_check);
	    },
	    error: function(request, status, error){
	      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	  });
	}
	
function dislike_func(number1,user1){
	
	  var num = { number: number1 , user: user1};
	  
	  $.ajax({
	    url: "check_dislike",
	    type: "POST",
	    dataType: "json",
	    data: JSON.stringify(num) ,
	    contentType : "application/json; charset=UTF-8" ,
	    success: function(data) {
	      var msg = '';
	      var dislike_img = '';
	      msg += data.msg;
	      alert(msg);
	      if(data.like_check == -1){
	        dislike_img = "<img src=<spring:url value='/C:/upload/test/negative-c.png'/> />";
	      } else {
	        dislike_img = "<img src=<spring:url value='/C:/upload/test/negative-b.png'/> />";
	      }
	      $('#'+number1+'dislike_img').html(dislike_img);
	      $('#'+number1+'dislike_cnt').html(data.dislike_cnt);
	      $('#like_check').html(data.like_check);
	    },
	    error: function(request, status, error){
	      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	  });
	}
	
	
function reviewarray(page1, r_sangpum1, user1 ,number1)
{		
	var num = {page:page1 , r_sangpum : r_sangpum1 , user : user1 ,  choice:number1};
	
	$.ajax(
	{	
		url : "reviewpage" ,	
		type : "POST" , 
		data :  JSON.stringify(num) ,	
		dataType : "json" , 
		contentType : "application/json; charset=UTF-8" ,
		success : function(Data)	
		{		
			listreview(Data);
		} ,
		error : function(request,error,xhr1 , status)
		{
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
}	
	

        
function pagingreview(page1 , r_sangpum1 , user1, choice1)
{		
	var num = { page: page1 , r_sangpum: r_sangpum1 , user: user1, choice:choice1};
	
	$.ajax(
	{	
		url : "reviewpage" ,	
		type : "POST" , 
		data :  JSON.stringify(num) ,	
		dataType : "json" , 
		contentType : "application/json; charset=UTF-8" ,
		success : function(Data)	
		{		
			listreview(Data);
		} ,
		error : function(request,error,xhr1 , status)
		{
			alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	});
}



function listreview(Data)
{
	var ResultVO = [];
	var pagetext = "";
	var r_sangpum = "\""+Data.r_sangpum+"\"";
	var user = "\""+Data.user+"\"";

	pagetext += "<table style='text-align:left;' class='table' id='main_review'>";
	for(i=0;i<Data.r_list.length;i++)
	{			
		ResultVO = Data.r_list[i];
		
		
		pagetext += "<tr>";
		if(ResultVO.r_grade == 'gold'){
		pagetext += "<td><b><a style='color:#ffaa00;'>"+ResultVO.r_grade+"</a></b></td>";
		}
		if(ResultVO.r_grade == 'bronze'){
			pagetext += "<td><b><a style='color:#cc8e35;'>"+ResultVO.r_grade+"</a></b></td>";
			}
		if(ResultVO.r_grade == 'silver'){
			pagetext += "<td><b><a style='color:#bdc3c7;'>"+ResultVO.r_grade+"</a></b></td>";
			}
		pagetext += "<td>"+ResultVO.r_writer+"</td>";
		pagetext += "<td>"+ResultVO.r_date+"</td>";
		pagetext += "<td><div id=star data-score="+ResultVO.r_star+"></div></td>";
		if(Data.user != '123' && ResultVO.r_check == 1){
			pagetext += "<td><a href='javascript: like_func("+ResultVO.r_num+","+user+");'>";
			pagetext += "<span id="+ResultVO.r_num+"like_img><img src=<spring:url value='/C:/upload/test/positive-c.png'/> /></span></a>";
			pagetext += "<span id="+ResultVO.r_num+"like_cnt>"+ResultVO.r_good+"</span></td>";
			pagetext += "<td><a href='javascript: dislike_func("+ResultVO.r_num+","+user+");'>";
			pagetext += "<span id="+ResultVO.r_num+"dislike_img><img src=<spring:url value='/C:/upload/test/negative-b.png'/> /></span></a>";
			pagetext += "<span id="+ResultVO.r_num+"dislike_cnt>"+ResultVO.r_bad+"</span></td>";
		}
		else if(Data.user != '123' && ResultVO.r_check == -1){
			pagetext += "<td><a href='javascript: like_func("+ResultVO.r_num+","+user+");'>";
			pagetext += "<span id="+ResultVO.r_num+"like_img><img src=<spring:url value='/C:/upload/test/positive-b.png'/> /></span></a>";
			pagetext += "<span id="+ResultVO.r_num+"like_cnt>"+ResultVO.r_good+"</span></td>";
			pagetext += "<td><a href='javascript: dislike_func("+ResultVO.r_num+","+user+");'>";
			pagetext += "<span id="+ResultVO.r_num+"dislike_img><img src=<spring:url value='/C:/upload/test/negative-c.png'/> /></span></a>";
			pagetext += "<span id="+ResultVO.r_num+"dislike_cnt>"+ResultVO.r_bad+"</span></td>";
		}
		else if(Data.user != '123' && ResultVO.r_check == 0){
			pagetext += "<td><a href='javascript: like_func("+ResultVO.r_num+","+user+");'>";
			pagetext += "<span id="+ResultVO.r_num+"like_img><img src=<spring:url value='/C:/upload/test/positive-b.png'/> /></span></a>";
			pagetext += "<span id="+ResultVO.r_num+"like_cnt>"+ResultVO.r_good+"</span></td>";
			pagetext += "<td><a href='javascript: dislike_func("+ResultVO.r_num+","+user+");'>";
			pagetext += "<span id="+ResultVO.r_num+"dislike_img><img src=<spring:url value='/C:/upload/test/negative-b.png'/> /></span></a>";
			pagetext += "<span id="+ResultVO.r_num+"dislike_cnt>"+ResultVO.r_bad+"</span></td>";
		}
		else{
			pagetext += "<td><a href='javascript: login_need();'><img src=\"<spring:url value='/C:/upload/test/positive-b.png'/>\" /></a>";
			pagetext += ResultVO.r_good+"</td>";
			pagetext += "<td><a href='javascript: login_need();'><img src=\"<spring:url value='/C:/upload/test/negative-b.png'/>\" /></a>";
			pagetext += ResultVO.r_bad+"</td>";
		}
			
		pagetext += "</tr><tr><td style='text-align:left;' colspan=6>"+"<b>"+ResultVO.r_sangpum+"-"+ResultVO.r_size+"</b>"+"&nbsp;구매</td></tr>";
		pagetext += "<tr><td style='text-align:left;' colspan=6>"+"<b>"+ResultVO.r_title+"</b>"+"</td></tr>";
		pagetext += "<tr><td style='text-align:left;' colspan=6>"+ResultVO.r_text+""+"<br><br>";
		if(ResultVO.original_fname != "noFile")
			pagetext += "<img style='width:200px;height:200px;' src='<spring:url value='/C:/upload/test/"+ResultVO.stored_fname+"'/>'/><br><br><br><br></td></tr>";
	}
	
	pagetext += "</table>";
	pagetext += "<div id= 'main_paging' class='all-paging2'>"
	for(i=1;i<=Data.totalnum2;i++){
		pagetext += "<li><a href='javascript:void(0);' onclick='pagingreview("+ i +" , "+ r_sangpum +" , "+ user +", "+Data.choice+")'>"+i+"</a></li>"
	}
	pagetext += "</div>"

	$("#main_review").remove();
	$("#sub_review").append(pagetext);
	$("#main_paging").remove();
	
	
	
	$(function() 
	        {
	            aa('div#star').raty(
	            {
	             score: function() 
	              {
	                  return $(this).attr('data-score');
	              } ,
	                path : "${pageContext.request.contextPath}/resources/img" ,
	                width : 350 ,
	                readOnly  : true
	            });
	        });
}

$(function() 
        {
            aa('div#star').raty(
            {
              score: function() 
              {
                  return $(this).attr('data-score');
              } ,
                path : "${pageContext.request.contextPath}/resources/img" ,
                width : 350 ,
                readOnly  : true
            });
        });

function login_need()
{
	alert("로그인이 필요합니다.");
	var result = confirm("로그인 페이지로 이동하시겠습니까?");
      
	if(result)
	{
		location.href='gologin';
	}
}

function wrapWindowByMask(image){
	   
    var maskHeight = $(document).height();  
    var maskWidth = $(window).width(); 
    $("#mask").css({"width":maskWidth,"height":maskHeight});  

    $("#mask").fadeIn(0);      
    $("#mask").fadeTo("slow",0.6);
		$("#output").attr('src',image);
    $(".window").show();

}

$(document).ready(function(){
    $(".openMask").click(function(e){
        e.preventDefault();
        var image = $('#input').attr('src');
        wrapWindowByMask(image);
    });  

    $("#mask").click(function () {  
        $(this).hide();  
        $(".window").hide();  

    });      

});

	function o(s)
	{

		 var image = $('#input'+s).attr('src');
		 wrapWindowByMask(image);
		   

		    $(".window .close").click(function (e) {  
		        e.preventDefault();  
		        $("#mask, .window").hide();  
		    });       

		    $("#mask").click(function () {  
		        $(this).hide();  
		        $(".window").hide();  

		    });      

		
	}

	function right_click2(){

		var arrimage = ${picarray2}; 
    	var j = arrimage.length;
    	var imgSource = $('#output').attr('src');

    	var i=0;
    	 while(true){
    		if(imgSource != (arrimage[i])){
    			i++
    		}
    		else{
    			i++;
    			if(i > j-1){
    				i=0;
    			}
    			break;
    		}
    	}
    	 $('#output').attr('src',arrimage[i]);
	  
	}
function left_click2(productcode1){

	 var arrimage = ${picarray2}; 
	
	var j = arrimage.length;

	
	var imgSource = $('#output').attr('src');

	var i=0;
	 while(true){
		if(imgSource != (arrimage[i])){
			i++
		}
		else{
			i--;
			if(i < 0){
				i=j-1;
			}
			break;
		}
	}
	 $('#output').attr('src',arrimage[i]);
	}


	</script>
	
</head>
<body>
<div id ="wrap"> 
        <div id = "container">  
            <div id="mask"></div>
            <div class="window">
            <%-- <div style="float:left;cursor:pointer;"onclick="left_click2('${productcode}')">왼쪽</div>
          
                    <div style="float:right;cursor:pointer;" onclick="right_click2('${productcode}')">오른쪽</div> --%>
                      <span class="close">&times;</span> 
                      <table>
                      <tr>
                 <td><img style="width:30px;height:30px;cursor:pointer;" onclick="left_click2('${productcode}')" src=<spring:url value='/C:/upload/test/left.png'/>/></td>
                 <td><img style="width:500px;height:500px;"id="output" name="targetimg" src=<spring:url value='/C:/upload/test/negative-c.png'/> /></td>
                <td><img style="width:30px;height:30px;cursor:pointer;" onclick="right_click2('${productcode}')" src=<spring:url value='/C:/upload/test/right.png'/>/></td>
                </tr>
                </table>
            </div>
        </div>
    </div>
    <!-- ====================================================== -->
	<table border="0">
	<tr>
	<th><table border="0">
		<tr>
			<td style="border-radius:10px;background-color:black;color:white;font-size:40px;text-align:center;"rowspan=3><b>${avg }</b></td><td>5star - ${five }개</td>
		</tr>
		<tr>
			<td>4star - ${four }개</td>
		</tr>
		<tr>
			<td>3star - ${three }개</td>
		</tr>
		<tr>
			<td style="text-align:center;"><div data-score="${avg }" id=star></div></td><td>2star - ${two }개</td>
		</tr>
		<tr>
			<td style="text-align:center;">총 <b>${total }</b>개의 리뷰</td><td>1star - ${one }개</td>
		</tr>
	</table></th>
	<th><c:set var="i" value="0"/>
	<c:set var="j" value="4"/>
	<table border="0">
	<c:forEach items="${pic_list }" var="imsi3">
	<c:if test="${i+j < 12 }">
	<c:if test="${i%j == 0 }">
	<tr>
	</c:if>
	<td>
	<a href="#" onclick="o('${imsi3.r_num }');">
	<img width="70" height="70" id="input${imsi3.r_num }" src="<spring:url value='/C:/upload/test/${imsi3.stored_fname}'/>"/></a>
	</td>
	<c:if test="${i%j == j-1 }">
	</tr>
	</c:if>
	<c:set var="i" value="${i+1 }"/>
	</c:if>
	</c:forEach>
	</table></th>
	</tr>
	
	
	</table>
	
<br><br>
	<table align="left">
		<tr>
		
			<td id="detail"><%-- <input type="button" value="최신순" onclick="reviewarray(${page } , '${productcode }' , '${user }', 0)"> 
							<input type="button" value="인기순" onclick="reviewarray(${page } , '${productcode }' , '${user }', 1)"> 
							<input type="button" value="평점높은순" onclick="reviewarray(${page } ,'${productcode }' , '${user }', 2)"> --%>
							<a style="color:black; text-decoration:none;" href="javascript:void(0);" onclick="reviewarray(${page } , '${r_sangpum }' , '${user }', 0)">최신순</a>&nbsp;|
							<a style="color:black; text-decoration:none;" href="javascript:void(0);" onclick="reviewarray(${page } , '${r_sangpum }' , '${user }', 1)">추천순</a>&nbsp;|
							<a style="color:black; text-decoration:none;" href="javascript:void(0);" onclick="reviewarray(${page } , '${r_sangpum }' , '${user }', 2)">평점순</a>			
			</td>
		</tr>
	</table>
	<br>
	<hr>
	
	<div id="all-content">
<table style="text-align:left;" class="table" id="main_review">
		<c:forEach var="imsi" items="${r_list }">
		
			<tr>
				<c:if test="${imsi.r_grade eq 'bronze' }">
				<td><b><a style="color:#cc8e35;">${imsi.r_grade }</a></b></td>
				</c:if>
				<c:if test="${imsi.r_grade eq 'silver' }">
				<td><b><a style="color:#bdc3c7;">${imsi.r_grade }</a></b></td>
				</c:if>
				<c:if test="${imsi.r_grade eq 'gold' }">
				<td><b><a style="color:#ffaa00;">${imsi.r_grade }</a></b></td>
				</c:if>
				<td>${imsi.r_writer }</td>
				<td>${imsi.r_date }</td>
				<td><div id='imsi'><div data-score="${imsi.r_star }" id=star></div></div></td>
				<c:choose>
  					<c:when test="${user ne '123' && imsi.r_check eq 1}">
    					<td>
    						<a href="javascript: like_func(${imsi.r_num},'${user }');">
    						<span id="${imsi.r_num}like_img"><img src="<spring:url value='/C:/upload/test/positive-c.png'/>"/></span></a>
    						<span id="${imsi.r_num}like_cnt">${imsi.r_good }</span>
    					</td>
    					<td>
    						<a href="javascript: dislike_func(${imsi.r_num},'${user }');">
    						<span id="${imsi.r_num}dislike_img"><img src="<spring:url value='/C:/upload/test/negative-b.png'/>"/></span></a>
    						<span id="${imsi.r_num}dislike_cnt">${imsi.r_bad }</span>
    					</td>
    				</c:when>
    				<c:when test="${user ne '123' && imsi.r_check eq -1 }">
    					<td>
    						<a href="javascript: like_func(${imsi.r_num},'${user }');">
    						<span id="${imsi.r_num}like_img"><img src="<spring:url value='/C:/upload/test/positive-b.png'/>"/></span></a>
    						<span id="${imsi.r_num}like_cnt">${imsi.r_good }</span>
    					</td>
    					<td>
    						<a href="javascript: dislike_func(${imsi.r_num},'${user }');">
    						<span id="${imsi.r_num}dislike_img"><img src="<spring:url value='/C:/upload/test/negative-c.png'/>"/></span></a>
    						<span id="${imsi.r_num}dislike_cnt">${imsi.r_bad }</span>
    					</td>
    				</c:when>
    				<c:when test="${user ne '123' && imsi.r_check eq 0 }">
    					<td>
    						<a href="javascript: like_func(${imsi.r_num},'${user }');">
    						<span id="${imsi.r_num}like_img"><img src="<spring:url value='/C:/upload/test/positive-b.png'/>"/></span></a>
    						<span id="${imsi.r_num}like_cnt">${imsi.r_good }</span>
    					</td>
    					<td>
    						<a href="javascript: dislike_func(${imsi.r_num},'${user }');">
    						<span id="${imsi.r_num}dislike_img"><img src="<spring:url value='/C:/upload/test/negative-b.png'/>"/></span></a>
    						<span id="${imsi.r_num}dislike_cnt">${imsi.r_bad }</span>
    					</td>
    				</c:when>
    				<c:otherwise>
    					<td>
    						<a href='javascript: login_need();'><img src="<spring:url value='/C:/upload/test/positive-b.png'/>" /></a>
    						${imsi.r_good }
    					</td>
    					<td>
    						<a href='javascript: login_need();'><img src="<spring:url value='/C:/upload/test/negative-b.png'/>" /></a>
    						${imsi.r_bad }
    					</td>
    				</c:otherwise>
    			</c:choose>
			</tr>
			<tr>
				<td style="text-align:left;" colspan=6><b>${imsi.r_sangpum }-${imsi.r_size }</b> 구매</td>
			</tr>
			<tr>
				<td style="text-align:left;" colspan=6><b>${imsi.r_title }</b></td>
			</tr>
			<tr>
				<td style="text-align:left;" colspan=6>${imsi.r_text }<br><br>
			
			<c:if test="${imsi.original_fname != 'noFile'}">
				<img style="width:200px;height:200px;"src="<spring:url value='/C:/upload/test/${imsi.stored_fname }'/>"/><br><br><br><br></td>
			</c:if>
			</tr>
		
			
		</c:forEach>
	</table>
	<div id = "sub_review">
	</div>
	<br><br><br>
	<div id= "main_paging" class="all-paging2">
		<c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
  			<li>
  				<a href="javascript:void(0);" onclick="pagingreview(${i } , '${r_sangpum }' , '${user }', ${choice })">${i }</a>
  			</li>
		</c:forEach>
	</div>
	</div>
	

</body>
</html>