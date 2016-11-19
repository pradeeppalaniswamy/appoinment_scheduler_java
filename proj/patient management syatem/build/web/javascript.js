/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    /*doctor*/
    var patid=$('#patidimg1').val();
        // alert(patid)
       
 // $('#p
    //alert("jquery");
$('#patpersonaldiv').hide();
  $('#patbookappointmentsdiv').hide();
  $('#patviewreportdiv').hide();
    $('#patientsearchdiv').hide();
  $('#addoreditreportdiv').hide();
  $('#veiwappointmentdiv').hide();
  $('#viewreportdiv').hide();
$('#personalinfodiv').hide();

$('#confirmedappts').load("allappointments.jsp?patid="+newpat); 

  // setInterval(function(){$('#veiwappointmentdiv').load("Appointments.jsp?docid=e01"); },2000);
   $('#btn1').click( function(){
         var uname=$('#user').val();
         var pass=$('#pass').val();
      //alert("jquery");  
      //a/lert(uname ,pass);
      $.ajax({
                    type: "POST",
                    url: 'loginselecter.jsp',
                     data: 'user='+ jQuery.trim($('#user').val()) +"&pass="+$('#pass').val()
    })
 //$('#veiwappointmentdiv').load("Appointments.jsp?docid=e01");
   // $('#veiwappointmentdiv').l
});

$('#patientsearchopt').hover(function(){
    
   $('#patientsearchdiv').show();
  $('#addoreditreportdiv').hide();
  $('#veiwappointmentdiv').hide();
  $('#viewreportdiv').hide();
$('#personalinfodiv').hide();
});

$('#docpersolanopt').hover(function(){
    
    
   $('#personalinfodiv').show();
     $('#patientsearchdiv').hide();
  $('#addoreditreportdiv').hide();
  $('#veiwappointmentdiv').hide();
  $('#viewreportoptdiv').hide();
//$('#patientsearchdiv').show();
   
});
$('#addoreditreportopt').hover(function(){
    
    $('#patientsearchdiv').hide();
  $('#addoreditreportdiv').show();
  $('#veiwappointmentdiv').hide();
  $('#viewreportdiv').hide();
$('#personalinfodiv').hide();
});
$('#veiwappointmentsopt').hover(function(){
    
    
   $('#personalinfodiv').hide();
     $('#patientsearchdiv').hide();
  //$('#addoreditreportdiv').hide();
  $('#veiwappointmentdiv').show();
  $('#viewreportdiv').hide();
//$('#patientsearchdiv').show();
  $('#addoreditreportdiv').hide();
  
})



$('#viewreportopt').hover(function(){
    
    
   
   $('#personalinfodiv').hide();
     $('#patientsearchdiv').hide();
  //$('#addoreditreportdiv').hide();
  $('#veiwappointmentdiv').hide();
  $('#viewreportdiv').show();
//$('#patientsearchdiv').show();
  // $('#patientsearchdiv').hide();
 $('#addoreditreportdiv').hide();
 
});
//admin
$('#Adminpersonalinfodiv').hide();
  $('#Addemployeediv').hide();
  $('#Removeemployeediv').hide();
  
  $('#Adminpersonalinfo').hover(function(){
$('#Adminpersonalinfodiv').show();
  $('#Addemployeediv').hide();
  $('#Removeemployeediv').hide();
  });
   $('#Addemployee').hover(function(){
$('#Adminpersonalinfodiv').hide();
  $('#Addemployeediv').show();
  $('#Removeemployeediv').hide();
  });
   $('#Removeemployee').hover(function(){
$('#Adminpersonalinfodiv').hide();
  $('#Addemployeediv').hide();
  $('#Removeemployeediv').show();
  });
   
    $('.rejectdiv').click(function(e){
        //alert("hello");
        var id=$(this).attr('id');
   //alert(id);
   var val='rej';
   $.ajax({
                    type: "POST",
                    url: 'appointmentupdate.jsp',
                   
                    // data: 'appointmentid=' +id+ "status="+val
data:{appointmentid:id,status:val}
                // data: "message=" +'hai'
                
                });
  
 
 $('#veiwappointmentdiv').load("welcome.jsp #veiwappointmentdiv");
location.reload();
//alert('loaded rej');
  $('#veiwappointmentdiv').show();
    
    });
    
  $('.approvediv').click(function(e){
        //alert("hello");
        var id=$(this).attr('id');
  // alert(id);
   var val='apr';
   $.ajax({
                    type: "POST",
                    url: 'appointmentupdate.jsp',
                   
                     //data:appointmentid=id&status=val
data:{appointmentid:id,status:val}

                // data: "message=" +'hai'
                
                });
                
$('#veiwappointmentdiv').load("welcome.jsp #veiwappointmentdiv");
location.reload();

//alert('loaded');
  $('#veiwappointmentdiv').show();
//
  //$('#u0').load("Appointments.jsp?docid=e01");
  //$('#veiwappointmentdiv').load("Appointments.jsp?docid=e01");
  });
  
  
    
    
        (function () {

  var filterPullDown = function()
  {
      
         //alert('clicked'); 
         var patid=$('#patid').val();
        // alert(patid)
         $('#patientdetailsin').load("patientdetailsfetch.jsp?patid="+patid);
 // $('#patientdetailsin').show();
   //   location.reload();
  //alert(reload)
  
 //     $('#patientsearchdiv').show();
    }
    var flag = false;
    $(".businessTypePullDown").click(function () {
        if (flag) {
            filterPullDown()
        }
        flag = !flag;
    });

    $(".businessTypePullDown").focusout(function () {
        flag = false;
    });
}());

