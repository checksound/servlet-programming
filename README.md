# Servlet Programming

Da: https://web.ing.unimo.it/rlancellotti/reti/

* HTTP e Web dinamico ([pdf](./H-HTTP-new.pdf))
* Web application server Tomcat ([pdf](./I-Tomcat-new.pdf))
* Prima Servlet ([pdf](./J-PrimaServlet.pdf))
* Uso di un'IDE per sviluppo di Servlet: Eclipse ([pdf](./K-Eclipse.pdf))
* Tecnologie JSP e JSTL ([pdf](./L-JSP.pdf))

## Prime Servlet

La sevlet [Esempio1.java](./servlet/Esempio1.java):

```java
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.GenericServlet;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

/**
 * Servlet implementation class Esempio1
 */
public class Esempio1 extends GenericServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see GenericServlet#GenericServlet()
     */
    public Esempio1() {
        super();
    }

	/**
	 * @see Servlet#service(ServletRequest request, ServletResponse response)
	 */
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("Buh!");
        }
        catch (Exception e){ }
	}

}
```
La servlet [Esempio2.java](./servlet/Esempio2.java):

```java
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class Esempio2
 */
public class Esempio2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Esempio2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html");
            HttpSession session = request.getSession(false);
            PrintWriter out = response.getWriter();
            out.println("Buh!  Bhu!");
        }
        catch (Exception e){ }
	}

}
```

Il file [**web.xml**](./webapp/WEB-INF/web.xml), *deployment descriptor*:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app id="WebApp_ID" version="2.4" xmlns="http://java.sun.com/xml/ns/j2ee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee http://java.sun.com/xml/ns/j2ee/web-app_2_4.xsd">
	<display-name>FirstServlet</display-name>
	<welcome-file-list>
		<welcome-file>index.html</welcome-file>
		<welcome-file>index.htm</welcome-file>
		<welcome-file>index.jsp</welcome-file>
		<welcome-file>index.xhtml</welcome-file>
		<welcome-file>default.html</welcome-file>
		<welcome-file>default.htm</welcome-file>
		<welcome-file>default.jsp</welcome-file>
		<welcome-file>default.xhtml</welcome-file>
	</welcome-file-list>
	<servlet>
		<servlet-name>Esempio1</servlet-name>
		<servlet-class>Esempio1</servlet-class>
	</servlet>
	<servlet>
		<servlet-name>Esempio2</servlet-name>
		<servlet-class>Esempio2</servlet-class>
	</servlet>
	<servlet-mapping>
		<servlet-name>Esempio1</servlet-name>
		<url-pattern>/Esempio1</url-pattern>
	</servlet-mapping>
	<servlet-mapping>
		<servlet-name>Esempio2</servlet-name>
		<url-pattern>/Esempio2</url-pattern>
	</servlet-mapping>
</web-app>
```
e il file [*index.html*](./webapp/index.html):
```html
<html>
<head>
	<title>Primi esempi di programmazione Servlet</title>
</head>
<body>
	<h1>Primi esempi di programmazione Servlet</h1>
	<ul>
		<li><a href="./Esempio1">Esempio con GenericServlet</a></li>
		<li><a href="./Esempio2">Esempio con HTTPServlet</a></li>
	</ul>
</body>
</html>
```
Link come configurare eclipse per sviluppare web app 
Link come creare una web app in *eclipse*.

### Esempi con l'utilizzo delle annotation

La servlet [*Calculator.java*](./servlet/Calculator.java):
```java
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calculator
 */
@WebServlet("/Calculator")
public class Calculator extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Calculator() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    protected void printForm(PrintWriter out, String url, String a, String b, String op){
        out.println("<form method=GET action=\""+url+"\">");
        out.print("<input type=text name=a");
        if (a != null){out.print(" value=\""+a+"\"");}
        out.println(" />");
        
        out.println("<select name=operazione>");
        
        out.print("<option value=\"somma\"");
        if ("somma".equals(op)){out.print(" selected");}
        out.println(">+</option>");

        out.print("<option value=\"sottrazione\"");
        if ("sottrazione".equals(op)){out.print(" selected");}
        out.println(">-</option>");
        
        out.print("<option value=\"moltiplicazione\"");
        if ("moltiplicazione".equals(op)){out.print(" selected");}
        out.println(">*</option>");
        
        out.print("<option value=\"divisione\"");
        if ("divisione".equals(op)){out.print(" selected");}
        out.println(">/</option>");
        
	out.println("</select>");

