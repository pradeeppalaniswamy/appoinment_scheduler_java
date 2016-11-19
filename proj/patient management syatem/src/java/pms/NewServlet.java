/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pms;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PRADEEP
 */


@WebServlet(name = "NewServlet", urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
 private Statement st;
	public NewServlet()
	{ 

		}


        

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
     String userid=request.getParameter("username");       
 String password=request.getParameter("password");
     boolean
            flag=false;   
    String[] Roles={"Patient","Admin","Doctor","Nurse","Guest","financier"};
    String username="";
    int positionid=0; //value 2
    ResultSet R,R1;
    DbConnect db=new DbConnect();
            try {
                 Connection c=db.getConnection();
                 st=c.createStatement();
            
                 if(userid.startsWith("e"))
                 {
         R=st.executeQuery("select Fname,typeid from employeee where employee_id='"+request.getParameter("username")+"' and password='"+request.getParameter("password")+"';");		
        
        while(R.next())
    {
        username= R.getNString("Fname");
        flag=true;
        positionid=R.getInt("typeid");
        /* R1=st.executeQuery("select typeid from employeee employee_id ='"+username+"';");
        
        while(R1.next())
        {
         positionid=Integer.parseInt(R1.getNString("typeid"));
        }
        */
                
    }
            
        
    }
                 else if(userid.startsWith("p"))
                 {  
                            
                      R=st.executeQuery("select fname from patient where patientid='"+userid+ "'and password='"+password+"';");
        
        while(R.next())
    {
        username= R.getNString("fname");
        positionid=0;
        flag=true;
       // positionid=0;
    }
                     
                 
                 }
                 
                 else {flag=false;}
                 
            }
            catch(Exception E){
        String m=E.getMessage();
}    
            HttpSession s=request.getSession();
            s.setAttribute("id",userid );
    if(flag)
    {
       

       s.setAttribute("username",username);
s.setAttribute("position", Roles[positionid]);
if(positionid==1){
response.sendRedirect("welcomeadmin.jsp");
    }
else if(positionid==2)
{
    response.sendRedirect("welcomedoctor.jsp");
}
else if(positionid==0)
{
    response.sendRedirect("welcomepatient.jsp");
}
    }
    else
    {
   request.setAttribute("message","acc is invalid");
request.getRequestDispatcher("index.jsp").forward(request,response);      

    }
  
            
          
  //  out.print("hello world");
                     
//    out.println("<h1> hello "+k+"</h1>");
          //  out.println("</head>");
            //out.println("<body>");
    //        out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
            //out.println("</body>");
            //out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
         response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
HttpSession s=request.getSession();
s.removeAttribute("username");
//s.getAttribute("position");
s.invalidate();
response.sendRedirect("login.jsp");

            /*
            TODO output your page here. You may use following sample code. */
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
        
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        }
      
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
