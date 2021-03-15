<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review 게시판</title>
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_paging.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/theme_1/js/jquery.raty.js"></script>

<script>

	function reviewDel(num1, page1, search1)
	{
		var con = confirm("정말로 삭제하시겠습니까?");
		
		if(con==true)
		{
			var num = { num: num1 , page: page1 , search: search1};
			
			$.ajax(
					{	
						url : "reviewDel" ,	
						type : "POST" , 
						data :  JSON.stringify(num) ,	
						dataType : "json" , 
						contentType : "application/json; charset=UTF-8" ,
						success : function(Data)	
						{		
							alert("삭제되었습니다");
							listreview(Data);
						} ,
						error : function(request,error,xhr1 , status)
						{
							alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
						}
					});
		}	
	}
	
	function pagingreview(page1 , search1)
	{		
		var num = { page: page1 , search: search1};
		
		$.ajax(
		{	
			url : "goreviewpage1" ,	
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
		var search = "\""+Data.search+"\"";
		pagetext += "<table class='table' id='main_review'>";
		for(i=0;i<Data.r_list.length;i++)
		{			
			ResultVO = Data.r_list[i];
			
			pagetext += "<tr>";
			pagetext += "<td>"+ResultVO.r_grade+"</td>";
			pagetext += "<td>"+ResultVO.r_writer+"</td>";
			pagetext += "<td>"+ResultVO.r_date+"</td>";
			pagetext += "<td><div id=star data-score="+ResultVO.r_star+"></div></td>";
			pagetext += "<td><img src=<spring:url value='/C:/upload/test/positive-c.png'/> />"+ResultVO.r_good+"</td>";
			pagetext += "<td><img src=<spring:url value='/C:/upload/test/negative-c.png'/> />"+ResultVO.r_bad+"</td>";
			pagetext += "</tr><tr><td colspan=6>"+ResultVO.r_sangpum+"-"+ResultVO.r_size+"구매</td></tr>";
			pagetext += "<tr><td colspan=6>"+ResultVO.r_title+"</td></tr>";
			pagetext += "<tr><td colspan=6>"+ResultVO.r_text+"</td></tr>";
			if(ResultVO.original_fname != "noFile")
				pagetext += "<tr><td colspan=6><img style='width:500px;height:500px;' src='<spring:url value='/C:/upload/test/"+ResultVO.stored_fname+"'/>'/></td></tr>";
			pagetext += "<tr><td><a href='javascript:void(0);' onclick='reviewDel(" + ResultVO.r_num + "," + Data.page + "," + search + ");'>삭제</a></td></tr>";
		}
			pagetext += "</table>";
			pagetext += "<div class='all-paging2' id= 'main_paging'>"
			for(i=1;i<=Data.totalnum2;i++){
				pagetext += "<li><a href='javascript:void(0);' onclick='pagingreview("+ i +" , "+ search +")'>"+i+"</a></li>"
			}
		pagetext += "</div>"
		$("#main_review").remove();
		$("#main_paging").remove();
		$("#sub_review").append(pagetext);
		
		
		$(function() 
		        {
		            jQuery('div#star').raty(
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
	            jQuery('div#star').raty(
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
	
	
	
</script>
</head>
<body>
<div id="all-container">
<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>

<div id="all-content">
<h1>회원 Review목록</h1>
<form action="search_id">
<table>
<tr>
<td><input class="txtBox00" type="text" placeholder="ID입력" name="searchID" value="${search }"></td>
<td><input class="button" type="submit" value="검색"></td>
</tr>
</table>
</form>

	<table class="table" id="main_review">
		<c:forEach var="imsi" items="${r_list }">
			<tr>
				<td>${imsi.r_grade }</td>
				<td>${imsi.r_writer }</td>
				<td>${imsi.r_date }</td>
				<td><div id='imsi'><div data-score="${imsi.r_star }" id=star></div></div></td>
				<td><img src="<spring:url value='/C:/upload/test/positive-c.png'/>"/>${imsi.r_good }</td>
				<td><img src="<spring:url value='/C:/upload/test/negative-c.png'/>"/>${imsi.r_bad }</td></tr>
			<tr>
				<td colspan=6>${imsi.r_sangpum }-${imsi.r_size }구매</td>
			</tr>
			<tr>
				<td colspan=6>${imsi.r_title }</td>
			</tr>
			<tr>
				<td colspan=6>${imsi.r_text }</td>
			</tr>
			<c:if test="${imsi.original_fname != 'noFile'}">
				<tr><td colspan=6><img style="width:500px;height:500px;" src="<spring:url value='/C:/upload/test/${imsi.stored_fname }'/>"/></td></tr>
			</c:if>
			<tr><td><a href="javascript:void(0);" onclick="reviewDel(${imsi.r_num } , ${page } , '${search }' );">삭제</a></td></tr>
		</c:forEach>
	</table>
	<div class="all-paging2" id= "main_paging">
		<c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
  			<li>
  				<a href="javascript:void(0);" onclick="pagingreview(${i } , '${search }')">${i }</a>
  			</li>
		</c:forEach>
	</div>
	<div id = "sub_review">
	</div>
	</div>
</div>
</body>
</html>
