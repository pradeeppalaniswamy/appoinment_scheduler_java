<%@page import="java.util.HashMap"%>
<%-- 
    Document   : welcome
    Created on : Apr 15, 2016, 12:06:16 PM
    Author     : PRADEEP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pms.Doctor"%>
<%@page import="pms.DbConnect"%>
<%@page import="pms.Patient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String pos=" ";
    String id=" ";
    HttpSession s;
    try{ s =request.getSession();
 pos= s.getAttribute("position").toString();
    id=s.getAttribute("id").toString();
    }
    catch(Exception e)
    {}
%>

<html>
    <link rel="stylesheet" type ="text/css" href="Header.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="javascript.js"></script>
    <head>
        
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
                <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

	<title>Add report</title>

	<link rel="stylesheet" href="demo.css">
	<link rel="stylesheet" href="admin.css">
    </head>
    <header>
		<h1>Hospital Management System</h1>
        <a href="Logout">Logout</a>
    </header>
      <ul>
       <li><a href="welcomedoctor.jsp">Personal Info</a></li>
        <li><a href="patientsearch.jsp">Patient Search</a></li>
        <li><a href="Appointments.jsp">Appointments</a></li>
        <li><a href="viewreport.jsp">View Report</a></li>
        <li><a href="addreport.jsp"class="active">Add Report</a></li>
    </ul>
    <div class="main-content">

        <!-- You only need this form and the form-basic.css -->
      

        
        <form name="fileform" class="form-basic" method="post" action="uploadServlet" enctype="multipart/form-data">                  
   <div class="form-title-row">
                <h1>Add Report</h1>
            </div>
                        
                        
                     <div class="imgupload">
        
 <table><tr><td>              <label for="imgdesc">image description:</label>
         </td> <td>        <input type="text" name="imgdescription" size="50" placeholder="Enter Your description" required/></td></tr>
 <br><br>
 <tr><td>     <label for="photo"> Scanned image:  </label></td>
     <td>       <input type="file" name="photo" size="50" placeholder="Upload Your Image" /></td></tr><br><br>
 </table>
             <%Patient p = new Patient();
    ArrayList<String> patid= p.getAllpatids();
  Iterator itr  = patid.iterator();
  %>
    <table border="0" class="table table-hover">
        <thead>
            <tr>
                <th><input type="text" name=" patientnumber" value="Choose Patient Number" /></th>
                <th><select name="addreportpatientid" class="addreport" id="addreportpatidpulldown">
                        <% while(itr.hasNext()){%>
                        <option><%=itr.next() %></option>
                        <%}%>
                    </select></th>
            </tr>
        </thead>
    </table>    
 
            
            <input type="submit" value="Save"/>
        
        </div>
                                                                 </form>  

                       
                    </div>

</html>
                   