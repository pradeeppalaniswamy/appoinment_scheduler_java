<%-- 
    Document   : allappointments
    Created on : May 1, 2016, 7:59:19 PM
    Author     : PRADEEP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="pms.Patient"%>
<html>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="javascript.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
          <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="javascript.js"></script>


    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
            <div id="total">
        <div class="patientappointmenthdr">
    <table border="0" class="table table-hover">
          
                <tbody>
                    <tr>
                        <td>Appnt#</td>
                        <td>Doctor name</td>
                        <td>Date</td>
                        <td>Time</td>
                        <td>Status</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <%
            int i=0;
            HttpSession s=request.getSession();
           String patid= s.getAttribute("id").toString();
            Patient p= new Patient();
            ResultSet R=p.Getallpatientappointments(patid);
while(R.next())        {
    
String status=R.getString("confirmation");
    
if( status.equalsIgnoreCase("bkd"))
{
        %>
        
        <div class="patientappointmentnew">
            <table border="0" class="table table-hover">
          
                <tbody>
                    <tr>
                        <td><%= R.getInt("appointmentid")%></td>
                        <td><%= R.getString("fname")%></td>
                        <td><%= R.getString("day")%></td>
                        <td><%= R.getString("value")%></td>
                        <td>NEW</td>
                    </tr>
                </tbody>
            </table>
        </div>
 <%}
else if(status.equalsIgnoreCase("apr"))
{
%>
<div class="patientappointmentapr">
    
    <table border="0"class="table table-hover" >
          
                <tbody>
                    <tr>
                        <td><%= R.getInt("appointmentid")%></td>
                        <td><%= R.getString("fname")%></td>
                        <td><%= R.getString("day")%></td>
                        <td><%= R.getString("value")%></td>
                        <td>Confirmed</td>
                    </tr>
                </tbody>
            </table>
</div>

                        <%}
else if(status.equalsIgnoreCase("rej"))
{
%>
<div class="patientappointmentrej">
    
    <table border="0" class="table table-hover">
          
                <tbody>
                    <tr>
                        <td><%= R.getInt("appointmentid")%></td>
                        <td><%= R.getString("fname")%></td>
                        <td><%= R.getString("day")%></td>
                        <td><%= R.getString("value")%></td>
                        <td>Rejected</td>
                    </tr>
                </tbody>
            </table>
</div>
            </div>
 
                        
                        
        <%


}}
       
      %>       
        </body>
</html>
