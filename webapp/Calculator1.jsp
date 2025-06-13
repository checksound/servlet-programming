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
