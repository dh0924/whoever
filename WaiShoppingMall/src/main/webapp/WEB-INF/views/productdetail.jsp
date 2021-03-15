<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery.raty.js"></script>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_container.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_content.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">

<script>
var aa = jQuery.noConflict();
</script>

<script>
jQuery.noConflict();
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
        
        /* function move()
        {
            var offset = $("#detail").offset();

            $('html, body').animate({scrollTop : offset.top}, 400);        
        }
        
        function move2()
        {
            var offset = $("#hoogi").offset();

            $('html, body').animate({scrollTop : offset.top}, 400);      
        }
        
        function move3()
        {
            var offset = $("#qna").offset();

            $('html, body').animate({scrollTop : offset.top}, 400);   
        }
         */
         
         function move()
         {
                     var offset = $("#content1").offset();

                     $('html, body').animate({scrollTop : offset.top}, 400);        
                 }
                 
                 function move2()
                 {
                     var offset = $("#content2").offset();

                     $('html, body').animate({scrollTop : offset.top}, 400);      
                 }
                 
                 function move3()
                 {
                     var offset = $("#content3").offset();

                     $('html, body').animate({scrollTop : offset.top}, 400);   
                 }

        function pm(number)
        {
           var num = Number($("#amount").val());
           
           if(num>=1)
           {
              num = num+number;
              if(num == 0)
              {
                 num = 1;   
              }
               $("#amount").val(num);
               
               $("#total").html(numberWithCommas(num*${pvo.productprice }));
           }
        }
        
        function numberWithCommas(x) 
        {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        
       $(document).ready(function()
      {
          $("#price").html(numberWithCommas(${pvo.productprice}));
      })
      
      function select()
      {
         var selectitem = $("#wansize").val();
         var changeitem ;
         
         

         if(selectitem == "S")
         {
            changeitem = [${colorS}];
         }
         else if(selectitem == "M")
         {
            changeitem = [${colorM}];
         }
         else if(selectitem == "L")
         {
            changeitem = [${colorL}];
         }
         else if(selectitem == "XL")
         {
            changeitem = [${colorXL}];
         }
         else if(selectitem == "210")
         {
            changeitem = [${color210}];
         }
         else if(selectitem == "220")
         {
            changeitem = [${color220}];
         }
         else if(selectitem == "230")
         {
            changeitem = [${color230}];
         }
         else if(selectitem == "240")
         {
            changeitem = [${color240}];
         }
         else if(selectitem == "250")
         {
            changeitem = [${color250}];
         }
         else if(selectitem == "260")
         {
            changeitem = [${color260}];
         }
         else if(selectitem == "270")
         {
            changeitem = [${color270}];
         }
         else if(selectitem == "280")
         {
            changeitem = [${color280}];
         }
         else if(selectitem == "BACKPACK")
         {
            changeitem = [${colorBACKPACK}];
         } 
         else if(selectitem == "CROSS")
         {
            changeitem = [${colorCROSS}];
         }
         else if(selectitem == "TOTE")
         {
            changeitem = [${colorTOTE}];
         }
         else if(selectitem == "RING")
         {
            changeitem = [${colorRING}];
         }
         else if(selectitem == "NECKLACE")
         {
            changeitem = [${colorNECKLACE}];
         }
         else if(selectitem == "WATCH")
         {
            changeitem = [${colorWATCH}];
         }
         else if(selectitem == "EARRING")
         {
            changeitem = [${colorEARRING}];
         }
         else
         {
            changeitem = 1;   
         }
         
         var bag = ["백팩","크로스백","토트백"];
         var acce = ["반지","목걸이","시계","귀걸이"];
      
         var size = changeitem.length;
         
         $('#wancolor').empty();
         $('#wancolor').append("<option>색상</option>");
      
         if(changeitem != 1)
         {
            for(var count = 0; count < size; count++)
            {
               var option = $("<option>" + changeitem[count] + "</option>");
               $('#wancolor').append(option);
            }
         }
         
      }
      
       function pay()
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
           
           var test = $("#amount").val();
           
           if(test==null || test==0)
           {
              alert("사이즈와 색상 , 수량을 선택 후 눌러주세요.");
              return false;
           }
           
           
           var result = confirm("바로 구매하시겠습니까?");
           
           if(result)
           {
               
              
               var file = '${pvo.stored_fname}';
               var subject = '${pvo.productsubject}';
               var size = $('#wansize').val();
               var color = $('#wancolor').val();
               var price =  ${pvo.productprice};
               var amount = $('#amount').val();
               var total =  $("#total").html();
                  
               location.href = "payment?file="+file+"&subject="+subject+"&size="+size+"&color="+color+"&price="+price+"&amount="+amount+"&hid=1";
             
           }

       }
      
      function select2()
      {
         var a = "<input type='button' value='-' onclick='pm(-1);''><input type='text' id='amount' min='1' value='1' style='width:20px;' readOnly><input type='button' value='+' onclick='pm(1);'>";
         $('#selectall').html(a);
         $("#total").html(numberWithCommas(${pvo.productprice }));
      }
      
      function cartins(productsubject1)
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
         
         
         var test = $("#amount").val();
         
         if(test==null)
         {
            alert("사이즈와 색상 , 수량을 선택 후 눌러주세요.");
            return false;
         }
         

		var cartdata = 
		{ productsubject: productsubject1 , wansize: $("#wansize").val() , wancolor: $("#wancolor").val() ,
		  amount: parseInt($("#amount").val()) , stored_fname: '${pvo.stored_fname }' , productprice: ${pvo.productprice}};
            
			$.ajax(
			{   
				url : "cartinsert" ,  
				type : "POST" , 
				data :  JSON.stringify(cartdata) ,   
				dataType : "json" , 
				contentType : "application/json; charset=UTF-8" ,
				success : function(Data)
				{
					alert("장바구니에 담기가 완료되었습니다.");
					var result = confirm("장바구니로 이동하시겠습니까?");
                  
					if(result)
					{
						location.href='myCart'; 
					}
				} ,
				error : function(request,error,xhr1 , status)
				{
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
	}
      
</script>
<style>
.button-long {
	border-radius: 10px 10px 10px 10px; 
}

#button-long1 {background: #ff80bf !important;}
#button-long2 {background: #009ef5 !important;}

</style>
<body>
<div id="all-container">

<div id="user-header">
<jsp:include page="loginout.jsp"></jsp:include>
</div>

<jsp:include page="sidebar.jsp"></jsp:include>
<div id="all-content">

<br><br>
   <table>
      <tr>
         <td rowspan=8><img width="400" height="400" src="<spring:url value='/C:/upload/test/${pvo.stored_fname }'/>"/></td>
      </tr>
      <tr>
         <td>상품명</td>
         <td colspan=3>${pvo.productsubject }</td>
      </tr>
      <tr>
         <td>판매가</td>
         <td colspan=3><span id="price"></span> 원</td>
      </tr>
      <tr>
         <td>상품평</td>
         <td colspan=3><div data-score="${avg }" id=star></div></td>
      </tr>
      <tr>
      <td colspan=2>사이즈
         <select name="wansize" id="wansize" onchange="select()">
            <option>사이즈</option>
            <c:forEach var="siz" items="${size }">
               <option value="${siz }">${siz }</option>
            </c:forEach>
         </select>
      </td>
      <td colspan=2>색상
         <select name="wancolor" id="wancolor" onchange="select2()">
            <option>색상</option>
         </select>
      </td>
      </tr>
      <tr>
         <td colspan=4><div id="selectall"></div></td>
      </tr>
      <tr>
         <td colspan=2>총 상품 금액</td>
         <td colspan=2><span id="total">0</span> 원</td>
      </tr>
      <tr>
         <td colspan=2><input class="button-long" id="button-long1" type="button" value="바로 구매하기" onclick="pay();"></td>
         <td colspan=2><input class="button-long" id="button-long2" type="button" value="장바구니에 담기" onclick="cartins('${pvo.productsubject }');"></td>
      </tr>
   </table>
   
  <!--  <br><br>
    <div class="menubar" text-align="center"></div>
    <br><br><br><br> -->
      <div id="content1">
   
      <input class="input-tab" id="tab1" type="radio" name="tabs" checked onclick="move()"><label class="label-tab" for="tab1">상세 정보</label>
      <input class="input-tab" id="tab2" type="radio" name="tabs" checked onclick="move2()"><label class="label-tab" for="tab2">상품 후기</label>
      <input class="input-tab" id="tab3" type="radio" name="tabs" checked onclick="move3()"><label class="label-tab" for="tab3">Q&A</label>
      
      
       <p><c:forEach var="imsi" items="${uplist }">
     <td><img width="500" height="500" src="<spring:url value='/C:/upload/test/${imsi.stored_fname }'/>"/><br><br></td>
     </c:forEach>
      ${pvo.productcontents }</p></div>
      
   <div id="content2" align="center">
      <c:import url="/reviewboard?productcode=${pvo.productcode }"></c:import><br><br><br><br><br><br><br><br><br><br>
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br> </div>
   
   <div id="content3">
      <c:import url="/goqnaboard?productcode=${pvo.productcode }"></c:import><br><br><br><br><br><br><br><br><br><br>
      <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></div>
   

   </div>
   </div>
   
   <%-- <script src="${pageContext.request.contextPath }/resources/theme_1/js/wai_jquery.js"></script> --%>
</body>
</html>