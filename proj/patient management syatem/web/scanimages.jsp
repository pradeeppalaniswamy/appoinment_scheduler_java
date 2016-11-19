<%-- 
    Document   : scanimages
    Created on : Apr 30, 2016, 1:23:07 AM
    Author     : PRADEEP
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pms.Patient"%>
<!DOCTYPE html>
<% HttpSession s =request.getSession(); 
String patid=request.getParameter("patid");

%>
<html>
    <head>
        <link rel="stylesheet" type ="text/css" href="newcss.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script src="javascript.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
          <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div>
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
            <table border="1" class="table table-hover">

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
            <table border="1" class="table table-hover">

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
    </body>
</html>
