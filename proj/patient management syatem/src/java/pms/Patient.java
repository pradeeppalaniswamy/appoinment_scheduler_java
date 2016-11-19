/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pms;

/**
 *
 * @author PRADEEP
 */

import java.sql.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import pms.BAL;
import pms.DbConnect;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author PRADEEP
 */
public class Patient {
   
    public String mname;
    public String fname;
    public String lname;
    public String username;
    public String password;
    public String gender;
    public java.sql.Date dob;
    public String reasonofvisit;
    public String Date;
    public String PatientId;
    public String bloodgroup;
    public String PhoneNumber;
    public String email;
    
    public Patient(String Patient_Id)
    {
      BAL bal=new BAL();
        HashMap<String,String> PatientDetails=bal.getPatientDetails(Patient_Id);
        //java.sql.Date dob1;
        dob=bal.getdob(PatientId);
        
        mname=PatientDetails.get("middlname");
           fname= PatientDetails.get("firstName");
       mname= PatientDetails.get("middleName");
        lname=PatientDetails.get("lastName");
        gender=PatientDetails.get("gender");    
        PhoneNumber=PatientDetails.get("phonenum");
        email =PatientDetails.get("email");
        bloodgroup=PatientDetails.get("bloodGroup");
        reasonofvisit=PatientDetails.get("reasonOfVisit");
        username=PatientDetails.get("username" );
        password=PatientDetails.get("password" );
    this.PatientId=Patient_Id;
    
    }
    public Patient( )
    {}
     
    public ArrayList<String> getAllpatids()
    {
    BAL bal1=new BAL();
    ArrayList<String> patientid=bal1.getAllpatientIds();
    return patientid;
    
    }
    public int getnumberofpatientimgs(String PatientId)
    {
    int num=0;
    BAL bal=new BAL();
    num=bal.getnumberofimages(PatientId);
    
    return num;
    
    }
    
    public int createappoinment(String Doctorid,String patientid,String appoinmentdate ,String timeslot)
    {
    
    BAL bal=new BAL();
    String Doctorid1= Doctorid.substring(0,Doctorid.indexOf(':'));
		int timeslotid=Integer.parseInt(timeslot.substring(0,timeslot.indexOf('=')).trim());
                 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                         java.util.Date parsed = null;
                         java.sql.Date apmntdate=null;

                 try{
        parsed = format.parse(appoinmentdate);
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
    int succ=bal.bookappointment(Doctorid1,patientid,apmntdate,timeslotid);
            
    return succ;
    }
    public HashMap<String,String> getimgdets(String PatientId,int Limit )
    {
    BAL bal=new BAL();
  return bal.getimgdtls(PatientId, Limit);
        
        
    }
    
    public java.sql.Date getdate(String PatientId,int Limit)
    {
    BAL bal=new BAL();
  return bal.getimgdat(PatientId, Limit);
    }
    public int edit(String patid,String phone,String email,String bloodgroup,String username,String password)
    {
        int succ=0;
        BAL bal=new BAL();
        succ=bal.editpatient(patid, phone, email, bloodgroup, username, password);
        return succ;
    }
    
public ResultSet Getallpatientappointments(String patientid)
{
    BAL bal=new BAL();
            
ResultSet R=bal.getAppoinmentsforpatients(patientid);
return R;
}

    
}
