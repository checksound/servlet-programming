<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="title" scope="page" value="Date and Time" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="1">
<title><c:out value="${title}" /></title>
</head>
<body>
<h1><c:out value="${title}" /></h1>
<% pageContext.setAttribute("date", (new java.util.Date()).toString());%>
It's <c:out value="${date}" />
</body>
</html>