<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/resources/theme_1/user/user_sidebar.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_search.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/theme_1/all/all_button_style.css" rel="stylesheet">

<style>
@font-face {
     font-family: 'BRBA_B';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/BRBA_B.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

.title a {
	font-family: 'BRBA_B';
}

.title a:hover {
	color:#ff81a1 !important;
}
</style>

</head>
<body>

<c:if test="${loginid == null || admin == 0 }">
<div id="user-sidebar">
<br>
<br>
<div class=title><h1 style="font-size:50px;text-align:center;cursor:pointer;text-decoration:none;" ><a href="gohome">�ƹ���</a></h1></div>
<ul>
<li class="menu" style="cursor:pointer;"><a>MAN</a>
<ul>
<li><a href="M_Top">����</a></li>
<li><a href="M_Bottom">����</a></li>
<li><a href="bag">����</a></li>
<li><a href="shoes">�Ź�</a></li>
<li><a href="Accessories">�׼�����</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>WOMAN</a>
<ul>
<li><a href="W_Top">����</a></li>
<li><a href="W_Bottom">����</a></li>
<li><a href="bag">����</a></li>
<li><a href="shoes">�Ź�</a></li>
<li><a href="Accessories">�׼�����</a></li>
</ul>
</li>
</ul>
<hr>

<!-- <div id="all-search"> -->
<form action="search_product">
<table>
<tr>
<td><input class="txtBox00" style="width:150px;" type="text" placeholder="��ǰ�� �Է�" name="searchProduct" value="${search }"></td>
<td><input class="button-mini2" type="submit" value="�˻�"></td>
</tr>
</table>
</form>
<!-- </div> -->
<br>
(��)�ƹ���<br><br>
010-9852-3813<br><br>
AAAA@email.com<br><br>
<a href="goaboutcompany">ȸ�� �Ұ�</a><br>
<table style="height:1000px;width:0px;"><tr><td></td></tr></table>
</div>
</c:if>

<c:if test="${admin == 1 }">
<div id="user-sidebar">
<h1 style="font-size:50px;text-align:center;cursor:pointer;text-decoration:none"><a href="gohome">WAI</a></h1>

<ul>
<li class="menu" style="cursor:pointer;"><a>��ǰ ����</a>
<ul>
<li><a href="goproductlistpage?page=1">��ǰ ���</a></li>
<li><a href="goproductinsert">��ǰ ���</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>ȸ�� ����</a>
<ul>
<li><a href="memberAllData">ȸ�� ���</a></li>
<li><a href="gomemberprequest?page=1">ȸ�� ���� ��û</a></li>
<li><a href="gomemberpresponse?page=1">ȸ�� ���� Ȯ��</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>�Խñ� ����</a>
<ul>
<li><a href="goqnaboard1?user=admin&page=1">ȸ�� Q&A���</a></li>
<li><a href="goreviewboard1?user=admin">ȸ�� Review���</a></li>
<li><a href="gonoticeboard?user=admin&page=1">��������</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>MAN</a>
<ul>
<li><a href="M_Top">����</a></li>
<li><a href="M_Bottom">����</a></li>
<li><a href="bag">����</a></li>
<li><a href="shoes">�Ź�</a></li>
<li><a href="Accessories">�׼�����</a></li>
</ul>
</li>
</ul>
<hr>
<ul>
<li class="menu" style="cursor:pointer;"><a>WOMAN</a>
<ul>
<li><a href="W_Top">����</a></li>
<li><a href="W_Bottom">����</a></li>
<li><a href="bag">����</a></li>
<li><a href="shoes">�Ź�</a></li>
<li><a href="Accessories">�׼�����</a></li>
</ul>
</li>
</ul>
<hr>
<form action="search_product">
<table>
<tr>
<td><input class="txtBox00" style="width:150px;" type="text" placeholder="��ǰ�� �Է�" name="searchProduct" value="${search }"></td>
<td><input class="button-mini2" type="submit" value="�˻�"></td>
</tr>
</table>
</form>
<!-- </div> -->
<br>
(��)AAAA<br><br>
010-9852-3813<br><br>
AAAA@email.com<br><br>
<a href="goaboutcompany">ȸ�� �Ұ�</a><br>
<table style="height:1000px;width:0px;"><tr><td></td></tr></table>
</div>
</c:if>

</body>
</html>