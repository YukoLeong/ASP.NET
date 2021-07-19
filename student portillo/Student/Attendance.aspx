<%@ Page Language="C#"  EnableEventValidation="false" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Instructor_Attendance"  %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
         body {
		margin: 0px 10px;
		padding: 2px;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 12px;
	         }
         #wrapper
        {
            width: 80%;
            min-height:930px;
            margin-left: auto;
            margin-right: auto;
            background-color:White;
            border-left: solid gray 1px;
            border-right: solid gray 1px;
        }
         #content
        {   
            min-height:930px;
            margin-left: 5px;
            margin-right: 5px;
        }
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            height: 26px;
        }
        #calendar {
		max-width: 1080px;
        margin:  auto;
                  }
    </style>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />  
    <link href='../fullcalendar/fullcalendar.css' rel='stylesheet' />
    <script src='../fullcalendar/lib/moment.min.js'></script>
    <script src='../fullcalendar/lib/jquery.min.js'></script>
    <script src='../fullcalendar/fullcalendar.min.js'></script>
	<script src='../fullcalendar/lang-all.js'></script>
     <script src='../fullcalendar/jquery-ui-timepicker-addon.js'></script>
    <script type="text/javascript" >
	     var ss='<%=strCurrent%>';
		 var ao='<%=strAo%>';
		 var aq='<%=strAq%>';
	       $(document).ready(function Func() {
		    if(ss=="en-US" || ss=="" ){
		    $('#calendar').fullCalendar({                             
                header: {
                    left: 'prev,next,today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },  
                lang: 'en-US',				
                businessHours: true, 
                editable: true,                                            
            });
			}
			 else
		    {
			 $('#calendar').fullCalendar({
                   header: {
                    left: 'prev,next,today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                 lang: 'zh-tw',
						buttonText:{
						 prevYear: '去年',
                         nextYear: '明年',
                         today: '今天',
                         month: '月',
                         week: '周',
                         day: '日' },             
                businessHours: true,
                editable: true,          
                        
            });		
			}  	  
		  				 
       		  if (ao!=null && aq!=null) {
			  var nValue = ao + '|' + aq;
              GetAttendInfo(nValue);
			   }
             else 
			 {
			  alert(" Please Log In !");
			  window.location.href='http://172.25.2.163/ep/home.aspx';
			 }	
          
			 
			});
            
        function GetAttendInfo(nameValue) {
           
            AttendanceService.GetAttendInfoInName(nameValue,
            OnRequestFinish, OnError);
        }
        function OnRequestFinish(result) {
		     
		      if(result.length==0)
			 {  
			    window.alert("The Student has no attendance data!");
			    return false;
			 }
			 var options = {
             weekday: "long", year: "numeric", month: "short",
             day: "numeric", hour: "2-digit", minute: "2-digit"
                };
			var strArray = new Array();         
            for (var i = 0; i < result.length; ++i) {
                var obj = new Object();
                obj.id = result[i].ID;
				obj.title = "* " +result[i].CourseEn  + " " + result[i].Course + " " +"  **" +   
                             result[i].NameCh + " " + result[i].NameEn + "  ***" +
                             result[i].AttendInfo;
									
			    obj.start =result[i].StartTime;
				obj.end =result[i].EndTime;
				obj.allday = result[i].AllDay;
                obj.color = result[i].Color;
                strArray.push(obj); 	
                				
           }
		        $('#calendar').fullCalendar('destroy'); 
              if(ss=="en-US" || ss=="" ){				
                $('#calendar').fullCalendar({
                    dayClick: function(date, allDay, jsEvent, view) {
                        $('#calendar').fullCalendar('gotoDate', date);
                        $('#calendar').fullCalendar('changeView', 'agendaDay');
                        },
                         header: {
                            left: 'prev,next,today',
                            center: 'title',
                            right: 'month,agendaWeek,agendaDay'
                        },
						
						minTime: '07:00:00',
						maxTime: '24:00:00',
                        businessHours: true, 
                        editable: false,
                        events: strArray,
                        eventClick: function(calEvent, jsEvent, view) {
						  
                            $(this).css('border-color', 'red');
                            $('#calendar').fullCalendar('gotoDate', calEvent.start);                                                         
                      },                                                  
                       });	
            }	
             else 
             {
			  $('#calendar').fullCalendar({
                    dayClick: function(date, allDay, jsEvent, view) {
                        $('#calendar').fullCalendar('gotoDate', date);
                        $('#calendar').fullCalendar('changeView', 'agendaDay');
                        },
                         header: {
                            left: 'prev,next,today',
                            center: 'title',
                            right: 'month,agendaWeek,agendaDay'
                        },
						lang: 'zh-tw',				
						buttonText:{
						 prevYear: '去年',
                         nextYear: '明年',
                         today: '今天',
                         month: '月',
                         week: '周',
                         day: '日' },
						minTime: '07:00:00',
						maxTime: '24:00:00',
                        businessHours: true, 
                        editable: false,
                        events: strArray,
                        eventClick: function(calEvent, jsEvent, view) {
						  
                            $(this).css('border-color', 'red');
                            $('#calendar').fullCalendar('gotoDate', calEvent.start);                                                         
                      },                                                  
                       });	
			 
			 }			 
        }
        function OnTimeout(result) {
            var lbl = document.getElementById("lblInfo");
            lbl.innerHTML = "<b>Request timed out.</b>";
        }
        function OnError(result) {
            var lbl = document.getElementById("lblinfo");
            lbl.innerHTML = "<b>" + result.get_message() + "</b>";
           }
     </script>
</head>
<body background="../images/bg-blue.jpg">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/AttendanceService.asmx" />
            </Services>
        </asp:ScriptManager>
    <div id="wrapper">
    <div id="content">  
	
	 <label style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';">Attendance Information</label>
      <br/>
	   <div style="float:right" >
		<strong> Color Description（顏色說明）：<strong>
		 <ul>
		 <li><span style="background:#257e4a">&nbsp;&nbsp;&nbsp;&nbsp;</span> Present(P) : 按時出席</li>
		 <li><span style="background:#ff9f89">&nbsp;&nbsp;&nbsp;&nbsp;</span> Unreasonable Absence(U) : 無理缺席</li>
		 <li><span style="background:#66B3FF">&nbsp;&nbsp;&nbsp;&nbsp;</span> Reasonable Absence(R) : 合理缺席</li>
		 </ul>
	  </div>
	   <label style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';">&nbsp;&nbsp;&nbsp;&nbsp;
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(考勤資訊)
	 </label>	   
	 <br/> 	  	
	 <br />  
	<div style="text-align:center;margin-top:-60px;padding-bottom:12px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="../Student/home.aspx"><img src="../images/homeblue.png" width="150px" height="55px" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'"></a>
    </div>
       	<br />        
       	
       <asp:Label ID="txt_msg" runat="server" Text="" style="color:black;font-size:12pt;"/>  
        <hr /> 		
       <div id='calendar'>
       </div> 
       <hr />
       <br />      
    </div>
    </div>
    </form>
</body>
</html>
