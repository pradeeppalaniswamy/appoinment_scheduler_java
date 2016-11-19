<%-- 
    Document   : createappointment
    Created on : May 1, 2016, 5:59:06 PM
    Author     : PRADEEP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="pms.Patient"%>
<%

    
String docdtls=request.getParameter("docdtls");
String dateofapt =request.getParameter("dateofapt");
String timeslot=request.getParameter("timeslot");
        HttpSession s=request.getSession();
           String patid= s.getAttribute("id").toString();
           String timeslotid=request.getParameter("timeslotid");

%>
<html>
    <link rel="stylesheet" type ="text/css" href="newcss.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="javascript.js"></script>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <% Patient P =new Patient(patid);
      int suc=  P.createappoinment(docdtls, patid, dateofapt, timeslotid);
      if(suc<0)
      {
      %>
      <div  class="bg-danger text-primary text-center" ><h4>Error please choose a different date and try again</h4></div>
        <%
      }
else
{%> <div class="bg-success text-primary text-center" ><h4>Appointment booking success</h4></div>
<%
}        %>
    </body>
</html>
