<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<%  
    response.setHeader("pragma", "no-cache");              
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");             
    response.setHeader("Expires", "0"); 
%> 
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/> -->
<title>WAI MAIN</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_slide.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="${pageContext.request.contextPath }/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<script>
$(document).ready(function(){
/* //사용할 배너
var $banner = $(".banner").find("ul");

var $bannerWidth = $banner.children().outerWidth();//배너 이미지의 폭
var $bannerHeight = $banner.children().outerHeight(); // 높이
var $bannerLength = $banner.children().length;//배너 이미지의 갯수
var rollingId;

//정해진 초마다 함수 실행
rollingId = setInterval(function() { rollingStart(); }, 3000);//다음 이미지로 롤링 애니메이션 할 시간차

//마우스 오버시 롤링을 멈춘다.
 $banner.mouseover(function(){
   //중지
   clearInterval(rollingId);
   $(this).css("cursor", "pointer");
}); 
//마우스 아웃되면 다시 시작
 $banner.mouseout(function(){
   rollingId = setInterval(function() { rollingStart(); }, 3000);
   $(this).css("cursor", "default");
}); 

function rollingStart() {
   $banner.css("width", $bannerWidth * $bannerLength + "px");
   $banner.css("height", $bannerHeight + "px");
   //alert(bannerHeight);
   //배너의 좌측 위치를 옮겨 준다.
   $banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
      //첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
      $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
      //뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
      $(this).find("li:first").remove();
      //다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
      $(this).css("left", 0);
      //이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
   }); */
   slide();	
});


function slide() {
	  var wid = 0;
	  var now_num = 0;
	  var slide_length = 0;
	  var auto = null;
	  var $dotli = $('.dot>li');
	  var $panel = $('.panel');
	  var $panelLi = $panel.children('li');

	  // 변수 초기화
	  function init() {
	    wid = $('.slide').width();
	    now_num = $('.dot>li.on').index();
	    slide_length = $dotli.length;
	  }

	  // 이벤트 묶음
	  function slideEvent() {

	    // 슬라이드 하단 dot버튼 클릭했을때
	    $dotli.click(function() {
	      now_num = $(this).index();
	      slideMove();
	    });

	    // 이후 버튼 클릭했을때
	    $('.next').click(function() {
	      nextChkPlay();
	    });

	    // 이전 버튼 클릭했을때
	    $('.prev').click(function() {
	      prevChkPlay();
	    });

	    // 오토플레이
	    autoPlay();

	    // 오토플레이 멈춤
	    autoPlayStop();

	    // 오토플레이 재시작
	    autoPlayRestart();

	  }

	  // 자동실행 함수
	  function autoPlay() {
	    auto = setInterval(function() {
	      nextChkPlay();
	    }, 3000);
	  }

	  // 자동실행 멈춤
	  function autoPlayStop() {
	    $panelLi.mouseenter(function() {
	      clearInterval(auto);
	    });
	  }


	  // 자동실행 멈췄다가 재실행
	  function autoPlayRestart() {
	    $panelLi.mouseleave(function() {
	      auto = setInterval(function() {
	        nextChkPlay();
	      }, 3000);
	    });
	  }

	  // 이후 버튼 클릭시 조건 검사후 슬라이드 무브
	  function nextChkPlay() {
	    if (now_num == slide_length - 1) {
	      now_num = 0;
	    } else {
	      now_num++;
	    }
	    slideMove();
	  }

	  // 슬라이드 무브
	  function slideMove() {
	    $panel.stop().animate({
	      'margin-left': -wid * now_num
	    });
	    $dotli.removeClass('on');
	    $dotli.eq(now_num).addClass('on');
	  }
	  
	  init();
	  slideEvent();

}; 
</script>

<script type="text/javascript">
$(document).ready(function() {

   // 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
   var floatPosition = parseInt($("#floatMenu").css('top'));
   // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

   $(window).scroll(function() {
      // 현재 스크롤 위치를 가져온다.
      var scrollTop = $(window).scrollTop();
      var newPosition = scrollTop + floatPosition + "px";

      /* 애니메이션 없이 바로 따라감
       $("#floatMenu").css('top', newPosition);
       */

      $("#floatMenu").stop().animate({
         "top" : newPosition
      }, 500);

   }).scroll();

});
</script>