	out.print("<input type=text name=b");
        if (b != null){out.print(" value=\""+b+"\"");}
        out.println(" />");
        out.println("<input type=submit name=\"go\" value=\"calcola\"></input>");  
        out.println("</form>");

    }

    protected String getResult(String a, String b, String op){
    	String res="NA";
    	if (a==null){return res;}
    	if (b==null){return res;}
    	if (op==null){return res;}
    	float fa=Float.valueOf(a);
    	float fb=Float.valueOf(b);
    	if ("somma".equals(op)){res=""+(fa+fb);}
    	if ("sottrazione".equals(op)){res=""+(fa-fb);}
    	if ("moltiplicazione".equals(op)){res=""+(fa*fb);}
    	if ("divisione".equals(op)){
    		if (fb==0){
    			res="division by 0";	
    		} else {
    			res=""+(fa/fb);
    		}
    	}
    	return res;
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		// String url = request.getRequestURL().toString();
		String url = "." + request.getServletPath();
		String a=request.getParameter("a");
		String b=request.getParameter("b");
		String op=request.getParameter("operazione");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        String title = "Calculator";
        out.println("<title>" + title + "</title>");
        out.println("</head>");
        out.println("<body bgcolor=\"white\">");
        out.println("<h1>" + title + "</h1>");
        
        // html della form
        printForm(out, url, a, b, op);

        // calcola il risultato
        String res=getResult(a, b, op);
        
        if (!"NA".equals(res)){
        	out.println("<br>\nThe result is: "+res);
        }
        out.println("</body>");
        out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
```
La servlet [DateServlet.java](./servlet/DateServlet.java):

```java
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DateServlet
 */
@WebServlet("/DateServlet")
public class DateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

     /**
      * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
      */
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<meta http-equiv=\"refresh\" content=\"1\">");
        out.println("<head>");
        String title = "Date and Time";
        out.println("<title>" + title + "</title>");
        out.println("</head>");
        out.println("<body bgcolor=\"white\">");
        out.println("<h1>" + title + "</h1>");
        out.println("It's "+(new java.util.Date()));
        out.println("</body>");
        out.println("</html>");
	}

     /**
      * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
      */
      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
      }

}
```

La sevlet [SessionServlet.java](./servlet/SessionServlet.java):

```java
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.Date;
import java.util.Enumeration;

/**
 * Servlet implementation class SessionServlet
 */
