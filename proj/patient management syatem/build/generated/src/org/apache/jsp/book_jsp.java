package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.HashMap;
import java.sql.ResultSet;
import java.util.Iterator;
import java.util.ArrayList;
import pms.Doctor;
import pms.DbConnect;
import pms.Patient;

public final class book_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write('\n');
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");

    String pos=" ";
    String id=" ";
    HttpSession s;
    try{ s =request.getSession();
 pos= s.getAttribute("position").toString();
    id=s.getAttribute("id").toString();
    }
    catch(Exception e)
    {}

      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("   \n");
      out.write("\t<script src=\"javascript.js\"></script>\n");
      out.write("    <head>\n");
      out.write(" <!-- Latest compiled and minified CSS -->\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\" crossorigin=\"anonymous\">\n");
      out.write("\n");
      out.write("<!-- Optional theme -->\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css\" integrity=\"sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp\" crossorigin=\"anonymous\">\n");
      out.write("<link href=\"newcss.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("        \n");
      out.write("\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("\n");
      out.write("\t<title>Personal Info</title>\n");
      out.write("\n");
      out.write("\t<link rel=\"stylesheet\" href=\"demo.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"admin.css\">\n");
      out.write("    </head>\n");
      out.write("    <header>\n");
      out.write("\t\t<h1>Hospital Management System</h1>\n");
      out.write("        <a href=\"Logout\">Logout</a>\n");
      out.write("    </header>\n");
      out.write("      <ul>\n");
      out.write("       <li><a href=\"welcomepatient.jsp\">Personal Info</a></li>\n");
      out.write("        <li><a href=\"book.jsp\"class=\"active\">Book Appointment</a></li>\n");
      out.write("        <li><a href=\"viewuser.jsp\">View Report</a></li>\n");
      out.write("        \n");
      out.write("    </ul>\n");
      out.write("<div class=\"container\">\n");
      out.write("    <div class=\"col-md-1\"></div>\n");
      out.write("    <div class=\"jumbotron col-md-10\">\n");
      out.write("  \n");
      out.write("        <!-- You only need this form and the form-basic.css -->\n");
      out.write("         ");
s=request.getSession();
         String patid=s.getAttribute("id").toString();
         
         
      out.write("\n");
      out.write("          ");
 Patient P=new Patient(patid);    
      out.write("\n");
      out.write("\n");
      out.write("        <form class=\"form-basic\" method=\"post\" action=\"\">\n");
      out.write(" ");

                                    Doctor d = new Doctor();
  
                                ResultSet r=d.getdocdetails();
                                      
                           
      out.write("\n");
      out.write("            <div class=\"form-title-row\">\n");
      out.write("                <h1>Book Appointment</h1>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"row\">\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    \n");
      out.write("                 <td><select name=\"Docdetail\" class=\"docdetailpulldown\" id=\"docdetailpulldwn\">\n");
      out.write("                                 ");
            
                     while(r.next())
                             {
                             
      out.write("\n");
      out.write("                                 <option>\n");
      out.write("                                     ");
      out.print(
                                         r.getString("employee_id") +":" +r.getString("Fname")+":"+r.getString("Lname")+":"+r.getString("department_name")
                                         );
      out.write("\n");
      out.write("                                 </option>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                     </select></td>\n");
      out.write("                             <td>\n");
      out.write("                                 <input type=\"date\" name=\"aptday\" id=\"aptday\"></td>\n");
      out.write("                             <td>\n");
      out.write("    <select name=\"timeslot\"  class=\"timeslotpulldown\" id=\"timeslot\">\n");
      out.write("                        ");
 
                            ArrayList<String> timslots=d.getstimeslotids();
                                        
   Iterator itr  =timslots.iterator();
                                        while(itr.hasNext())
                {
      out.write("\n");
      out.write("                        <option>");
      out.print(itr.next() );
      out.write("</option>\n");
      out.write("                        ");
}
      out.write("\n");
      out.write("                        \n");
      out.write("    </select>   </td>        </tr>\n");
      out.write("            </table>\n");
      out.write("            </div>\n");
      out.write("                                      \n");
      out.write("                        <div class=\"row\" >\n");
      out.write("                             <div  id=\"tbn\" >\n");
      out.write("                             \n");
      out.write("                             CHECK STATUS\n");
      out.write("                             </div>\n");
      out.write("                            <div  id=\"bookappointment\">\n");
      out.write("                             \n");
      out.write("                             BOOK APPOINTMENT\n");
      out.write("                             </div>\n");
      out.write("                                 \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("                     \n");
      out.write("                          <div id=\"confirmedappts\"></div>\n");
      out.write("     <div id=\"appointmntstatus\"></div>  \n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("      <!-- Latest compiled and minified JavaScript -->\n");
      out.write("<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\" integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <link rel=\"stylesheet\" type =\"text/css\" href=\"Header.css\">\n");
      out.write(" <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js\"></script>                  \n");
      out.write("</html>");
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
