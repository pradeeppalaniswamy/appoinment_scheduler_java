/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pms;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author PRADEEP
 */

public class Doctor {
    
    public String EmployeeId;
    public String Firstname;
    public String Middlename;
    public String LastName;
    public String Designation;
    public String Department;
    public String gender;
    public String phonenum;
    public String mailid;
    public String bloodgroup;
    public String username;
    public String password;
    public String email;
    public String  Excep;
    public Doctor( String Employee_Id)
    {
        BAL bal=new BAL();
        HashMap<String,String> DoctorDetails=bal.getAllempdetails(Employee_Id);
        Firstname=DoctorDetails.get("FirstName");
        LastName = DoctorDetails.get("LastName"); 
        gender= DoctorDetails.get("Gender" );
                 phonenum=DoctorDetails.get("Phonenumber");
                 email= DoctorDetails.get("Email" );
                bloodgroup=  DoctorDetails.get("Bloodgroup");
                 username =DoctorDetails.get("username" );
                 EmployeeId=DoctorDetails.get("employeeid");
    Department=DoctorDetails.get("Department");
    Designation=DoctorDetails.get("Type");
    password=DoctorDetails.get("password");
    Excep=DoctorDetails.get("Employeeexception")+DoctorDetails.get("DEPeeexception")+DoctorDetails.get("emptypeexception");
    }
    
public Doctor()
{}
   // public HashMap<String,String> getDetails()
    public void getDetails()
    {
    
        BAL bal=new BAL();
        HashMap<String,String> DoctorDetails=bal.getAllempdetails(EmployeeId);
        
    }
    
    
    public ResultSet getappoinments()
    {
    
        BAL bal=new BAL();
        
        return bal.getAppoinments(EmployeeId);
    
    }
    
  public void updateAppoinment(String Status,String id)
  {
  
  BAL bal=new BAL();
  bal.updateAppointment(Status,id);
          
  }
  //insert doctor
  
public int insertemp(String empid,String typeid,String fname,String lname,String deptid,String gender,String phoneno,String email,String blooggroup,String user,String pass)
{
    int succ;
    BAL bal=new BAL();
    succ=bal.insertemp(empid, typeid, fname, lname, deptid, gender, phoneno, email, blooggroup, user, pass);
    return succ;
}
public int delete(String empid)
{
    int succ;
    BAL bal=new BAL();
    succ=bal.deleteemp(empid);
    return succ;
}
public int edit(String empid,String phone,String email,String bloodgroup,String username,String password){
    int succ=0;
    BAL bal=new BAL();
    succ=bal.editemp(empid, phone, email, bloodgroup, username, password);
    return succ;
}
public ResultSet getdocdetails()
    {
    BAL bal1=new BAL();
    ResultSet docdetails=bal1.getdoctordetailds();
    return docdetails;
    
    }


public ArrayList<String> getstimeslotids()
    {
    BAL bal1=new BAL();
    ArrayList<String> Timeslots=bal1.gettimeslots();
    return Timeslots;
    
    }


  
    
}
