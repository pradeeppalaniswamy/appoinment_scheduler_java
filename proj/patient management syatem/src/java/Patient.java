
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
   
    public String name;
    public String PatientId;
    
    public Patient(String Patient_Id)
    {
      BAL bal=new BAL();
        HashMap<String,String> PatientDetails=bal.getAllempdetails(Patient_Id);
        
        
    
    
    }
    public Patient()
    {}
     
    public ArrayList<String> getAllpatids()
    {
    BAL bal1=new BAL();
    ArrayList<String> patientid=bal1.getAllpatientIds();
    return patientid;
    
    }
    
    
    
}
