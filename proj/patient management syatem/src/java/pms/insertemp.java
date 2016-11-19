/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pms;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aswin
 */
@WebServlet(name = "insertemp", urlPatterns = {"/insertemp"})
public class insertemp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String pid=request.getParameter("pid");
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
            String mname=request.getParameter("mname");
            String email=request.getParameter("email");
            String gender=request.getParameter("dob");
            String dob=request.getParameter("date");
            String rov=request.getParameter("rov");
            String bg=request.getParameter("Bloodgroup");
            String username=request.getParameter("user");
            String password=request.getParameter("pass");
            String phoneno=request.getParameter("pno");
            BAL bal=new BAL();
            
                             SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                         java.util.Date parsed = null;
                         java.sql.Date apmntdate=null;

                 try{
        parsed = format.parse(dob);
                 }
                 catch(Exception e){
                 String mes = e.getMessage();
                 }
                 try{
        apmntdate = new java.sql.Date(parsed.getTime());}
                 catch(Exception e)
                 {
                 String mes = e.getMessage();
                 
                 }

           // String Patientid,String rov,String mname,String dob,String fname,String lname,String gender,String phoneno,String email,String blooggroup,String user,String pass
          int suc=  bal.newuser(pid,rov, mname, apmntdate, fname, lname, gender, phoneno, email, bg, username, password);
            if(suc>0)
         {
         
   request.setAttribute("message","Employee Added Auccessfully");
request.getRequestDispatcher("index.jsp").forward(request,response);      

         }
         else
         {
   request.setAttribute("message1","Employee not Added Successfully! Try Again");
request.getRequestDispatcher("register.jsp").forward(request,response);      
         
         }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet insertemp</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet insertemp at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
