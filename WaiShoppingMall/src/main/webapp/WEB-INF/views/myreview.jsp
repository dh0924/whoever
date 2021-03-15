<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>WAI MAIN</title>
	<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery-1.4.4.min.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery.raty.js"></script>
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/mypagestyle.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/fontello/css/fontello.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_board.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/theme_1/all/all_paging.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	
	<script type="text/javascript">
	var aa = jQuery.noConflict();
	function pagingreview(page1 ,user1 )
	{		
		var num = { page: page1 , user: user1};
		
		$.ajax(
		{	
			url : "myReviewpage" ,	
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
		var user = "\""+Data.user+"\"";
		pagetext += "<div id='main_overflow' style='overflow-y: auto; overflow-x: hidden; width: 100%; height: 700px;'>";
		pagetext += "<table class='table' id='main_review' style='table-layout: auto; margin: auto; width: 80%; text-align: center;'>";
		for(i=0;i<Data.r_list.length;i++)
		{			
			ResultVO = Data.r_list[i];
			
			pagetext += "<tr>";
			pagetext += "<td>"+ResultVO.r_grade+"</td>";
			pagetext += "<td>"+ResultVO.r_writer+"</td>";
			pagetext += "<td>"+ResultVO.r_date+"</td>";
			pagetext += "<td><div id=star data-score="+ResultVO.r_star+"></div></td>";
			pagetext += "<td><img src=<spring:url value='/E:/upload/test/positive-c.png'/> />"+ResultVO.r_good+"</td>";
			pagetext += "<td><img src=<spring:url value='/E:/upload/test/negative-c.png'/> />"+ResultVO.r_bad+"</td>";
			pagetext += "</tr><tr><td colspan=6>"+ResultVO.r_sangpum+"-"+ResultVO.r_size+"구매</td></tr>";
			pagetext += "<tr><td colspan=6>"+ResultVO.r_title+"</td></tr>";
			pagetext += "<tr><td colspan=6>"+ResultVO.r_text+"</td></tr>";
			if(ResultVO.original_fname != "noFile")
				pagetext += "<tr><td colspan=6><img style='width:350px;height:350px;' src='<spring:url value='/E:/upload/test/"+ResultVO.stored_fname+"'/>'/></td></tr>";
			}
			pagetext += "</table>";
			pagetext += "</div>";
			pagetext += "<div id='main_paging' class='all-paging2'>";
			for(i=1;i<=Data.totalnum2;i++){
				pagetext += "<li><a href='javascript:void(0)' onclick='pagingreview("+ i +" , "+ user +")'>"+i+"</a></li>"
			}
		pagetext += "</div>"
		
		$("#main_overflow").remove();
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
	
	
	
	</script>
</head>
<body>
	<div class="StyledLayout">
		<div class="Header">
			<jsp:include page="Header.jsp"></jsp:include>
		</div>
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
						<h3 style="text-align: left">My Review</h3>
						<hr>
					</nav>
					<article class="grid__article">
					<c:if test= "${check == 0}">
						<div class="warning">
							<ul>
								<li class="fontello">&#xe815</li>
								<li style="font-size: 30px;">리뷰 내역이 없습니다.<br>리뷰를 작성해주세요</li>
							</ul>
						</div>
					</c:if>
					<c:if test= "${check != 0}">
					<div id="main_overflow" style="overflow-y: auto; overflow-x: hidden; width: 100%; height: 700px;">
						<table class= "table" id="main_review" style="table-layout: auto; margin: auto; width: 80%; text-align: center;">
						<c:forEach var="imsi" items="${r_list}">
							<tr style="border-top: 1px solid black;">
								<td>${imsi.r_grade}</td>
								<td>${imsi.r_writer}</td>
								<td>${imsi.r_date}</td>
								<td><div id='imsi'>
										<div data-score="${imsi.r_star }" id=star></div>
									</div></td>
								<td><img
									src="<spring:url value='/E:/upload/test/positive-c.png'/>" />${imsi.r_good}</td>
								<td><img
									src="<spring:url value='/E:/upload/test/negative-c.png'/>" />${imsi.r_bad}</td>
							</tr>
							<tr>
								<td colspan=6>${imsi.r_sangpum }-${imsi.r_size }구매</td>
							</tr>
							<tr>
								<td colspan=6>${imsi.r_title}</td>
							</tr>
							<tr>
								<td colspan=6>${imsi.r_text}</td>
							</tr>
							<c:if test="${imsi.original_fname != 'noFile'}">
								<tr>
									<td colspan=6>
										<img style="width:350px;height:350px;" src="<spring:url value='/E:/upload/test/${imsi.stored_fname }'/>" />
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					</div>
					<div id="main_paging" class="all-paging2">
						<c:forEach var="i" begin="1" end="${totalnum2 }" step="1">
							<li><a href="javascript:void(0);" class="pagebutton" onclick="pagingreview(${i} , '${user}')">${i }</a></li>
						</c:forEach>
					</div>
					<%-- <div class="all-paging2">
                  <c:forEach var="i" begin="1" end="${totalnum2}" step="1">
                          <li><a href="javascript:void(0);" class="pagebutton" onclick="pagingreview(${i}, '${user })">${i }</a></li>
                    </c:forEach>
                    </div> --%>
					<div id="sub_review"></div>
					</c:if>
					</article>
				</div>
				<div class="grid__item">
					<ul>
						<li class="fontello"><a href="myProfile">&#xf2be<br>
								<div style="font-size: 22px; font-family: 'Merriweather', serif;">My Profile</div></a>
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
	<!-- 	<section class="content">
			
		</section>
	 -->
	
	
</body>
</html>