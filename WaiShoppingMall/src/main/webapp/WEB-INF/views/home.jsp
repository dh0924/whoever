<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<form action="goqnaboard">
		<select name = "user">
			<option value="admin">admin</option>
			<option value="UserA">UserA</option>
			<option value="UserB">UserB</option>
		</select>
		<input type="submit" value="QnA게시판으로">
	</form>
	
	<form action="gonoticeboard">
				<select name = "user">
			<option value="admin">admin</option>
			<option value="UserA">UserA</option>
			<option value="UserB">UserB</option>
		</select>
		<input type="submit" value="공지사항으로">
	</form>
</body>
</html>
