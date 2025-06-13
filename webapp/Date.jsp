<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<meta http-equiv="refresh" content="1">
<head>
<%! String title = "Date and Time";%>
<title>
<%=title%>
</title>
</head>
<body>
<h1><%=title%></h1>

It's <%= (new java.util.Date())%>

</body>
</html>