(function () {

  var PullDown = function()
  {
      
         //alert('clicked'); 
         var patid=$('#patidimg').val();
        // alert(patid)
         $('#scanimagesdiv').load("scanimages.jsp?patid="+patid);
 // $('#patientdetailsin').show();
   //   location.reload();
  //alert(reload)
  
 //     $('#patientsearchdiv').show();
    }
    var flag = false;
    $(".pidpull").click(function () {
        if (flag) {
            PullDown()
        }
        flag = !flag;
    });

    $(".pidpull").focusout(function () {
        flag = false;
    });
}());


/*doctorend*/
/*patientbegin*/

$('#patpersonaldiv').hide();
  $('#patbookappointmentsdiv').hide();
  $('#patviewreportdiv').hide();

$('#patpersonal').hover(function(){
$('#patpersonaldiv').show();
  $('#patbookappointmentsdiv').hide();
  $('#patviewreportdiv').hide();
  })  
$('#patbookappointments').hover(function(){
$('#patpersonaldiv').hide();
  $('#patbookappointmentsdiv').show();
  $('#patviewreportdiv').hide();

})
    $('#patviewreport').hover(function(){
$('#patpersonaldiv').hide();
  $('#patbookappointmentsdiv').hide();
  $('#patviewreportdiv').show();

    
    
})





      $('#bookappointment').click(function()
      {    alert('clickd');
  

          var docdets=$('#docdetailpulldwn').val();
          var apptdate=$('#aptday').val();
          var timeslot=$('#timeslot').val();
          //alert(docdets +" "+ apptdate+" "+timeslot);
$('#appointmntstatus1').load("createappointment.jsp?docdtls="+docdets+"&dateofapt="+apptdate+"&timeslotid="+timeslot);    

//location.reload();
      })

          
          //alert('hello');          
/*

   $.ajax({
                    type: "POST",
                    url: 'createappointment.jsp',
                   
                    // data: 'appointmentid=' +id+ "status="+val
data:{docdtls:docdets,dateofapt:apptdate,timeslotid:timeslot}
                // data: "message=" +'hai'
      
      
          })
      
      
  */    

var newpat=$('#patidtouse').val();

var ppfalg=0;
$('#testbtn').click(function(){
   // alert(newpat);

        //$('#confirmedappts').load("allappointmentsp.jsp?patid="+newpat");},2600);
    //setInterval(function(){$('#confirmedappts').load("allappointments.jsp?patid="+newpat); },2000);
$('#confirmedappts').load("allappointments.jsp?patid="+newpat);    

/*patientend*/

})



$('#tbn').on('click', function (e) {
alert('clickd');
     //your awesome code here
$('#confirmedappts').load("allappointments.jsp?patid="+newpat); 
});


$('.tbn').on('click', function (e) {
alert('clickd');
     //your awesome code here
$('#confirmedappts').load("allappointments.jsp?patid="+newpat); 
});




  $('#changetype').click(function(){
      //alert('clickd');
$('#ph').attr('readonly', false);
$('#mail1').attr('readonly', false);
$('#bgrp').attr('readonly', false);
$('#uname').attr('readonly', false);
$('#uname').attr('readonly', false);

  })

$('#edtbtn').click(function()
{
    $('#pno').attr('readonly', false);
    $('#mail').attr('readonly', false);
    $('#bgr').attr('readonly', false);
    $('#us').attr('readonly', false);
    $('#pw').attr('readonly', false);

}
            
            )


$("#test11").click(function(){
   alert("jquery");
   alert(patid);
    
})

$("#headings").click(function(){
    alert("working");
      $('#scanimagesdiv1').load("scanimages.jsp?patid="+patid); 
    
})


});
