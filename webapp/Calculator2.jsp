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
	