<script>
window.onload = function(){
	document.querySelector('.btn-menu').addEventListener('click', function(){
	    this.classList.toggle('active');
	});
}
</script>

<script>
 $(document).ready(function() {
	  $(".btn-menu").click(function() {
	  
	  	var classcount = document.getElementById('btn-menu').classList.length;
	    
	    if(classcount == 1)
	    {
	      var width = $(window).width();
	      var height = $(window).height();

	      /* $(".backLayer").width(width);
	      $(".backLayer").height(height); */
	      $(".backLayer").fadeTo(500, 0.3);

	      var loadingDivObj = $(".loadingLayer");
	      loadingDivObj.css("top", 0);
	      loadingDivObj.css("left", 0);
	      loadingDivObj.fadeIn(500);
	    }
	    else if(classcount == 2)
	    {
	      $(".loadingLayer").fadeOut(300);
	      $(".backLayer").fadeTo(300, 1);
	    } 
	  });
	  
	}); 
/* 	
$(document).ready(function() {
	  $(".btn-menu").click(function() {
	  
	  	var classcount = document.getElementById('btn-menu').classList.length;
	    
	    if(classcount == 1)
	    {
	      var width = $(window).width();
	      var height = $(window).height();

	      $("#all-container").width(width);
	      $("#all-container").height(height);
	      $("#all-container").fadeTo(500, 0.3);

	      var loadingDivObj = $(".loadingLayer");
	      loadingDivObj.css("top", 0);
	      loadingDivObj.css("left", 0);
	      loadingDivObj.fadeIn(500);
	    }
	    else if(classcount == 2)
	    {
	      $(".loadingLayer").fadeOut(300);
	      $("#all-container").fadeTo(300, 1);
	    } 
	  });
	  
	}); */
/* $(document).ready(function(){ 
	$(".btn-menu").click(function(){ 
		var width = $(window).width(); 
		var height = $(window).height(); 
		
		$(".backLayer").width(width); 
		$(".backLayer").height(height); 
		$(".backLayer").fadeTo(500, 0.3); 
		
		var loadingDivObj = $("#loadingDiv"); 
		loadingDivObj.css("top", 0); 
		loadingDivObj.css("left",0); 
		loadingDivObj.fadeIn(500); 
	}); 
	
	
	$(".active").click(function(){ 
		$("#loadingDiv").fadeOut(300); 
		$(".backLayer").fadeOut(1000); 
	}); 
}); */
/* 
$(document).ready(function(){ 

}); */
/* 
$(document).keydown(function(event){ 
	if(event.which=='27'){ 
		$("#loadingDiv").fadeOut(300); 
		$(".backLayer").fadeOut(1000); 
	}
});  */

 $(window).resize(function(){ 
	var width = $(window).width(); 
	var height = $(window).height(); 
	$(".backLayer").width(width).height(height);
});
 

function goCart()
{
    var sess = "<%=(String)session.getAttribute("loginid")%>";
    
    if(sess == "null")
    {
       alert("로그인이 필요합니다.");
       var result = confirm("로그인 페이지로 이동하시겠습니까");
          
       if(result)
       {
          location.href='gologin';
          
       }
       return false;
    }
    
    location.href='myCart';
}

function goOrder()
{
    var sess = "<%=(String)session.getAttribute("loginid")%>";
    
    if(sess == "null")
    {
       alert("로그인이 필요합니다.");
       var result = confirm("로그인 페이지로 이동하시겠습니까");
          
       if(result)
       {
          location.href='gologin';
          
       }
       return false;
    }
    
    location.href='myOrder';
}

function goPoint()
{
    var sess = "<%=(String)session.getAttribute("loginid")%>";
    
    if(sess == "null")
    {
       alert("로그인이 필요합니다.");
       var result = confirm("로그인 페이지로 이동하시겠습니까");
          
       if(result)
       {
          location.href='gologin';
          
       }
       return false;
    }
    
    location.href='myPoint';
}

