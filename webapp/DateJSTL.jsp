<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib  uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="title" scope="page" value="Session Example" />
<c:url var="url" scope="page" value="${pageContext.request.requestURL}" />
<jsp:useBean id="dateValue" class="java.util.Date"/>
<c:set var="op" scope="page" value="${param.Go}" />

<title><c:out value="${title}" /></title>
</head>
<body>
<h1><c:out value="${title}" /></h1>
Session ID: <c:out value="${pageContext.session.id}" /> <br>
<jsp:setProperty name="dateValue" property="time" value="${pageContext.session.creationTime}"/>
Data creazione sessione: <fmt:formatDate type="both" value="${dateValue}" /> <br>
<jsp:setProperty name="dateValue" property="time" value="${pageContext.session.lastAccessedTime}"/>
Ultimo accesso alla sessione:  <fmt:formatDate type="both" value="${dateValue}" /> <br>
Operation: <c:out value="${op}" /><br>
<c:choose>
	<c:when test="${op=='Add'}"> <c:set var="counter" value="${counter+1}" scope="session" /></c:when>
	<c:when test="${op=='Remove'}"> <c:set var="counter" value="${counter-1}" scope="session" /></c:when>
</c:choose>
Valore Contatore: <c:out value="${counter}" /><br>
<form action=<c:out value="${url}" /> method=POST>
<input type="submit" name="Go" value="Add">
<input type="submit" name="Go" value="Remove">
</form>
</body>
</html>