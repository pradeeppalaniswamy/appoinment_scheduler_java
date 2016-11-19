/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pms;

import java.io.*;
import java.sql.*;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
//@MultipartConfig(maxFileSize = 16177215);
/**
 *
 * @author PRADEEP
 */
//@MultipartConfig(maxFileSize = 16177215) 
@MultipartConfig
@WebServlet(name = "uploadServlet", urlPatterns = {"/uploadServlet"})
public class uploadServlet extends HttpServlet {

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
        String name =request.getParameter("name");
  String message = null;
   String patientid=request.getParameter("addreportpatientid");
   String description = request.getParameter("imgdescription");
    InputStream inputStream = null; // input stream of the upload file
                // obtains the upload file part in this multipart request
     Part filePart = request.getPart("photo");
      String kk="kkemptty";
      java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());      
      Connection conn=null;
      String filepartdet ="";
        if (filePart != null) 
        {
            filepartdet="image present";}
            inputStream = filePart.getInputStream();
       // message will be sent back to client
        try {
            // connects to the database
			DbConnect con=new DbConnect();
            conn = con.getConnection();
            // constructs SQL statement
            String sql = "INSERT INTO scanimages (imgdescription, photo,patientid,dateofimage) values ( ?, ?,?,?)";
            //Using a PreparedSt    atement to save the file
            PreparedStatement pstmtSave = conn.prepareStatement(sql);
            pstmtSave.setString(1, description);
            pstmtSave.setString(3,patientid);
            pstmtSave.setDate(4,date);
            if (inputStream != null) {
                pstmtSave.setBlob(2, inputStream);
   
            }
            //sends the statement to the database server
            int row = pstmtSave.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
            else
            {
            message="message not uploaded";
            }
            
    }catch(Exception E)
    {
    message=message+E;
    }
         
   request.setAttribute("message5","image added successfully");
request.getRequestDispatcher("viewreport.jsp").forward(request,response);      

        /* }
         else
         {
   request.setAttribute("message2","Unable to edit! Try Again");
request.getRequestDispatcher("welcome.jsp").forward(request,response);      
         
         }*/
        
        
     
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet uploadServlet</title>");            
            out.println("</head>");
            out.print("description               ");
            out.printf(description+"                ");
            out.print("name");
            out.print(name);
          out.println(message);
          out.print(filepartdet);
          out.print("kvalue" +kk);
            out.println("<body>");
            out.println("<h1>Servlet uploadServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);}
     /*     String message = null;
            
                    String description = request.getParameter("imgdescription");
      InputStream inputStream = null; // input stream of the upload file
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        String kk=" kkemptty";
        String filepartdet ="";
        if (filePart != null) {
            // prints out some information for debugging
           /// System.out.println(filePart.getName());
            //System.out.println(filePart.getSize());
           // System.out.println(filePart.getContentType());
            filepartdet="image present";
            inputStream = filePart.getInputStream();
        Connection conn = null; // connection to the database
        // message will be sent back to client
        try {
            // connects to the database
			DbConnect con=new DbConnect();
            conn = con.getConnection();
            // constructs SQL statement
            String sql = "INSERT INTO scanimages (imgdescription, photo) values ( ?, ?)";
            //Using a PreparedSt    atement to save the file
            PreparedStatement pstmtSave = conn.prepareStatement(sql);
            pstmtSave.setString(1, description);
            if (inputStream != null) {
                //files are treated as BLOB objects in database
                //here we're letting the JDBC driver
                //create a blob object based on the
                //input stream that contains the data of the file
                pstmtSave.setBlob(2, inputStream);
            }
            //sends the statement to the database server
            int row = pstmtSave.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
            else
            {
            message="message not uploaded";
            }
            
    }catch(Exception E)
    {
    message=message+E;
    }
        
        
        }
        else
        {  //kk=filePart.toString();
            filepartdet="image not fetched";
            try{
              
                String fname="H:\\11.jpg";
                File imgfile = new File(fname);
            FileInputStream fin = new FileInputStream(imgfile);
            DbConnect con=new DbConnect();
           Connection conn = con.getConnection();
             PreparedStatement pre =
		   conn.prepareStatement("INSERT INTO scanimages (imgdescription, photo) values ( ?, ?);");
		   pre.setString(1,description);		 
		   pre.setBinaryStream(2,(InputStream)fin,(int)imgfile.length());
		   pre.executeUpdate();
                    }
            catch(Exception e)
            {
            message=message+"inside second option "+e;
            }
        }
      
        
        
        
    }*/
//           String description = request.getParameter("imgdescription");
//        InputStream inputStream = null; // input stream of the upload file
//        // obtains the upload file part in this multipart request
//        Part filePart = request.getPart("photo");
//        if (filePart != null) {
//            // prints out some information for debugging
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
//
//            inputStream = filePart.getInputStream();
//        }
//            
//        Connection conn = null; // connection to the database
//        String message = null; // message will be sent back to client
//        try {
//            // connects to the database
//			DbConnect con=new DbConnect();
//            conn = con.getConnection();
//            // constructs SQL statement
//            String sql = "INSERT INTO scanimages (imgdescription, photo) values ( ?, ?)";
//            //Using a PreparedStatement to save the file
//            PreparedStatement pstmtSave = conn.prepareStatement(sql);
//            pstmtSave.setString(1, description);
//            if (inputStream != null) {
//                //files are treated as BLOB objects in database
//                //here we're letting the JDBC driver
//                //create a blob object based on the
//                //input stream that contains the data of the file
//                pstmtSave.setBlob(2, inputStream);
//            }
//            //sends the statement to the database server
//            int row = pstmtSave.executeUpdate();
//            if (row > 0) {
//                message = "File uploaded and saved into database";
//            }
//            
//    }
//        catch (Exception e)
//        {
//            
//        }}
//    

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
