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
<li><a href="gologin">로그인</a></li>
<li><a href="check_member">회원가입</a></li>
<li><a href="gonoticeboard?user=loginid&page=1">공지사항</a></li>
<!-- <li><a href="#">1:1문의</a></li> -->
</c:if>
<c:if test="${loginid != null && admin==0}">
<li><a href="logout">로그아웃</a></li>
<li><a href="mypage?id=${loginid}">마이페이지</a></li>
<li><a href="gonoticeboard?user=loginid&page=1">공지사항</a></li>
<!-- <li><a href="#">1:1문의</a></li> -->
</c:if>
<c:if test="${loginid != null && admin==1}">
<li><a href="logout">로그아웃</a></li>
<li><a href="mypage?id=${loginid}">마이페이지</a></li>
<li><a href="gonoticeboard?user=admin&page=1">공지사항</a></li>
<li><a href="goproductlistpage?page=1">관리</a></li>
</c:if>
</ul>
<!-- <script type='text/javascript'>
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
</script> -->
</body>
</html>