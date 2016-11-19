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
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="javascript.js"></script>
    <head>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<link href="newcss.css" rel="stylesheet" type="text/css"/>
        
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Personal Info</title>

	<link rel="stylesheet" href="demo.css">
	<link rel="stylesheet" href="admin.css">
    </head>
    <header>
		<h1>Hospital Management System</h1>
        <a href="Logout">Logout</a>
    </header>
      <ul>
       <li><a href="welcomepatient.jsp">Personal Info</a></li>
        <li><a href="book.jsp"class="active">Book Appointment</a></li>
        <li><a href="viewuser.jsp">View Report</a></li>
        
    </ul>
<div class="container">
    <div class="col-md-1"></div>
    <div class="jumbotron col-md-12">
  
        <!-- You only need this form and the form-basic.css -->
         <%s=request.getSession();
         String patid=s.getAttribute("id").toString();
         
         %>
          <% Patient P=new Patient(patid);    %>
          <div class="col-md-1"></div>
          <div class="jumbotron whitebck col-md-10"> 
 <%
                                    Doctor d = new Doctor();
  
                                ResultSet r=d.getdocdetails();
                                      
                           %>
            
               <h2 class="text-center text-primary"> <u>Book Appointment</u></h2>
            
            <div class="row margintop20">
                
                <div class="form-group">
                    <div class="row margintop20">
    <label for="Doctorn">DOCTOR NAME AND SPECIALIZATION</label>
    <select name="Docdetail"  class="form-control" id="docdetailpulldwn" required>
                                 <%            
                     while(r.next())
                             {
                             %>
                                 <option>
                                     <%=
                                         r.getString("employee_id") +":" +r.getString("Fname")+":"+r.getString("Lname")+":"+r.getString("department_name")
                                         %>
                                 </option>
                        <%}%>
                     </select>
                    </div>
                     <div class="row margintop20">
                     <label for="DAY">CHOOSE APPROPRIATE DAY</label>
                     <input type="date" name="aptday" id="aptday" class="form-control" required></div> <div class="row margintop20">
    <label for="TIMESL">CHOOSE APPROPRIATE TIME SLOT</label>
    <select name="timeslot"  class="form-control" id="timeslot" required>
                        <% 
                            ArrayList<String> timslots=d.getstimeslotids();
                                        
   Iterator itr  =timslots.iterator();
                                        while(itr.hasNext())
                {%>
                        <option><%=itr.next() %></option>
                        <%}%>
                        
    </select> </div>
                        <div class="row margintop20" >
                             
                            
                            <button class="btn btn-primary btn-lg"  id="bookappointment">BOOK APPOINTMENT</button>
                                
                                <button class="btn btn-success btn-lg" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">CHECK STATUS</BUTTON>
                        </div>
                        
                </div>
           
            </div>
                                      
                        <div class="collapse" id="collapseExample">
  <div class="card card-block">
                        <div class="text-center text-muted" >
                        <h4>    
    <table  class="table table-hover col-md-12">
          
                <thead>
                    <tr class="info">
                        <td>Appnt#</td>
                        <td>Doctor name</td>
                        <td>Date</td>
                        <td>Time</td>
                        <td>Status</td>
                    </tr>
                </thead>
           <tbody>
        
        <%
            int i=0;
           
           
            Patient p= new Patient();
            ResultSet R=p.Getallpatientappointments(patid);
while(R.next())        {
    
String status=R.getString("confirmation");
    
if( status.equalsIgnoreCase("bkd"))
{
        %>
        
        <tr class="warning">                  
                       <td><%= R.getInt("appointmentid")%></td>
                        <td><%= R.getString("fname")%></td>
                        <td><%= R.getString("day")%></td>
                        <td><%= R.getString("value")%></td>
                        <td>NEW</td>
                    </tr>
                
            
     
 <%}
else if(status.equalsIgnoreCase("apr"))
{
%>
    
          
                
                    <tr class="success">
                        <td><%= R.getInt("appointmentid")%></td>
                        <td><%= R.getString("fname")%></td>
                        <td><%= R.getString("day")%></td>
                        <td><%= R.getString("value")%></td>
                        <td>Confirmed</td>
                    </tr>
                
            


                        <%}
else if(status.equalsIgnoreCase("rej"))
{
%>

<tr class="error">
                        <td><%= R.getInt("appointmentid")%></td>
                        <td><%= R.getString("fname")%></td>
                        <td><%= R.getString("day")%></td>
                        <td><%= R.getString("value")%></td>
                        <td>Rejected</td>
                    </tr>
                
 
                        
                        
        <%


}}
       
      %>       
        

                            
        </tbody></table>         
                        
                        </h4>
                        
</div>
  </div></div>
      <div id="appointmntstatus1"></div>
</div>
                        
  
  

                        </div>
          </div>
      
      <!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" type ="text/css" href="Header.css">
                  
</html>