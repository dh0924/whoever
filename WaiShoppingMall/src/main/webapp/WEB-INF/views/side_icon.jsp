<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>

<c:if test="${loginid != null}">
   <div id="floatMenu">
      <a href="myCart"><img width="50" height="50" alt="��ٱ���" src="${pageContext.request.contextPath }/resources/img/cart2.png"></a><br><br>
      <a href="myOrder"><img width="50" height="50" alt="�ֹ� ����" src="${pageContext.request.contextPath }/resources/img/order2.png"></a><br><br>
      <a href="myreview"><img width="50" height="50" alt="My review" src="${pageContext.request.contextPath }/resources/img/review2.png"></a><br><br>
      <a href="myQnA"><img width="50" height="50" alt="My Q&A" src="${pageContext.request.contextPath }/resources/img/qna2.png"></a><br><br>
   	  <div id="kakao-talk-channel-chat-button"></div>
   	  
   	
   </div>
</c:if>

<!-- --------------------------------------------------------------------- -->
<script type='text/javascript'>
  //<![CDATA[
    // ����� ���� JavaScript Ű�� ������ �ּ���.
    Kakao.init('9321be204d0724ff411ca72d2d76729a');
    // īī���� ä�� 1:1ä�� ��ư�� �����մϴ�.
    Kakao.Channel.createChatButton({
      container: '#kakao-talk-channel-chat-button',
      /* channelPublicId: '_xcLqmC' // īī���� ä�� Ȩ URL�� ��õ� id�� �����մϴ�. */
        channelPublicId: '_xlCxfDT' // īī���� ä�� Ȩ URL�� ��õ� id�� �����մϴ�.
    });
  //]]>
</script>
<!-- --------------------------------------------------------------------- -->

</body>
</html>