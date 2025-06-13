<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%! String title = "Session Example";%>
<title>
<%=title%>
</title>
</head>
<body>
<h1><%=title%></h1>
Session ID: <%=session.getId()%> <br>
Data creazione sessione: <%=(new Date(session.getCreationTime()))%> <br>
Ultimo accesso alla sessione: <%=(new Date(session.getLastAccessedTime()))%> <br>
<%! String Operation;%>
<%! int c;%>
<%
                Operation = request.getParameter("Go");
                if (session.getAttribute("Counter") != null){
                        c=((Integer) session.getAttribute("Counter")).intValue();
                } else {
                        c=0;
                }
%>
Operation: <%=Operation%> <br>
<%
                if ("Add".equals(Operation)){c++;}
                if ("Remove".equals(Operation)){c--;}
                session.setAttribute("Counter", c);
%>
Valore contatore: <%=c%> <br>
<p>
<%
        Enumeration<String> names = session.getAttributeNames();
        while (names.hasMoreElements()) {
            String name = (String) names.nextElement(); 
            String value = session.getAttribute(name).toString();
            out.println(name + " = "+ value + "<br>");
        }
%>
</p>
<form action="<%=request.getRequestURI()%>" method=POST>
<input type="submit" name="Go" value="Add">
<input type="submit" name="Go" value="Remove">
</form>

</body>
</html>