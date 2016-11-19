package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("     <link rel=\"stylesheet\" type =\"text/css\" href=\"indexstyle.css\">\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js\"></script>\n");
      out.write("\t<script src=\"javascript.js\"></script>\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");


String S=" ";
 try{
            HttpSession s=request.getSession();
           
S=s.getAttribute("username").toString();
            }
            catch(Exception e)
            {}
        
      out.write("\n");
      out.write("        ");
if(S.equals(" ")){
      out.write("\n");
      out.write("    \n");
      out.write("        <form name=\"form1\" action=\"NewServlet\" method=\"POST\">\n");
      out.write("     \n");
      out.write("\n");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${message}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\n");
      out.write("     <h4> Login Information </h4>\n");
      out.write("  <input class=\"name\" type=\"text\" id=\"user\" name=\"username\" placeholder=\"Enter Username\"/>\n");
      out.write("  <input class=\"pw\" type=\"password\" id=\"pass\"  name=\"password\" placeholder=\"Enter Password\"/>\n");
      out.write("  <li><a href=\"register.jsp\" class=\"button1\">Register</a></li>\n");
      out.write("  <input class=\"button\" type=\"submit\" value=\"SUBMIT\" id=\"btn1\"/>\n");
      out.write("   </form>\n");
      out.write("    ");
} else {
HttpSession s=request.getSession();
s.removeAttribute("username");
//s.getAttribute("position");
s.invalidate();
response.sendRedirect("index.jsp");

    
    
      out.write("\n");
      out.write("     ");
} 
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
