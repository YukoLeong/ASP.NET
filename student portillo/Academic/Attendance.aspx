<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Attendance.aspx.cs" Inherits="Instructor_Attendance" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
         body {
		margin: 0px 10px;
		padding: 0;
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
        margin: 0 auto;
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
        $(document).ready( function Func() {
		     if(ss=="en-US" || ss=="" ){
            $('#calendar').fullCalendar({                                                
                header: {
                    left: 'prev,next,today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },             
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
					
        })
        function GetName(yearValue) {
            var txtSubName = document.getElementById("txt_subjectName");
                txtSubName.value = "";
            AttendanceService.GetNameInYear(yearValue,
            OnRequestComplete, OnError);
        }
        function OnRequestComplete(result) {
            var lstName = document.getElementById("lstName");
            var txtSubName = document.getElementById("txt_subjectName");
            txtSubName.innerHTML = "";
            lstName.innerHTML = "";
            if (result.length > 0) {
                txtSubName.value = result[0].Curso;
               
            }
            for (var n = 0; n < result.length; n++) {
                var option = document.createElement("option");
                option.value = result[n].AlumNumero + '|' + result[n].AlumNumeroSeq 
                option.innerHTML = result[n].ID+'->'+result[n].Name;
                lstName.appendChild(option);
            }        
         
               }
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
			 var strArray = new Array();         
            for (var i = 0; i < result.length; ++i) {
                var obj = new Object();
                obj.id = result[i].ID;
                obj.title = "* " + result[i].CourseEn+ " " + result[i].Course + " "  +"  **" +     //result[i].TeacherCode + "  **" +
                             result[i].NameCh + " " +result[i].NameEn  + "  ***" +
                            result[i].AttendInfo;
                obj.start = result[i].StartTime;
                obj.end = result[i].EndTime;
                obj.allday = result[i].AllDay;
                obj.color = result[i].Color;
                strArray.push(obj);            
           }
                $('#calendar').fullCalendar('destroy');
				if(ss=="en-US" || ss=="" ){
                $('#calendar').fullCalendar({
                    dayClick: function (date, allDay, jsEvent, view) {                    
                        $('#calendar').fullCalendar('gotoDate', date);
                        $('#calendar').fullCalendar('changeView', 'agendaDay');
                        },
                         header: {
                            left: 'prev,next,today',
                            center:'title',
                            right: 'month,agendaWeek,agendaDay'
                        },
						minTime: '07:00:00',
						maxTime: '24:00:00',                     
                        allDayDefault:false,
                        editable: false,
                        events:strArray,
                        eventClick: function(calEvent, jsEvent, view) {                                               
                            $(this).css('border-color', 'red');
                            $('#calendar').fullCalendar('gotoDate', calEvent.start);                                                                 
                            },                                      
                                              
                });
                }
				else{
				  $('#calendar').fullCalendar({
                    dayClick: function (date, allDay, jsEvent, view) {                    
                        $('#calendar').fullCalendar('gotoDate', date);
                        $('#calendar').fullCalendar('changeView', 'agendaDay');
                        },
                         header: {
                            left: 'prev,next,today',
                            center:'title',
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
                        allDayDefault:false,				  
                        editable: false,
                        events:strArray,
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
	
	 <label style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';" ><asp:Label ID="txtTitle" runat="server" Text="<%$ Resources:Resource, sip_at_Title%>"> </asp:Label></label>
	         
       		 
		<div align="center">
         <a href="../Academic/home.aspx"><img src="../images/homeblue.png" width="130px" height="45px" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'"></a>
        </div>
       
       <asp:Label ID="txt_msg" runat="server" Text="<%$ Resources:Resource, sip_at_subject%>" style="color:black;font-size:12pt;"/>
	    <hr/>
        <table width="90%">         
		  
            <tr>
                <td>
                    <asp:Label ID="lb_code" runat="server" Text="<%$ Resources:Resource, sip_at_code%>"></asp:Label><span style="color:red;">*</span>
                </td>
                <td>
                    <asp:ListBox ID="subjectList" runat="server" 
                        Height="100px" Width="200px" onChange="GetName(this.value);" >
                    </asp:ListBox>
                   
                </td>
				<td>
				<table>
				<tr>
               <td class="auto-style2"><asp:Label ID="lb_program" runat="server" Text="<%$ Resources:Resource, sip_at_program%>"></asp:Label></td>
               <td colspan="2" class="auto-style2"><asp:TextBox ID="txt_subjectName" runat="server" Enabled="false" style="width:447px;" ></asp:TextBox></td>
               </tr>
			   <tr>
			    <td class="auto-style1"><asp:Label ID="lb_student" runat="server" Text="<%$ Resources:Resource, sip_at_student%>"></asp:Label><span style="color:Red;">* </span></td>
                <td colspan="2" class="auto-style1">
               <asp:ListBox ID="lstName" runat="server" Height="100px" style="width:450px;" onChange="GetAttendInfo(this.value);"></asp:ListBox></td>
         	   </tr>
			   </table>
			   </td>
            </tr>                     
            <tr>
                <asp:Label ID="lblinfo" runat="server" Text=""></asp:Label>
            </tr>
        </table>
        <br />
        <span style="color:Red;">* </span><asp:Label ID="lb_indicate" runat="server" Text="<%$ Resources:Resource, sip_at_indicate%>"></asp:Label>
        <br />
		
        <span style="color:blue;" ><asp:Label ID="lb_description" runat="server" Text="<%$ Resources:Resource, sip_at_description%>"></asp:Label></span>
		 <table align="right" >
            <tr>
                <td><asp:Label ID="lb_ColorDescription" runat="server" Text="<%$ Resources:Resource, sip_co_description%>"></asp:Label>：</td>
                <td bgcolor="#257e4a"><asp:Label ID="lb_pDescription" runat="server" Text="<%$ Resources:Resource, sip_p_description%>"></asp:Label></td>
                <td bgcolor="#ff9f89"><asp:Label ID="lb_uDescription" runat="server" Text="<%$ Resources:Resource, sip_u_description%>"></asp:Label></td>
                <td bgcolor="#66B3FF"><asp:Label ID="lb_rDescription" runat="server" Text="<%$ Resources:Resource, sip_r_description%>"></asp:Label></td>               
            </tr>
        </table>
        <hr/>        
       <div id='calendar'>
       </div> 
       <hr />
       <br />      
    </div>
    </div>
    </form>
</body>
</html>
