<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page isErrorPage="true" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Error</title> 
</head> 
<script>
   alert("올바른 접근이 아닙니다.");
   location.href="logout";
</script>
<body> 
   
</body> 
</html>