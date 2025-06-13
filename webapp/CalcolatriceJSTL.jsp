<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="title" scope="page" value="Calculator" />
<c:set var="a" scope="page" value="${param.a}" />
<c:set var="b" scope="page" value="${param.b}" />
<c:set var="op" scope="page" value="${param.operazione}" />
<c:url var="url" scope="page" value="${pageContext.request.requestURL}" />
<title><c:out value="${title}" /></title>
</head>
<body>
	<h1><c:out value="${title}" /></h1>
	<form method=GET action=<c:out value="${url}" /> >
		<input type=text name="a" value='<c:out value="${a}" />' />
		<select name=operazione>
			<option value="somma" <c:if test="${op=='somma'}"> selected </c:if> >+</option>
			<option value="sottrazione" <c:if test="${op=='sottrazione'}"> selected </c:if> >-</option>
			<option value="moltiplicazione" <c:if test="${op=='moltiplicazione'}"> selected </c:if> >*</option>
			<option value="divisione" <c:if test="${op=='divisione'}"> selected </c:if> >/</option>
		</select>
		<input type=text name="b" value='<c:out value="${b}" />' />
		<input type=submit name="go" value="calcola"></input>
	</form>
	<c:choose>
		<c:when test="${op=='somma'}"> <c:set var="res" scope="page" value="${a+b}" /></c:when>
		<c:when test="${op=='sottrazione'}"> <c:set var="res" scope="page" value="${a-b}" /></c:when>
		<c:when test="${op=='moltiplicazione'}"> <c:set var="res" scope="page" value="${a*b}" /></c:when>
		<c:when test="${op=='divisione' and b != 0}"> <c:set var="res" scope="page" value="${a/b}" /></c:when>
	</c:choose>
	<!--<c:out value="${a}" />	<c:out value="${op}" />	<c:out value="${b}" /> = -->
	<c:out value="${res}" />
</body>
</html>