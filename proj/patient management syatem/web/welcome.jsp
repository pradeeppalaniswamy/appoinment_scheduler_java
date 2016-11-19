




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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome !!</title>
        <!-- <a href="NewServlet" >Logout</a> -->
    </head>
    <body>
<div class="maindiv">        
        
    <!--
    <div class ="commonpannel" ></br>
         
            
            <div class="logoutbtn">   <a href="Logout" >Logout</a></div>
        </div> 
       -->
       <header>
		<h1>Hospital Management System</h1>
                <h3>Hi ${sessionScope.username}</h3>
        <a href="NewServlet">Logout</a>
    </header>
        <div class="sidepane">
            </div>
            <%
                if(pos.equalsIgnoreCase("doctor"))
        {%>

        <div class="docmain" id="docmainid">
            
            <div class="docpanel">
                <ul class="doc"> <li  id="docpersolanopt">Personal Info </li>
                    <li  id="patientsearchopt">Patient search </li>
                    <li id="veiwappointmentsopt">  Appointments </li>
                    <li id="viewreportopt"> View Report  </li>
                    <li id ="addoreditreportopt">Edit/Add Reoprt</li>
                </ul>
                </div>
            <div id="personalinfodiv"> 
                <form method="post" action="updateemp"><table  width="30" id="Docpersonaldetails">
                   <%
                       Doctor D = new Doctor(id);
                       
                   %>
                    <tbody>
                        <tr>
                            <td><input type="text" name="Fnamelabel" value="FirstName" readonly="readonly"/></td>
                            <td><input type="text" name="Firstname" id="fname" value="<%= D.Firstname %>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="Lname" value="LastName" readonly="readonly"/></td>
                            <td><input type="text" name="LastName" value="<%= D.LastName %>"readonly="readonly" /></td>
                        
                        </tr>
                        <tr>
                            <td><input type="text" name="Phonenumber" value="Phone Number" /></td>
                            <td><input type="text" name="PhoneNumber" id="pno" value="<%= D.phonenum %>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="Email" value="Email" /></td>
                            <td><input type="text" name="Email" id="mail" value="<%= D.email %>" readonly="readonly"/></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="Dept" value="Department" /></td>
                            <td><input type="text" name="Department" value="<%= D.Department %>"readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="Designation" value="<%= D.Designation %>" readonly="readonly" /></td>
                            <td><input type="text" name="Design" value="Designation" /></td>
                        </tr>
                        <tr>
                                <td><input type="text" name="BldGRp" value="BloodGroup" /></td>
                            <td><input type="text" name="BloodGroup" id="bgr" value="<%= D.bloodgroup %>" readonly="readonly"/></td>
                        
                        </tr>
                        <tr>
                            <td><input type="text" name="usrname" value="UserName" /></td>
                            <td><input type="text" name="username" id="us" value="<%=D.username%>" readonly="readonly" /></td>
                          
                        </tr>
                        <tr>
                            
                            <td><input type="text" name="password" value="Password" /></td>
                            <td><input type="password" name="password" id="pw" value="<%= D.password %>" readonly="readonly" disabled="disabled" /></td>
                           
                        </tr>
                       <tr>
                            <td><input type="text" name="Empid" value="EmployeeID" /></td>
                            <td><input type="text" name="employeeid" value="<%= D.EmployeeId %>" /></td>
                        </tr>
                        
                        <tr>
                            <td><div class="editdiv" id="edtbtn">EDIT</div></td>
                            <td><div class="editdiv"><input type="submit" value="save"></div></td>
                        </tr>
                    </tbody>
                </table>
                            <div class="message">${message2}</div>
                            </form>
                            
            </div>
<div id ="patientsearchdiv">  patientsearchdiv
  <%Patient p = new Patient();
   ArrayList<String> patid= p.getAllpatids();
  Iterator itr  =patid.iterator();
  %>
    <table border="1">
        <thead>
            <tr>
                <th><input type="text" name=" patientnumber" value="Choose Patient Number" /></th>
                <th><select name="patientid" class="businessTypePullDown" id="patid">
                        <% while(itr.hasNext()){%>
                        <option><%=itr.next() %></option>
                        <%}%>
                    </select></th>
            </tr>
        </thead>
    </table>    
        <div id ="patientdetailsin">
         


</div>
</div>
                    <div id="addoreditreportdiv">   add oredit report
 
                        
                        
                     <div class="imgupload">
        <form name="fileform" method="post" action="uploadServlet" enctype="multipart/form-data">
            <label for="imgdesc">image descrition:</label>
            <input type="text" name="imgdescription" size="50" placeholder="Enter Your description" required/><br><br>
              <label for="photo"> Scanned image:  </label>
            <input type="file" name="photo" size="50" placeholder="Upload Your Image" /><br><br>
 
             <% p = new Patient();
    patid= p.getAllpatids();
   itr  = patid.iterator();
  %>
    <table border="1">
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
        </form>
        </div>
   
                    
                    </div>
            <div id ="veiwappointmentdiv"> viewappointments
 
  <table border="0" class="docappoinments">
    <tbody>
<tr>
    <td class="apptid">AppointmentId</td>
<td class="fname">Name of Patient</td>
<td class="date">Date</td>
<td class="time">Time</td>
<td class="aprej"></td>
<td class="aprej"></td>
    </tbody>
 </table>
            <%
                 ResultSet R=D.getappoinments();
if(R==null)
{%><h1>No pending  Appointments Found</h1>

<%}
else{
        
           try
{
            while(R.next())
{%>
            
<div class="docappoinmentsdiv">
<table border="0" class="docappoinments">
    <tbody>
<tr>
    <td class="apptid" ><%=R.getString("appointmentid")%></td>
<td class="fname" ><%=R.getString("fname")%></td>
<td class="date"><%=R.getString("day")%></td>
<td class="time"><%=R.getString("value")%></td>
<td class="aprej" > <div class="approvediv" id = "<%=R.getString("appointmentid")%>"><a href="#">Approve</a> </div></td>
<td class="aprej"> <div class="rejectdiv"  id = "<%=R.getString("appointmentid")%>"><a href="#" >Rejct</a>  </div></td>
</tr>
</tbody>
</table>
</div>
<% }
}
catch(Exception e)
{
%>
<h1><%=e.toString()%>

<%
}
}
%>
           

            </div>
<div id="viewreportdiv">viewreport 
 <%    patid = p.getAllpatids();
   itr  =patid.iterator();
  %>
    <table border="1">
        <thead>
            <tr>
                <th><input type="text" name=" patientnumber" value="Choose Patient Number" /></th>
                <th><select name="patientid" class="pidpull" id="patidimg">
                        <% while(itr.hasNext()){%>
                        <option><%=itr.next() %></option>
                        <%}%>
                    </select></th>
            </tr>
        </thead>
    </table>    
 
                    <div id="scanimagesdiv"></div>
    <%  
%>
 
    <table border="1">
        <thead>
            <tr>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>



</div>
                <div class="patientselect" id="patientselect">            </div>
                <div class ="reportimage">
            
           
            
            </div>
        <h1> Welcome Dr ${sessionScope.username}</h1>
        
         ${sessionScope.postion} Login!
        login welcome ${sessionScope.username}
            
        </div>
        <% } %> 
   <%
     if(pos.equalsIgnoreCase("patient"))
     {%>
     <div class="patmain" id="patmain">
     
         
         
            
            <div class="patpanel">
                <ul class="pat"> 
                    <li  id="patpersonal"> Personal Info </li>
                    <li id="patbookappointments">  Appointments </li>
                    <li id="patviewreport"> View Report  </li>
                       
                </ul>
                </div>
         <div id ="patpersonaldiv">  patpersonalinfo
         
         <%s=request.getSession();
         String patid=s.getAttribute("id").toString();
         
         %>
          <% Patient P=new Patient(patid);    %>
                           <form method="post" action="editpatient">
 <table border="1">
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                     <td><input type="text" name="usrname" value="UserName" /></td>
                            <td><input type="text" name="username" value="<%=P.username%>" readonly="readonly" /></td>
                    <tr>
                        <td><input type="text" name="fname" value="fname" /></td>
                        <td><input type="text" name="usrname" value="<%=P.fname %>" readonly="readonly"</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="lname" value="lname" /></td>
                        <td><input type="text" name="lname" value="<%= P.lname %>" readonly="readonly"</td>
                    </tr>
                    <tr>
                        <td><input type="date" name="dob" value="dob" /></td>
                        <td><input type="date" name="dob" value="<%=  P.dob %>" readonly="readonly"</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="pid1" value="pid" /></td>
                        <td><input  type="pid" name="pid" value=<%= P.PatientId %> readonly="readonly" ></td>
                    </tr>
                    
                    <tr>
                        <td><input type="text" name="user1" value="user" /></td>
                        <td><input type="text" name="user" id="unam" value="<%= P.username %>" readonly="readonly" </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="pass1" value="pass" /></td>
                        <td><input type="text" name="pass" id="passw" value="<%= P.password %>" readonly="readonly"</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="gender1" value="gender" /></td>
                        <td><input type="text" name="gender" value="<%= P.gender %>" readonly="readonly"</td>
                    </tr>
                    
                    <tr>
                        <td><input type="text" name="rov1" value="rov" /></td>
                        <td><input type="text" name="rov" value="<%= P.reasonofvisit %>" readonly="readonly"</td>
                    </tr>
                    
                  
                    <tr>
                        <td><input type="text" name="bg1" value="bg" /></td>
                        <td><input type="text" name="bg" id="bgrp" value="<%= P.bloodgroup %>" readonly="readonly"</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="pno1" value="pno" /></td>
                        <td><input type="text" name="pno" id="ph" value="<%= P.PhoneNumber %>" readonly="readonly" </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="email1" value="email" /></td>
                        <td><input type="text" name="email" id="maill" value="<%= P.email %>" readonly="raedonly"</td>
                    </tr>
                </tbody>
 </table>
 <input type="submit" value="save">                           </form>
                    <div id="changetype" class="editdiv">Edit</div>>
                            <div class="message">${message3}</div>                       
 
         </div>
                        
         <div id="patbookappointmentsdiv"> bookappointment
             
                                <%
                                    Doctor d = new Doctor();
  
                                ResultSet r=d.getdocdetails();
                                      
                           %>
		                <div class="docdets">
                    
                           <table border="0" class="appointnmnttable">
                   
                    <tbody>
                        <tr>
                            <td>
                        				 
			     <select name="Docdetail" class="docdetailpulldown" id="docdetailpulldwn">
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
                   
                     </td>
                            <td><input type="date" name="aptday" id="aptday"></td>
                           
                            <td>
                                <select name="timeslot"  class="timeslotpulldown" id="timeslot">
                        <% 
                            ArrayList<String> timslots=d.getstimeslotids();
                                        
   Iterator itr  =timslots.iterator();
                                        while(itr.hasNext())
                {%>
                        <option><%=itr.next() %></option>
                        <%}%>
                        
                    </select>
                            </td>
                                    <td><div id="bookappointment">
                            BOOK APPOINTMENT
                                </div></td>
                        </tr>
                        
                    </tbody>
                </table>

            </table>
             
                                <%
                             
                             

                                
                                %>
                                
                                 </div>
                                
                         <div id="appointmntstatus"></div>
             <div id="testbtn"> ViewStats </div>
             
             <div id="confirmedappts"></div>
             
         
      
                                
         </div>
         <div id="patviewreportdiv">viewreport
         
         <%
                Patient p = new Patient(patid);
                HashMap<String,String> imgdet=new HashMap<String,String>(); 
                int numofimages=p.getnumberofpatientimgs(patid);
s.setAttribute("patid",patid );
for(int i=0;i<numofimages;i++)
{
if(i==0)
{
    imgdet=p.getimgdets(patid, 0);
            %>
            <table border="1">

<tbody>
<tr>
<td>Scan id</td>
<td><%= imgdet.get("imageid")%></td>
</tr>
<tr>
<td>scan description</td>
<td> <%= imgdet.get("imgdescription")%> </td>
</tr>
<tr>
<td>date of image</td>
<td> <%= p.getdate(patid, 0)  %> </td>
</tr>

</tbody>
</table>

    
                <img src="retrieveservlet" width=400 height=500>
                <br>
                <%

}
if(i==1)
{ 
  imgdet=p.getimgdets(patid, 1);
            %>
            <table border="1">

<tbody>
<tr>
<td>Scan id</td>
<td><%= imgdet.get("imageid")%></td>
</tr>
<tr>
<td>scan description</td>
<td> <%= imgdet.get("imgdescription")%> </td>
</tr>
<tr>
<td>date of image</td>
<td> <%= p.getdate(patid, 1)  %> </td>
</tr>

</tbody>
</table>

    
  
        <img src="retreive2" width=400 height=500>
        <br>
                <%

}}
                %>
                
         
         </div>
             
     <h1>patient login </h1>
     
     
     </div>
     <%} %>
       
        </div>
     <%
                if(pos.equalsIgnoreCase("Admin"))
                    
        {%>
 <div class="docmain" >
        <div class="docpanel">
                <ul class="doc"> 
                    <li  id="Adminpersonalinfo">       Personal Info </li>
                    <li  id="Addemployee">     Add Employee </li>
                    <li id="Removeemployee">   Remove employee </li>
                     </ul>
                </div>
          <div id="Adminpersonalinfodiv"> 
              <table  width="30" id="Adminpersonaldetails">
                   <%
                       Doctor D = new Doctor(id);
                       
                   %>
                    <tbody>
                        <tr>
                            <td><input type="text" name="Fnamelabel" value="FirstName" readonly="readonly"/></td>
                            <td><input type="text" name="Firstname" value="<%= D.Firstname %>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="Lname" value="LastName" readonly="readonly"/></td>
                            <td><input type="text" name="LastName" value="<%= D.LastName %>"readonly="readonly" /></td>
                        
                        </tr>
                        <tr>
                            <td><input type="text" name="Phonenumber" value="Phone Number" /></td>
                            <td><input type="text" name="PhoneNumber" value="<%= D.phonenum %>" readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="Email" value="Email" /></td>
                            <td><input type="text" name="Email" value="<%= D.email %>" readonly="readonly"/></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="Dept" value="Department" /></td>
                            <td><input type="text" name="Department" value="<%= D.Department %>"readonly="readonly" /></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="Designation" value="<%= D.Designation %>" readonly="readonly" /></td>
                            <td><input type="text" name="Design" value="Designation" /></td>
                        </tr>
                        <tr>
                                <td><input type="text" name="BldGRp" value="BloodGroup" /></td>
                            <td><input type="text" name="BloodGroup" value="<%= D.bloodgroup %>" readonly="readonly"/></td>
                        
                        </tr>
                        <tr>
                            <td><input type="text" name="usrname" value="UserName" /></td>
                            <td><input type="text" name="username" value="<%=D.username%>" readonly="readonly" /></td>
                          
                        </tr>
                        <tr>
                            
                            <td><input type="text" name="password" value="Password" /></td>
                            <td><input type="password" name="password" value="<%= D.password %>" readonly="readonly" disabled="disabled" /></td>
                           
                        </tr>
                       <tr>
                            <td><input type="text" name="Empid" value="EmployeeID" /></td>
                            <td><input type="text" name="employeeid" value="<%= D.EmployeeId %>" disabled="disabled" /></td>
                        </tr>
                        <tr>
                            <td><input type="text" name="exc" value="Exception" /></td>
                            <td><input type="text" name="exception" value="<%= D.Excep%>" size="100" /></td>
                            
                        </tr>
                        
                        <tr>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div>
                            
                          <div id="Addemployeediv">Add employee
                            <form class="Addemp" method="post" action="insertion">
                                <input type="text" class="empid" name="empid" placeholder="ID">
     <br>
     <input type="text" class="fname" name="fname" placeholder="First Name">
     <br>
     <input type="text" class="lname" name="lname" placeholder="Last Name">
      <br>    
     <input type="text" class="phoneno"name="phone" placeholder="phone number">
     <br>
     <select class="typeid" name="typeid">
     <option value="1">Admin</option>
     <option value="2">Doctor</option>
     <option value="3">Nurse</option>
     <option value="4">Guest</option>
     </select>
     <br>
     <select class="deptid" name="deptid">
     <option value="1">Children</option>
     <option value="2">Ortho</option>
     </select>
    <br>
     <input type="email" class="email" name="email" placeholder="Email">
     <br>
     
     <input type="text" class="gender" name="gender" placeholder="Gender">
     <br>
     
     <input type="text" class="bloodgroup" name="bloodgroup" placeholder="Bloodgroup">
     <br>
     <input type="text" class="username" name="user" placeholder="Usernmae">
     <br>
     <input type="password" class="password" name="pass" placeholder="pass">
     <br>
     <input type="submit" class="submit" name="submit" value="Register" id="addemployee">
     
     
   </form>
                              ${message1}
   </div>
    
                            
                           
                            <div id="Removeemployeediv">
                                Remove employee
                            
                              
                                <%
                                    Doctor d = new Doctor();
  
                                ResultSet r=d.getdocdetails();
                                      
                           %>
                           
                           
                     <form methord="post" action="deleteemp">
                     <table border="0" class="appointnmnttable">
                   
                    <tbody>
                        <tr>
                            <td>
                        				 
			     <select name="Docdetailadmin" class="docdetailpulldown" id="admindocpulldwn">
                                 <%            
                     while(r.next())
                             {
                             %>
                             <option  value= <%= r.getString("employee_id")%>  >
                                     <%=
                                         r.getString("employee_id") +":" +r.getString("Fname")+" "+r.getString("Lname")
                                         %>
                                 </option>
                        <%}%>
                   
                     </td>
                     
                     <td><div id="delempbtn"></div>
                   <td><input type="submit" value="delete"> </td>
                   
                             </tr>  
                     </table>
                     <form>

                        <div class=""> ${message4}</div>      
                        </div>
       <!-- <H1> Welcome Admin </H1> -->
            
 </div>

                
<%}%>
     </body>
     
</html>
