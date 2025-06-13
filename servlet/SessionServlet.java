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
