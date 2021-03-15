<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/theme_1/js/jquery-1.4.4.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">
</head>
<script>

$.fn.serializeObject = function()

{

   var o = {};

   var a = this.serializeArray();

   $.each(a, function() {

       if (o[this.name]) {

           if (!o[this.name].push) {

               o[this.name] = [o[this.name]];

           }

           o[this.name].push(this.value || '');

       } else {

           o[this.name] = this.value || '';

       }

   });

   return o;

};

	function refresh()
	{		
		
		var params = JSON.stringify($("#qnaanscon").serializeObject());

 		$.ajax(
		{
			url : "qnaanscon" ,
			type : "POST" , 
			data : params,
			dataType : "text" ,
			contentType : "application/json; charset=UTF-8" ,
			success : function(Data)
			{
				window.opener.location.reload();
				window.close();
			},
			error : function(request,error,xhr1 , status)
			{
				alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
		});
	}
</script>
<body>
	
	<h3>${number }번째 글, 답변을 작성해주세요.</h3>
	
	<form id="qnaanscon" name="qnaanscon" method="post">
		<textarea name="qnaanswercontents" id="qnaanswercontents" style="width:98%; height:150px; resize:none;" placeholder="내용을 입력해주세요"></textarea>
		<input type="hidden" value=${number } name="qnano" id="qnano">
	</form>
	<br>
		<input class="button" type="button" value="확인" onclick="refresh();"> <input class="button" type="button" value="취소" onclick="self.close();">
		
	
	
</body>
</html>