@WebServlet("/SessionServlet")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String Operation;
        String title = "Hello world";
        HttpSession session = request.getSession(true);
        int c;
        out.println("<html>");
        out.println("<head>");
        out.println("<title>" + title + "</title>");
        out.println("</head>");
        out.println("<body bgcolor=\"white\">");
        out.println("<h1>" + title + "</h1>");
        out.println("Session ID: "+session.getId()+"<br>");
        out.println("Data creazione sessione: "+(new Date(session.getCreationTime()))+"<br>");
        out.println("Ultimo accesso alla sessione: "+(new Date(session.getLastAccessedTime()))+"<br>");
        Operation = request.getParameter("Go");
        if (session.getAttribute("Counter") != null){
                c=(int) session.getAttribute("Counter");
        } else {
                c=0;
        }
        out.println("Operation: "+Operation+"<br>");
        if ("Add".equals(Operation)){c++;}
        if ("Remove".equals(Operation)){c--;}
        session.setAttribute("Counter", c);
        out.println("Valore contatore: "+c+"<br>");
        out.println("<p>");
        Enumeration<String> names = session.getAttributeNames();
        while (names.hasMoreElements()) {
            String name = (String) names.nextElement(); 
            String value = session.getAttribute(name).toString();
            out.println(name + " = "+ value + "<br>");
        }
        out.println("</p>");
        out.println("<form action=\""+ "." + request.getServletPath() + "\" method=POST>");
        out.println("<input type=\"submit\" name=\"Go\" value=\"Add\">");
        out.println("<input type=\"submit\" name=\"Go\" value=\"Remove\">");
        out.println("</form>");

        out.println("</body>");
        out.println("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
```

### Esempi JSP (Java Server Pages)


La jsp [*Calculator1.jsp*](./webapp/Calculator1.jsp):

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>

<%!    
    protected void printForm(JspWriter out, String url, String a, String b, String op){
		try {	
	        out.println("<form method=GET action=\""+url+"\">");
	        out.print("<input type=text name=a");
	        if (a != null){out.print(" value=\""+a+"\"");}
	        out.println(" />");        
	        out.println("<select name=operazione>");
	        out.print("<option value=\"somma\"");
	        if ("somma".equals(op)){out.print(" selected");}
	        out.println(">+</option>");
	
	        out.print("<option value=\"sottrazione\"");
	        if ("sottrazione".equals(op)){out.print(" selected");}
	        out.println(">-</option>");
	        
	        out.print("<option value=\"moltiplicazione\"");
	        if ("moltiplicazione".equals(op)){out.print(" selected");}
	        out.println(">*</option>");
	        
	        out.print("<option value=\"divisione\"");
	        if ("divisione".equals(op)){out.print(" selected");}
	        out.println(">/</option>");
	        
			out.println("</select>");
	
			out.print("<input type=text name=b");
	        if (b != null){out.print(" value=\""+b+"\"");}
	        out.println(" />");
	        out.println("<input type=submit name=\"go\" value=\"calcola\"></input>");
	        out.println("</form>");
		} 
		catch (Exception e) {
			e.printStackTrace();	
		}
    }

    protected String getResult(String a, String b, String op){
    	String res="NA";
    	if (a==null){return res;}
    	if (b==null){return res;}
    	if (op==null){return res;}
    	float fa=Float.valueOf(a);
    	float fb=Float.valueOf(b);
    	if ("somma".equals(op)){res=""+(fa+fb);}
    	if ("sottrazione".equals(op)){res=""+(fa-fb);}
    	if ("moltiplicazione".equals(op)){res=""+(fa*fb);}
    	if ("divisione".equals(op)){
    		if (fb==0){
    			res="division by 0";	
    		} else {
    			res=""+(fa/fb);
    		}
    	}
    	return res;
    }
    
%>    

<%		String url = request.getRequestURL().toString();
		String a=request.getParameter("a");
		String b=request.getParameter("b");
		String op=request.getParameter("operazione");
        String title = "Calculator";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>
<%=title%>
</title>
</head>
<body>
<h1><%=title%></h1>

        <% printForm(out, url, a, b, op);
        String res=getResult(a, b, op);
        if (!"NA".equals(res)){%>
        	<br>The result is: <%=res%>
        <%}%>
</body>
</html>
```

La jsp [*Calculator2.jsp*](./webapp/Calculator2.jsp):

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%!    
    protected String getResult(String a, String b, String op){
    	String res="NA";
    	if (a==null){return res;}
    	if (b==null){return res;}
    	if (op==null){return res;}
    	float fa=Float.valueOf(a);
    	float fb=Float.valueOf(b);
    	if ("somma".equals(op)){res=""+(fa+fb);}
    	if ("sottrazione".equals(op)){res=""+(fa-fb);}
    	if ("moltiplicazione".equals(op)){res=""+(fa*fb);}
    	if ("divisione".equals(op)){
    		if (fb==0){
    			res="division by 0";	
    		} else {
    			res=""+(fa/fb);
    		}
    	}
    	return res;
    }
    
%>    

<%		String url = request.getRequestURL().toString();
		String a=request.getParameter("a");
		String b=request.getParameter("b");
		String op=request.getParameter("operazione");
                String title = "Calculator";
%>
<title>
<%=title%>
</title>
<head>
<body>
	<h1><%=title%></h1>
	<form method=GET action=<%=url%> >
		<input type=text name="a" value="<%=(a != null)?a:"" %>" />
		<select name=operazione>
			<option value="somma" <%=("somma".equals(op))?"selected":"" %> >+</option>
			<option value="sottrazione" <%=("sottrazione".equals(op))?"selected":"" %> >-</option>
			<option value="moltiplicazione" <%=("moltiplicazione".equals(op))?"selected":"" %> >*</option>
			<option value="divisione" <%=("divisione".equals(op))?"selected":"" %> >/</option>
		</select>
		<input type=text name="b" value="<%=(b != null)?b:"" %>" />
		<input type=submit name="go" value="calcola"></input>
	</form>
    <%
    String res=getResult(a, b, op);
    if (!"NA".equals(res)){%>
    	<br>The result is: <%=res%>
    <%}%>
</body>
</html>
```

La jsp [*Date.jsp*](./webapp/Date.jsp):

```jsp
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
```

La jsp [*Session.jsp*](./webapp/Session.jsp):

```jsp
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
```

### Esempi JSP con JSTL

La jsp [*CalcolatriceJSTL.jsp*](./webapp/CalcolatriceJSTL.jsp):

```jsp
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
```
La jsp [*DateJSTL.jsp*](./webapp/DateJSTL.jsp):

```jsp
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
```

La jsp [*SessionJSTL*](./webapp/SessionJSTL.jsp):

```jsp
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
```


[Java Servlets by Example: Lifecycle, Practical Implementations, and Best Practices (2025)](https://www.upgrad.com/blog/servlet-program-in-java/)