function goreview()
{
    var sess = "<%=(String)session.getAttribute("loginid")%>";
    
    if(sess == "null")
    {
       alert("로그인이 필요합니다.");
       var result = confirm("로그인 페이지로 이동하시겠습니까");
          
       if(result)
       {
          location.href='gologin';
          
       }
       return false;
    }
    
    location.href='myreview';
}

function goQnA()
{
    var sess = "<%=(String)session.getAttribute("loginid")%>";
    
    if(sess == "null")
    {
       alert("로그인이 필요합니다.");
       var result = confirm("로그인 페이지로 이동하시겠습니까");
          
       if(result)
       {
          location.href='gologin';
          
       }
       return false;
    }
    
    location.href='myQnA';
}

function numberWithCommas(x) 
{
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>

<style>
body{
	/*background-image: url('https://images.unsplash.com/photo-1515549832467-8783363e19b6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80');*/
	background-color: white; 
}

#floatMenu {
   position: absolute;
   width: 100px;
   height: 500px;
   left: 92%;
   top: 250px;
}

@font-face {
     font-family: 'BRBA_B';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/BRBA_B.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&family=Permanent+Marker&display=swap');

@font-face {
     font-family: 'NIXGONM-Vb';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

@-webkit-keyframes sparkle {
  from {
    background-position: 0% 100%;
  }
  to {
    background-position: 200% 100%;
  }
}

@-webkit-keyframes sparkle {
  from {
    background-position: 0% 100%;
  }
  to {
    background-position: 200% 100%;
  }
}

@keyframes sparkle {
  from {
    background-position: 0% 100%;
  }
  to {
    background-position: 200% 100%;
  }
}

.maintop {
	left: -4%;
	position: relative; 
	display: inline-block;
	margin-bottom:50px;
}

.test {
  background: white;
  display: inline-block;
  padding: 1em;
  font-family: 'Noto Sans KR', sans-serif;
  border-radius: 4px;
  position: relative;
  margin-top: 100px;
  left: -3%
}
.test:before {
  -webkit-animation: sparkle 4s infinite linear;
          animation: sparkle 4s infinite linear;
  background: linear-gradient(90deg, #7FEFBD 0%, #FFF689 11%, #EC0B43 22%, #7FEFBD 33%, #FFF689 44%, #EC0B43 55%, #7FEFBD 66%, #FFF689 77%, #EC0B43 88%, #7FEFBD 100%);
  background-size: 300% 100%;
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border-radius: 4px;
  filter: blur(3px);
  z-index: -1;
  transform: scale(0.99) translateY(3px);
}


.slide>ul {
  margin: 0px;
  padding: 0px;
  display:block;
}

ul,
ol,
li {
  list-style: none;
}

.slide {
  height: 400px;
  overflow: hidden;
}

.panel {
  width: 400%;
}

.panel:after {
  content: "";
  display: block;
  clear: both;
}

.panel>li {
  width: 25%;
  height: 200px;
  float: left;
  background-repeat: no-repeat;
  background-size: 100% 100%;
  position: relative;
  display:block;
}

.dot:after {
  content: "";
  display: block;
  clear: both;
}

.dot {
  position: absolute;
  left: 80%;
  bottom: 10%;
  transform: translateX(-50%);
}

.dot>li {
  float: left;
  width: 15px;
  height: 15px;
  border-radius: 50%;
  background-color: #fff;
  margin-left: 10px;
  margin-right: 10px;
  text-indent: -9999px;
  cursor: pointer;
}

.dot>li.on {
  background-color: #342f2f;
}



.btn-menu {position:absolute; float:left; width:50px; height:50px; left:16%;}
.btn-menu:before, .btn-menu:after {display:block; content:""; position:absolute; left:50%; top:50%; width:30px; height:3px; background:#000; -webkit-transform:translateX(-50%); transform:translateX(-50%); -webkit-transition:all 0.8s cubic-bezier(0.23, 1, 0.32, 1); transition:all 0.8s cubic-bezier(0.23, 1, 0.32, 1);}
.btn-menu .middle {  
	position:absolute;
	left:50%;
	top:50%;
	width:30px;
	height:3px;
	background: #000;
	-webkit-transform:translateX(-50%); transform:translateX(-50%); -webkit-transition:all 0.8s cubic-bezier(0.23, 1, 0.32, 1); transition:all 0.8s cubic-bezier(0.23, 1, 0.32, 1);
	margin-top:-1.5px;
	opacity:1;
 }
.btn-menu:before {margin-top:-12px;}
.btn-menu:after {margin-top:9px;}
.btn-menu.active {position:absolute; float:left; width:50px; height:50px; left:16%; border:0px solid #000; -webkit-box-sizing:border-box; box-sizing:border-box; background:#fff;}
.btn-menu.active:before {margin-top:-2px; -webkit-transform:translateX(-50%) rotate(45deg) translateZ(0); transform:translateX(-50%) rotate(45deg) translateZ(0);}
.btn-menu.active:after {margin-top:-2px; -webkit-transform:translateX(-50%) rotate(-45deg) translateZ(0); transform:translateX(-50%) rotate(-45deg) translateZ(0);}
.btn-menu.active .middle {
	opacity:0;
}
 
 
div.backLayer { 
	position:absolute; 
	max-width:1200px;
} 
div.loadingLayer{
	margin: 0;
	background: #8977AD; 
	display: none;
	position: absolute; 
	width:99vw; 
	height:100vh; 
	opacity: 0.9;
}

.all-list {
	position: relative;
    text-align: left;
    margin: 0 auto;
    padding: 220px 0 0 0;
    width: 1094px;
    color: #fff;
    font-size: 14px;
}

.list-m {
	margin-bottom: 60px;
}

.list-m>h2 {
	font-size: 26px;
    font-family: 'BRBA_B';
    border-bottom: 2px solid #fff;
    padding-bottom: 20px;
    margin-bottom: 12px;
}

.all-list .list-m a:hover {
	color:#ff81a1;
}

.all-list .list-m a {
	color:inherit;text-decoration:none;
}

.all-list .list-m ul li a {
	display:block; 
	text-indent:15px; 
	font-size:17px; 
	font-family: 'BRBA_B';
	height:33px; 
	line-height:33px;
}

.all-list .list-m ul li {
	width:15%; 
	float:left;
}

.all-list .list-m ul:after {
	display:block;
	clear:both;
	content:"";
}

.item {
	font-family: 'BRBA_B';
	display: inline-block;
	margin: 0 16px;
	width: 253px !important;
	margin-bottom: 50px;
}

.item img {
	border-radius: 10px;
}

.item a {
	font-weight: 300;
	color: #878787;
	line-height: 19px;
	text-decoration: none;
}


.item p {
	font-size: 16px;
	font-weight: bold;
	color: #010101;
	display: inline-block;
	margin-left: 3px;
}

.item .name {
	padding: 5px 0 12px;
	border-bottom: 1px solid #ececec;
	display: block;
	font-family: 'NIXGONM-Vb';
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
<div class='backLayer'>
<div id="all-slide">

      <div class="slide">
         <ul class="panel">
            <li><img src="${pageContext.request.contextPath }/resources/img/model1.PNG" width="1050px" height="400px"></li>
            <li><img src="https://cdn.pixabay.com/photo/2017/08/06/09/22/people-2590616_960_720.jpg" width="1050px" height="400px"></li>
            <li><img src="https://cdn.pixabay.com/photo/2018/04/03/20/26/woman-3287956_960_720.jpg" width="1050px" height="400px"></li>
            <li><img src="https://cdn.pixabay.com/photo/2016/11/29/09/56/fashion-1868866_960_720.jpg" width="1050px" height="400px"></li>
         </ul>
         <ul class="dot">
         	<li class="on">1번</li>
         	<li>2번</li>
         	<li>3번</li>
         	<li>4번</li>
         </ul>
      </div>
   </div>

   <table>
   <tr>
   <th><%-- <img width="120" height="75" alt="new" src="${pageContext.request.contextPath }/resources/img/top.png"> --%>
      	<span class="maintop" style="font-size:1.3em;">NEW ITEM</span>
      	<div class = "test">
		  NEW
		</div>
   </th>      
   </tr>
   <tr>
   <td>
   <c:forEach var="imsi" items="${mlist }" varStatus="status">
               <div class = "item">
                  <a href="goproductdetail?productcode=${imsi.productcode }"> <img src="<spring:url value='/C:/upload/test/${imsi.stored_fname }'/>" width="250" height="250" /> </a>
               <h3><a href="goproductdetail?productcode=${imsi.productcode }" class="name">${imsi.productsubject }</a></h3>
               <p id="new${status.index }">${imsi.productprice } 원</p>
               <script>
               $(document).ready(function()
               {
               	var pri = $("#new${status.index }").text();
               	$("#new${status.index }").html(numberWithCommas(pri));
               })
               </script>
               </div>
   </c:forEach>
   </td>
   </tr>
   </table>
   	
   <table>
   <tr>
   <th><%-- <img width="120" height="75" alt="new" src="${pageContext.request.contextPath }/resources/img/top.png"> --%>
      	<span class="maintop" style="font-size:1.3em;">BEST ITEM</span>
      	<div class = "test">
		  BEST
		</div>
   </th>      
   </tr>
   <tr>
   <td>
   <c:forEach var="imsi" items="${mlist }" varStatus="status">
               <div class = "item">
                  <a href="goproductdetail?productcode=${imsi.productcode }"> <img src="<spring:url value='/C:/upload/test/${imsi.stored_fname }'/>" width="250" height="250" /> </a>
               <h3><a href="goproductdetail?productcode=${imsi.productcode }" class="name">${imsi.productsubject }</a></h3>
               <p id="best${status.index }">${imsi.productprice } 원</p>
               <script>
               $(document).ready(function()
               {
               	var pri = $("#best${status.index }").text();
               	$("#best${status.index }").html(numberWithCommas(pri));
               })
               </script>
               </div>
   </c:forEach>
   </td>
   </tr>
   </table>

   

</div>
</div>
</div>
<jsp:include page="side_icon.jsp"></jsp:include>

<div class="loadingLayer">
	<div class="all-list">
		<div class="list-m">
			<h2>마이페이지</h2>
			<ul>
				<li><a href="javascript:void(0);" onclick="goCart();">장바구니</a></li>
				<li><a href="javascript:void(0);" onclick="goOrder();">주문내역</a></li>
				<li><a href="javascript:void(0);" onclick="goPoint();">포인트</a></li>
				<li><a href="javascript:void(0);" onclick="goreview();">상품리뷰</a></li>
				<li><a href="javascript:void(0);" onclick="goQnA();">상품QnA</a></li>
			</ul>
		</div>
		<div class="list-m">
			<h2>고객센터</h2>
			<ul>
				<li><a href="gonoticeboard?user=loginid&page=1">공지사항</a></li>
				<li><a href="">1:1문의하기</a></li>
				<li><a href="findid">아이디 찾기</a></li>
				<li><a href="findpw">비밀번호 찾기</a></li>
			</ul>
		</div>
	</div>
</div>z
<a href="javascript:;" class="btn-menu" id="btn-menu">
	<span class="middle"></span>
</a>
<%-- <c:if test="${loginid != null }">
   <div id="floatMenu">
      <a href="myCart"><img width="50" height="50" alt="장바구니" src="${pageContext.request.contextPath }/resources/img/cart2.png"></a><br><br>
      <a href="myOrder"><img width="50" height="50" alt="주문 내역" src="${pageContext.request.contextPath }/resources/img/order2.png"></a><br><br>
      <a href="myreview"><img width="50" height="50" alt="My review" src="${pageContext.request.contextPath }/resources/img/review2.png"></a><br><br>
      <a href="myQnA"><img width="50" height="50" alt="My Q&A" src="${pageContext.request.contextPath }/resources/img/qna2.png"></a><br><br>
   	  <div id="kakao-talk-channel-chat-button"></div>
   	  
   	
   </div>
</c:if>

<!-- --------------------------------------------------------------------- -->
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('9321be204d0724ff411ca72d2d76729a');
    // 카카오톡 채널 1:1채팅 버튼을 생성합니다.
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
      /* channelPublicId: '_xcLqmC' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다. */
        channelPublicId: '_xlCxfDT' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
    });
  //]]>
</script>
<!-- --------------------------------------------------------------------- -->
 --%>
 
 
</body>
</html>