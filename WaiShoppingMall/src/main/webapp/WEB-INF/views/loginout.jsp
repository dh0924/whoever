<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/> -->
<title>Insert title here</title>
</head>
<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<body>
<ul>
<c:if test="${loginid == null }">
<li><a href="gologin">�α���</a></li>
<li><a href="check_member">ȸ������</a></li>
<li><a href="gonoticeboard?user=loginid&page=1">��������</a></li>
<!-- <li><a href="#">1:1����</a></li> -->
</c:if>
<c:if test="${loginid != null && admin==0}">
<li><a href="logout">�α׾ƿ�</a></li>
<li><a href="mypage?id=${loginid}">����������</a></li>
<li><a href="gonoticeboard?user=loginid&page=1">��������</a></li>
<!-- <li><a href="#">1:1����</a></li> -->
</c:if>
<c:if test="${loginid != null && admin==1}">
<li><a href="logout">�α׾ƿ�</a></li>
<li><a href="mypage?id=${loginid}">����������</a></li>
<li><a href="gonoticeboard?user=admin&page=1">��������</a></li>
<li><a href="goproductlistpage?page=1">����</a></li>
</c:if>
</ul>
<!-- <script type='text/javascript'>
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
</script> -->
</body>
</html>