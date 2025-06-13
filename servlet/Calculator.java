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
