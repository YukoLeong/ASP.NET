<%@ Page Language="VB" AutoEventWireup="false" CodeFile="studentProfile.aspx.vb" Inherits="Student_studentProfile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="Ajax" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Student Profile</title>
    <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
            font-size: x-large;
        }
        #form1
        {
            height: 75px;
        }
        .style3
        {
            width: 87%;
          
			padding-top: 15px;
        }
        .ajax__htmleditor_editor_bottomtoolbar {
		display :none;
         }
        
        .style6
        {
            width: 130px;
            text-align:center;
        }
        .style7
        {
            width: 130px;
            text-align:center;
            padding-right:7px;
        }
        .style17
        {
            width: 100%;
        }
        .style22
        {
            width: 123px;
        }
        .style23
        {
            width: 216px;
        }

        #ColorButton1{
            width:14%;
        }
        #ColorButton2{
            width:10%;
        }
        #ColorButton3{
            width:10%;
        }



        #ImageButton2{
            width:14%;
        }
		
		        
        /*animatemenu*/

		#main-nav-wrapper{			
			overflow:hidden;
			/*margin-left: 7%;*/
		}

        .main-nav {
           position: absolute;
             /* bottom: 0;*/
			/*width:1024px;*/	
            width:1147px;		
			height: 100px;
            padding: 0;
            text-align: right;
			margin-left: auto;
            margin-right: auto;
			margin: 0;
            font-size: 0;
            /*margin-top:-184px;*/
            /*z-index:-1;*/
            top:46px;
            
        }

        .main-nav-list {
            display: inline-block;
            padding: 0;
            list-style: none;
        }

            .main-nav-list li {
                display: inline-block;
                margin: 0;
                padding: 0;
                min-width: 50px;
                min-height: 50px;

				/*margin-top: 80px;*/
            }

                .main-nav-list li.apic1color {
                    background-color: #a8218e;
                }

                .main-nav-list li.apic2color {
                    background-color: #00a7ef;
                }

                .main-nav-list li.apic3color {
                    background-color: #ffa200;
                }

                .main-nav-list li.apic4color {
                    background-color: #9ae900;
                }

                .main-nav-list li.apic5color {
                    background-color: #ff2200;
                }

                .main-nav-list li.apic6color {
                    background-color: #ffd600;
                }

                .main-nav-list li.apic7color {
                    background-color: #00989a;
                }

                .main-nav-list li.apic8color {
                    background-color: #00cb79;
                }

                .main-nav-list li.apic99color {
                    background-color: #00cb79;
                }

                .main-nav-list li .aimg {
                    display: inline-block;
                    cursor: pointer;
                    margin: 0;
                    padding: 0;
                }

                /*animatemenu close*/

        #Iframe1
        {
            height: 171px;
            width: 1019px;
        }
		#wrapper
        {            
            margin-left: auto;
            margin-top:-8px;
            margin-right: auto;
            background-color:White;
            border-left:solid gray 1px;
            border-right:solid gray 1px;
			width:100%;
        
        }
		#content
        {          
            min-height:980px;            
            margin-left: 5px;
            margin-right: 5px;
        }

        .style26
        {
            width: 138px;
            height: 26px;
        }
        .style27
        {
            width: 216px;
            height: 26px;
        }
        
        .style30
        {
            width: 138px;
        }

        .style45
        {
            height: 20px;
            width: 552px;
        }
        .style46
        {
            width: 552px;
        }
        .style49
        {
            width: 193px;
            height: 20px;
        }
        .style50
        {
            width: 193px;
        }

        .style53
        {
            width: 228px;
        }
        .style54
        {
            width: 159px;
        }
        .aimg{
            width:75px;
        }
        .aimgactive{
            width:130px;
        }

        </style>

       

     <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../button1.css" type="text/css" media="screen" />
     <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
      <link rel="stylesheet" href="../Student/styles/orange.css" type="text/css" media="screen" />  
    


    <%--animemenu js--%>

    <script src="animatedmenu3/jquery-2.1.1.js"></script>
     <%--<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>--%>
    <%--<script src="animatedmenu3/jquery.resizeOnApproach.1.0.min.js"></script>--%>

        <script>
            $(document).ready(function () {

                $('.main-nav-list .aimg').resizeOnApproach({
                    elementDefault: 75,
                    elementClosest: 130,
                    triggerDistance: 100
                });


                $('.main-nav-list .aimgactive').resizeOnApproach({
                    elementDefault: 110,
                    elementClosest: 110,
                    triggerDistance: 100
                });


                $('.main-nav-list .nocolorimg').resizeOnApproach({
                    elementDefault: 150,
                    elementClosest: 150,
                    triggerDistance: 100
                });

            });
    </script>
 <script type="text/javascript">
        function CancelReturnKey() {
            if (window.event.keyCode == 13)
                return false;
        }
    </script>
    <%--animemenu js close--%>



</head>
<body background="images/profile.gif" onkeypress="return CancelReturnKey();">
  <script type="text/javascript">
      function ConfirmMessage() {
          var lang = '<%=Session("CurrentUI") %>';

          if (lang == "zh-TW") {
              var selectedvalue = confirm("您確定要刪除它?");
              if (selectedvalue) {
                  document.getElementById('<%=message.ClientID %>').value = "Yes";
              } else {
                  document.getElementById('<%=message.ClientID %>').value = "No";
              }
          }
          else {

              var selectedvalue = confirm("Are you sure you want to delete it?");
              if (selectedvalue) {
                  document.getElementById('<%=message.ClientID %>').value = "Yes";
              } else {
                  document.getElementById('<%=message.ClientID %>').value = "No";
              }

          }
      }
        </script>
    <form id="form1" runat="server">

        
   <table cellpadding="0" cellspacing="0" border="0" width="1160" align="center">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                    </asp:ToolkitScriptManager>
    <tr>
<td>



<div id="wrapper">

 <!-- <div id="leftnav">
            <ul id="navigationMenu">
                <li>
                  <!--   <a class="home" href="#">
                        <span>Personal Info</span>
                    </a> -->
					<!-- <asp:LinkButton  cssClass="home selected" ID="ColorButton1" runat="server"  CausesValidation="False"><span>Personal Info</span>
					 </asp:LinkButton>
                </li>

                <li>
                 <!--    <a class="about" href="#">
                        <span>Education</span>
                    </a> -->
					<!--<asp:LinkButton cssClass="about" ID="ColorButton2" runat="server" CausesValidation="False" ><span>Education</span>
					 </asp:LinkButton>
                </li>

                <li>
                  <!--   <a class="services" href="#">
                        <span>Academic</span>
                    </a> -->
					<!--	<asp:LinkButton cssClass="services" ID="ColorButton3" runat="server" CausesValidation="False" ><span>Academic</span>
					 </asp:LinkButton>
                </li>
            </ul>
        </div>-->


<div id="content">
<%--        <span class="style2">Student Profile
        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large">Back</asp:LinkButton>
        </span><br class="style1" />--%>
    <asp:Label ID="title" runat="server" Text="<%$ Resources:Resource, sip_std_profile %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
    <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1005px;display:none;">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" /> 
    </div>
     <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
    <br />
    <br />
    <br />
    <br /><br /><br /><br /><br />



    <%-- <asp:ImageButton ID="ColorButton1" runat="server" onmouseover="this.src='../images/blue_active.png'" onmouseout="this.src='../images/blue_active.png'" ImageUrl="~/images/blue_active.png" CausesValidation="False" Visible="false" />  --%>
<%--   <asp:Button ID="Button1" runat="server" Text="Personal Information" 
        CssClass="blue" CausesValidation="False" Width="220px"  />--%>
    <br />
 <%--    <asp:ImageButton ID="ColorButton2" runat="server" onmouseover="this.src='../images/green.png'" onmouseout="this.src='../images/green.png'" ImageUrl="~/images/green.png" CausesValidation="False" Visible="false"/> --%>
   <%--<asp:Button ID="Button2" runat="server" Text="Education" CssClass="blue" CausesValidation="False" Width="220px"/>--%>
    <br />
  <%--   <asp:ImageButton ID="ColorButton3" runat="server" onmouseover="this.src='../images/red.png'" onmouseout="this.src='../images/red.png'" ImageUrl="~/images/red.png" CausesValidation="False" Visible="false"/> --%>
    <%--<asp:Button ID="Button3" runat="server" Text="Academic Results" CssClass="blue" CausesValidation="False" Width="220px"/>--%>


    
    <br />
    &nbsp;
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewPersonal" runat="server">
         

            
            <div id="main-nav-wrapper">
            <nav class="main-nav">
                <ul class="main-nav-list">

                    <li class="apic10color">
                        <img src="animatedmenu3/nocolor.png" class="nocolorimg" />

                    </li>

                    <li class="apic9color">
                        <asp:ImageButton ID="ImageButtonapic9" runat="server" ImageUrl="~/Student/animatedmenu3/bpic9.png" CssClass="aimg"
                         OnClick="ImageButtonapic9_Click"  CausesValidation="False" />
                    </li>

                    <li class="apic99colorr">
                        <asp:ImageButton ID="ImageButtonapic99" runat="server" ImageUrl="~/Student/animatedmenu3/spic1.png" CssClass="aimgactive" OnClick="ImageButtonapic99_Click" />
                    </li>

                     <li class="apic8color">
                        <asp:ImageButton ID="ImageButtonapic100" runat="server" ImageUrl="~/Student/animatedmenu3/spic2.png" CssClass="aimg" OnClick="ImageButtonapic100_Click" />
                    </li>


                    <li class="apic1color">
                        <asp:ImageButton ID="ImageButtonapic1" runat="server" ImageUrl="~/Student/animatedmenu3/spic3.png" CssClass="aimg" OnClick="ImageButtonapic1_Click" />

                    </li>
                    <li class="apic2color">

                        <asp:ImageButton ID="ImageButtonapic2" runat="server" ImageUrl="~/Student/animatedmenu3/spic4.png" CssClass="aimg" OnClick="ImageButtonapic2_Click" />


                    </li>
                    <li class="apic3color">
                        <asp:ImageButton ID="ImageButtonapic3" runat="server" ImageUrl="~/Student/animatedmenu3/spic5.png" CssClass="aimg" OnClick="ImageButtonapic3_Click" />


                    </li>
                    <li class="apic4color">

                        <asp:ImageButton ID="ImageButtonapic4" runat="server" ImageUrl="~/Student/animatedmenu3/spic6.png" CssClass="aimg" OnClick="ImageButtonapic4_Click" />

                    </li>
                    <li class="apic5color">

                        <asp:ImageButton ID="ImageButtonapic5" runat="server" ImageUrl="~/Student/animatedmenu3/spic7.png" CssClass="aimg" OnClick="ImageButtonapic5_Click" />

                    </li>
                    <li class="apic6color">

                        <asp:ImageButton ID="ImageButtonapic6" runat="server" ImageUrl="~/Student/animatedmenu3/spic8.png" CssClass="aimg" OnClick="ImageButtonapic6_Click" />


                    </li>
                    <li class="apic7color">
                        <asp:ImageButton ID="ImageButtonapic7" runat="server" ImageUrl="~/Student/animatedmenu3/spic9.png" CssClass="aimg" OnClick="ImageButtonapic7_Click" />

                    </li>

                    <li class="apic8color">
                        <asp:ImageButton ID="ImageButtonapic8" runat="server" ImageUrl="~/Student/animatedmenu3/spic10.png" CssClass="aimg" OnClick="ImageButtonapic8_Click" />

                    </li>

                    <!-- <li class="apic8color"><img src="apic8.png" alt="Properties and changes of materials" title="Properties and changes of materials"></li> -->
                </ul>
            </nav>
        </div>




         <asp:MultiView ID="MultiView2" runat="server">
                <asp:View ID="View6" runat="server">
               
					<div style="margin-left:50px;">
                    
                     <asp:Label ID="bio" runat="server" Text="<%$ Resources:Resource, sip_bio %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                  <br /><br />
                    <span class="style1">
                    <asp:Button ID="Button8" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" />
                    <asp:Button ID="Button7" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
                        Visible="False" />
                    <asp:Button ID="Button9" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
                        Visible="False" />
                   
                    <br />
                            
                   
                    <cc1:Editor ID="Editor1" runat="server" ActiveMode="Preview" Height="200px" 
                        ViewStateMode="Disabled" Visible="True" Width="1024px" />
                    <br />
                    </span>
					</div>
                </asp:View>
                <asp:View ID="View7" runat="server">
                   
					<div style="margin-left:50px;">
                 <asp:Label ID="technical" runat="server" Text="<%$ Resources:Resource, sip_technical %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                 <br /><br />
                    <asp:Button ID="Button16" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" />
                    <asp:Button ID="Button17" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
                        Visible="False" />
                    <asp:Button ID="Button18" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
                        Visible="False" />
                    <br />
                
                       <cc1:Editor ID="Editor2" runat="server" ActiveMode="Preview" Height="200px" 
                        ViewStateMode="Disabled" Visible="True" Width="1024px" />
						</div><br />

                        	<div style="margin-left:50px;">
                 <asp:Label ID="technicalCht" runat="server" Text="<%$ Resources:Resource, sip_technicalCht %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                 <br /><br />
                    <asp:Button ID="technicalEdit" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" />
                    <asp:Button ID="technicalUpdate" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
                        Visible="False" />
                    <asp:Button ID="technicalCancel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
                        Visible="False" />
                    <br />
                
                       <cc1:Editor ID="Editor2Cht" runat="server" ActiveMode="Preview" Height="200px" 
                        ViewStateMode="Disabled" Visible="True" Width="1024px" />
						</div>
                </asp:View>
                <asp:View ID="View8" runat="server">
					<div style="margin-left:50px;">
						
					
					   <asp:Label ID="social" runat="server" Text="<%$ Resources:Resource, sip_social %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                       <br /><br />
					  <asp:Button ID="Button6" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" />
						<asp:Button ID="Button14" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
							Visible="False" />
						<asp:Button ID="Button19" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
							Visible="False" />
						<br />

						   <cc1:Editor ID="Editor3" runat="server" ActiveMode="Preview" Height="200px" 
							ViewStateMode="Disabled" Visible="True" Width="1024px" />
					
					</div><br />

                    <div style="margin-left:50px;">
						
					
					   <asp:Label ID="socialCht" runat="server" Text="<%$ Resources:Resource, sip_socialCht %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                       <br /><br />
					  <asp:Button ID="socialEdit" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" />
						<asp:Button ID="socialUpdate" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
							Visible="False" />
						<asp:Button ID="socialCancel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
							Visible="False" />
						<br />

						   <cc1:Editor ID="Editor3Cht" runat="server" ActiveMode="Preview" Height="200px" 
							ViewStateMode="Disabled" Visible="True" Width="1024px" />
					
					</div>
                </asp:View>
                <asp:View ID="View9" runat="server">
                    
					<div style="margin-left:50px;">
                <asp:Label ID="lan" runat="server" Text="<%$ Resources:Resource, sip_languages %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                       <br /><br />
                   <asp:Button ID="Button20" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" />
                    <asp:Button ID="Button21" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
                        Visible="False" />
                    <asp:Button ID="Button22" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
                        Visible="False" />
                    <br />
                
                       <cc1:Editor ID="Editor4" runat="server" ActiveMode="Preview" Height="200px" 
                        ViewStateMode="Disabled" Visible="True" Width="1024px" />
						</div><br />
                  <div style="margin-left:50px;">
                <asp:Label ID="lanCht" runat="server" Text="<%$ Resources:Resource, sip_languagesCht %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                       <br /><br />
                   <asp:Button ID="lanEdit" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" />
                    <asp:Button ID="lanUpdate" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
                        Visible="False" />
                    <asp:Button ID="lanCancel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
                        Visible="False" />
                    <br />
                
                       <cc1:Editor ID="Editor4Cht" runat="server" ActiveMode="Preview" Height="200px" 
                        ViewStateMode="Disabled" Visible="True" Width="1024px" />
						</div>
            </asp:View>
            <asp:View ID="View10" runat="server">
               
				<div style="margin-left:50px;">
               <asp:Label ID="interests" runat="server" Text="<%$ Resources:Resource, sip_interests %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                       <br /><br />
              <asp:Button ID="Button23" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" />
                    <asp:Button ID="Button24" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
                        Visible="False" />
                    <asp:Button ID="Button25" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
                        Visible="False" />
                    <br />
                
                       <cc1:Editor ID="Editor5" runat="server" ActiveMode="Preview" Height="200px" 
                        ViewStateMode="Disabled" Visible="True" Width="1024px" />
						</div><br />

                        <div style="margin-left:50px;">
               <asp:Label ID="interestsCht" runat="server" Text="<%$ Resources:Resource, sip_interestsCht %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                       <br /><br />
              <asp:Button ID="interestsEdit" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" />
                    <asp:Button ID="interestsUpdate" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
                        Visible="False" />
                    <asp:Button ID="interestsCancel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
                        Visible="False" />
                    <br />
                
                       <cc1:Editor ID="Editor5Cht" runat="server" ActiveMode="Preview" Height="200px" 
                        ViewStateMode="Disabled" Visible="True" Width="1024px" />
						</div>
                </asp:View>
                <asp:View ID="View11" runat="server">
                 
							<div style="margin-left:50px;">
                <asp:Label ID="references" runat="server" Text="<%$ Resources:Resource, sip_references %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                       <br /><br />
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   
                                       <asp:Button ID="Button26" runat="server" CssClass="blue" Height="34px" 
                                           onclick="Button26_Click" Text="<%$ Resources:Resource, sip_sp_addreference %>" Width="166px" />
                
                   <br /><br />
                    <asp:DataList ID="DataList3" runat="server" 
                        DataSourceID="SqlDataSource10" Height="10px" 
                        Width="1024px" DataKeyField="id" CssClass="GridViewStyle">
                        <AlternatingItemStyle CssClass="GridViewAlternatingRowStyle2" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <HeaderTemplate>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="instructorInfo" runat="server" Text="<%$ Resources:Resource, sip_instructorReference %>"></asp:Label>
                        </HeaderTemplate>
                        <ItemStyle CssClass="GridViewRowStyle2" />
                    <ItemTemplate>
                     <asp:Button ID="Button30" runat="server" CommandName="Edit" Text="<%$ Resources:Resource, sip_sp_edit %>" 
                                CssClass="blue" />
                            <asp:Button ID="Button31" runat="server" CommandName="Delete" OnClientClick="ConfirmMessage();" Text="<%$ Resources:Resource, sip_sp_del %>" 
                                CssClass="blue" />
                            <br />
                            <br />
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<table class="style17">
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="teachName" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceTeacher %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="Teacher_Type" runat="server" 
                                        Text='<%# Eval("teacher_type") %>' />
                                    <asp:Label ID="teacherLabel" runat="server" Text='<%# Eval("teacher") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="teachNameCht" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceTeacherCht %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="teacherChtLabel" runat="server" 
                                        Text='<%# Eval("teacherCht") %>' />
                                    <asp:Label ID="teacher_typeChtLabel" runat="server" 
                                        Text='<%# Eval("teacher_typeCht") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="pos" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referencePosition %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="positionLabel" runat="server" Text='<%# Eval("position") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="posCht" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referencePositionCht %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="positionChtLabel" runat="server" 
                                        Text='<%# Eval("positionCht") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="programReference" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceProgram %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="programLabel" runat="server" Text='<%# Eval("program") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="programReferenceCht" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceProgramCht %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="programChtLabel" runat="server" 
                                        Text='<%# Eval("programCht") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="schoolReference" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceSchool %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="schoolLabel" runat="server" Text='<%# Eval("school") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="schoolReferenceCht" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceSchoolCht %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="schoolChtLabel" runat="server" Text='<%# Eval("schoolCht") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="institute" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceInstitute %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="instituteLabel" runat="server" Text='<%# Eval("institute") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="InstituteCht" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceInstituteCht %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="instituteChtLabel" runat="server" 
                                        Text='<%# Eval("instituteCht") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="addressReference" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceAddress %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="addressReferenceCht" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceAddressCht %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="addressChtLabel" runat="server" 
                                        Text='<%# Eval("addressCht") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="cityReference" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceCity %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="cityReferenceCht" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceCityCht %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="cityChtLabel" runat="server" Text='<%# Eval("cityCht") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="countryReference" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceCountry %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("country") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="countryReferenceCht" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceCountryCht %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="countryChtLabel" runat="server" 
                                        Text='<%# Eval("countryCht") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="phone" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referencePhone %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="email" runat="server" 
                                        Text="<%$ Resources:Resource, sip_sp_referenceEmail %>"></asp:Label>
                                </td>
                                <td class="style53">
                                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' 
                                        Visible="False" />
                                </td>
                                <td class="style53">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style54">
                                    &nbsp;</td>
                                <td class="style53">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                      
                        </ItemTemplate>
                    </asp:DataList>
					</div>
                    <asp:HiddenField ID="index" runat="server" />
                    <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                        
                        
                        SelectCommand="SELECT * FROM [Reference] WHERE ([pess_cod] = @pess_cod)" 
                        DeleteCommand="DELETE FROM [Reference] WHERE [id] = @id" 
                        InsertCommand="INSERT INTO [Reference] ([pess_cod], [teacher], [position], [program], [school], [institute], [address], [city], [country], [phone], [email]) VALUES (@pess_cod, @teacher, @position, @program, @school, @institute, @address, @city, @country, @phone, @email)" 
                        UpdateCommand="UPDATE [Reference] SET [pess_cod] = @pess_cod, [teacher] = @teacher, [position] = @position, [program] = @program, [school] = @school, [institute] = @institute, [address] = @address, [city] = @city, [country] = @country, [phone] = @phone, [email] = @email WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            
                            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                            <asp:Parameter Name="teacher" Type="String" />
                            <asp:Parameter Name="position" Type="String" />
                            <asp:Parameter Name="program" Type="String" />
                            <asp:Parameter Name="school" Type="String" />
                            <asp:Parameter Name="institute" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="country" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                            <asp:Parameter Name="teacher" Type="String" />
                            <asp:Parameter Name="position" Type="String" />
                            <asp:Parameter Name="program" Type="String" />
                            <asp:Parameter Name="school" Type="String" />
                            <asp:Parameter Name="institute" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="country" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </asp:View>
                <asp:View ID="View12" runat="server" >
				<br/>
                    <asp:ValidationSummary ID="ValidationSummary5" runat="server" />
                    <br/><br/><br/>
                    <asp:Panel ID="Panel1" runat="server" BackColor="#DEE8F5" Width="1024px" style="margin:0 auto;">                   
                        <table class="style17">
                            <tr>
                                <td class="style49">
                                  <asp:Label ID="AddteachName" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceTeacher %>"></asp:Label></td>
                                <td class="style45">
                                    <asp:DropDownList ID="DropDownList4" runat="server" Width="60px">
                                        <asp:ListItem>Prof.</asp:ListItem>
                                        <asp:ListItem>Dr.</asp:ListItem>
                                        <asp:ListItem>Mr.</asp:ListItem>
                                        <asp:ListItem>Ms.</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TextBox2" runat="server" Width="130px"></asp:TextBox>
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox2"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorTeacher %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>

                             <tr>
                                <td class="style49">
                                     <asp:Label ID="AddteachNameCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceTeacherCht %>"></asp:Label></td>
                                <td class="style45">
                                 
                                    <asp:TextBox ID="TextBox36" runat="server" Width="130px"></asp:TextBox>
                                     
                                       <asp:DropDownList ID="DropDownList1" runat="server" Width="60px">
                                        <asp:ListItem>教授</asp:ListItem>
                                        <asp:ListItem>博士</asp:ListItem>
                                        <asp:ListItem>先生</asp:ListItem>
                                        <asp:ListItem>女士</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox36"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorTeacherCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                       <asp:Label ID="Addpos" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePosition %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox3" runat="server" Width="195px"></asp:TextBox>
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox3"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorPos %>">*</asp:RegularExpressionValidator>
                                     
                                </td>
                            </tr>
                              <tr>
                                <td class="style50">
                                      <asp:Label ID="AddposCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePositionCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox37" runat="server" Width="195px"></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox37"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorPosCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                     <asp:Label ID="AddprogramReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceProgram %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox4" runat="server" Width="245px" Height="123px" 
                                        TextMode="MultiLine"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox4"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorProgram %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                              <tr>
                                <td class="style50">
                                     <asp:Label ID="AddprogramReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceProgramCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox38" runat="server" Width="245px" Height="123px" 
                                        TextMode="MultiLine"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator21" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox38"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorProgramCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                     <asp:Label ID="AddschoolReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceSchool %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox5" runat="server" Width="195px"></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox5"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorSchool %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                             <tr>
                                <td class="style50">
                                     <asp:Label ID="AddschoolReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceSchoolCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox39" runat="server" Width="195px"></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator23" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox39"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorSchoolCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                    <asp:Label ID="Addinstitute" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceInstitute %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox6" runat="server" Width="195px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator24" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox6"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorInstitute %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                              <tr>
                                <td class="style50">
                                      <asp:Label ID="AddInstituteCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceInstituteCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox40" runat="server" Width="195px"></asp:TextBox>
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator25" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox40"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorInstituteCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                     <asp:Label ID="AddaddressReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceAddress %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine" Width="245px" 
                                        Height="123px"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator26" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox7"   
                                          ValidationExpression = "^[\s\S]{0,300}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorAddress %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                              <tr>
                                <td class="style50">
                                      <asp:Label ID="AddaddressReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceAddressCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox41" runat="server" TextMode="MultiLine" Width="245px" 
                                        Height="123px"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox41"   
                                          ValidationExpression = "^[\s\S]{0,300}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorAddressCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                     <asp:Label ID="AddcityReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCity %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox8" runat="server" Width="195px"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox8"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorRerefenceCity %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                                 <tr>
                                <td class="style50">
                                     <asp:Label ID="AddcityReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCityCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox42" runat="server" Width="195px"></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator29" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox42"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorRerefenceCityCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                     <asp:Label ID="AddcountryReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCountry %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox9" runat="server" Width="195px"></asp:TextBox>
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator30" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox9"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorRerefenceCountry %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                             <tr>
                                <td class="style50">
                                     <asp:Label ID="AddcountryReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCountryCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox43" runat="server" Width="195px"></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator31" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox43"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorRerefenceCountryCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                    <asp:Label ID="Addphone" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePhone %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox10" runat="server" Width="195px"></asp:TextBox>
                                    
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator32" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox10"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorPhone %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                     <asp:Label ID="Addemail" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceEmail %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox11" runat="server" Width="245px" Height="123px" 
                                        TextMode="MultiLine"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ErrorMessage="Invaild Email" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ControlToValidate="TextBox11">*</asp:RegularExpressionValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator33" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox11"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorEmail %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                    &nbsp;</td>
                                <td class="style46">
                                    <asp:Button ID="Button29" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_submit %>" />
                                    <asp:Button ID="Button32" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" CausesValidation="False" />
                                </td>
                            </tr>
                        </table>
                   
                    </asp:Panel>
                </asp:View>
                <asp:View ID="View13" runat="server">
				    <asp:ValidationSummary ID="ValidationSummary6" runat="server" />
				 <br /><br />
                    <asp:Panel ID="Panel2" runat="server" BackColor="#DEE8F5" Width="1024px" style="margin:0 auto;padding: 30px;">
                   
                        <table class="style3">
                            <tr>
                                <td class="style49">
                                    <asp:Label ID="EditteachName" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceTeacher %>"></asp:Label></td>
                                <td class="style45">
                                    <asp:DropDownList ID="DropDownList3" runat="server" Width="60px">
                                        <asp:ListItem>Prof.</asp:ListItem>
                                        <asp:ListItem>Dr.</asp:ListItem>
                                        <asp:ListItem>Mr.</asp:ListItem>
                                        <asp:ListItem>Ms.</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TextBox12" runat="server" Width="130px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator34" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox12"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorTeacher %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                              <tr>
                                <td class="style49">
                                     <asp:Label ID="EditteachNameCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceTeacherCht %>"></asp:Label></td>
                                <td class="style45">
                                  <asp:TextBox ID="TextBox44" runat="server" Width="130px"></asp:TextBox>
                                    <asp:DropDownList ID="DropDownList2" runat="server" Width="60px">
                                        <asp:ListItem>教授</asp:ListItem>
                                        <asp:ListItem>博士</asp:ListItem>
                                        <asp:ListItem>先生</asp:ListItem>
                                        <asp:ListItem>女士</asp:ListItem>
                                    </asp:DropDownList>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator35" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox44"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorTeacherCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                     <asp:Label ID="Editpos" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePosition %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox13" runat="server" Width="195px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator36" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox13"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorPos %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                              <tr>
                                <td class="style50">
                                     <asp:Label ID="EditposCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePositionCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox45" runat="server" Width="195px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator37" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox45"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorPosCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                     <asp:Label ID="EditprogramReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceProgram %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox14" runat="server" Width="245px" Height="123px" 
                                        TextMode="MultiLine"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator38" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox14"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorProgram %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                             <tr>
                                <td class="style50">
                                   <asp:Label ID="EditprogramReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceProgramCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox46" runat="server" Width="245px" Height="123px" 
                                        TextMode="MultiLine"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator39" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox46"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorProgramCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                      <asp:Label ID="EditschoolReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceSchool %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox15" runat="server" Width="195px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator40" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox15"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorSchool %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                              <tr>
                                <td class="style50">
                                      <asp:Label ID="EditschoolReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceSchoolCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox47" runat="server" Width="195px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator41" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox47"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorSchoolCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                     <asp:Label ID="Editinstitute" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceInstitute %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox16" runat="server" Width="195px"></asp:TextBox>
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator42" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox16"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorInstitute %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                              <tr>
                                <td class="style50">
                                     <asp:Label ID="EditInstituteCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceInstituteCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox48" runat="server" Width="195px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator43" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox48"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorInstituteCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                   <asp:Label ID="EditaddressReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceAddress %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox17" runat="server" TextMode="MultiLine" Width="245px" 
                                        Height="123px"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator44" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox17"   
                                          ValidationExpression = "^[\s\S]{0,300}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorAddress %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                             <tr>
                                <td class="style50">
                                    <asp:Label ID="EditaddressReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceAddressCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox49" runat="server" TextMode="MultiLine" Width="245px" 
                                        Height="123px"></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator45" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox49"   
                                          ValidationExpression = "^[\s\S]{0,300}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorAddressCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                    <asp:Label ID="EditcityReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCity %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox18" runat="server" Width="195px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator46" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox18"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorRerefenceCity %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                               <tr>
                                <td class="style50">
                                     <asp:Label ID="EditcityReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCityCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox50" runat="server" Width="195px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator47" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox50"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorRerefenceCityCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                    <asp:Label ID="EditcountryReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCountry %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox19" runat="server" Height="22px" Width="195px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator48" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox19"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorRerefenceCountry %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                              <tr>
                                <td class="style50">
                                     <asp:Label ID="EditcountryReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCountryCht %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox51" runat="server" Height="22px" Width="195px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator49" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox51"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorRerefenceCountryCht %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                     <asp:Label ID="Editphone" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePhone %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox20" runat="server" Width="195px"></asp:TextBox>
                                    
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator50" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox20"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorPhone %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                    <asp:Label ID="Editemail" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceEmail %>"></asp:Label></td>
                                <td class="style46">
                                    <asp:TextBox ID="TextBox21" runat="server" Width="245px" Height="123px" 
                                        TextMode="MultiLine"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                        ErrorMessage="Invaild Email" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                        ControlToValidate="TextBox21">*</asp:RegularExpressionValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator51" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox21"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorEmail %>">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style50">
                                    &nbsp;</td>
                                <td class="style46">
                                    <asp:Button ID="Button27" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" />
                                    <asp:Button ID="Button33" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" CausesValidation="False" />
                                </td>
                            </tr>
                        </table>
                   
                    </asp:Panel>
                </asp:View>
                  <asp:View ID="View14" runat="server">
               
                      <asp:MultiView ID="MultiView3" runat="server" ActiveViewIndex="0">
                          <asp:View ID="View1" runat="server">
						  <div style="margin-left:50px;">
						
                             <asp:Label ID="workexp" runat="server" Text="<%$ Resources:Resource, sip_workExperience %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                              <br /><br />
                              <asp:Button ID="addWork" runat="server" CausesValidation="False" Text="<%$ Resources:Resource, sip_sp_addwork %>" 
                                     CssClass="blue" />
                              <br /><br />
            <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource6" Width="1000px" 
                          CssClass="GridViewStyle" AllowSorting="True" GridLines="Horizontal" 
                                     EmptyDataText="<%$ Resources:Resource, sip_data_check %>">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                  <asp:TemplateField></asp:TemplateField>
                    <asp:BoundField DataField="start_year" HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" 
                        SortExpression="start_year" DataFormatString="{0:yyyy/MM/dd}" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="end_year" HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" 
                        SortExpression="end_year" DataFormatString="{0:yyyy/MM/dd}" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_jobName %>" SortExpression="job">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("job") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                             <asp:LinkButton ID="jobLink" runat="server" CommandName="Select" 
                                Text='<%# Bind("job") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_jobNameCht %>" SortExpression="jobCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("jobCht") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                           <asp:LinkButton ID="jobLinkCht" runat="server" CommandName="Select" 
                                Text='<%# Bind("jobCht") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="company" HeaderText="<%$ Resources:Resource, sip_sp_company %>" 
                        SortExpression="company">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="companyCht" HeaderText="<%$ Resources:Resource, sip_sp_companyCht %>" 
                        SortExpression="companyCht">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="city" HeaderText="<%$ Resources:Resource, sip_sp_city %>" SortExpression="city">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="cityCht" HeaderText="<%$ Resources:Resource, sip_sp_cityCht %>" 
                        SortExpression="cityCht">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Select" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_relevantDescrib %>"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <RowStyle CssClass="GridViewRowStyle" />
                <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
            </asp:GridView>
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" DataKeyNames="id" 
                DataSourceID="SqlDataSource7" GridLines="Horizontal" 
                Height="19px" Width="575px" CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                <Fields>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" SortExpression="start_year">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("start_year", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                     <asp:CompareValidator ID="CompareValidator7" runat="server" 
                                            ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                    <Ajax:CalendarExtender ID="CalendarExtender7" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox1">
                        </Ajax:CalendarExtender>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("start_year", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                         <asp:CompareValidator ID="CompareValidator8" runat="server" 
                                            ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                             <Ajax:CalendarExtender ID="CalendarExtender8" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox1">
                        </Ajax:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Bind("start_year", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" SortExpression="end_year">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" 
                                Text='<%# Bind("end_year", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator9" runat="server" 
                                            ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                    <Ajax:CalendarExtender ID="CalendarExtender9" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox2">
                        </Ajax:CalendarExtender>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" 
                                Text='<%# Bind("end_year", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                 <asp:CompareValidator ID="CompareValidator10" runat="server" 
                                            ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                            <Ajax:CalendarExtender ID="CalendarExtender10" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox2">
                        </Ajax:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" 
                                Text='<%# Bind("end_year", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_sp_jobName %>" SortExpression="job">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("job") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditJob" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox3"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorJobName %>">*</asp:RegularExpressionValidator>        

                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("job") %>'></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsJob" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox3"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorJobName %>">*</asp:RegularExpressionValidator> 
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("job") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_jobNameCht %>" SortExpression="jobCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("jobCht") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditJobCht" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox4"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorJobNameCht %>">*</asp:RegularExpressionValidator>        
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("jobCht") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsJobCht" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox4"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorJobNameCht %>">*</asp:RegularExpressionValidator>        
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("jobCht") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_sp_company %>" SortExpression="company">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("company") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCompany" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox5"   
                                          ValidationExpression = "^[\s\S]{0,200}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCompany %>">*</asp:RegularExpressionValidator>        
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("company") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCompany" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox5"   
                                          ValidationExpression = "^[\s\S]{0,200}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCompany %>">*</asp:RegularExpressionValidator>        
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("company") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_companyCht %>" SortExpression="companyCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("companyCht") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCompanyCht" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox6"   
                                          ValidationExpression = "^[\s\S]{0,200}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCompanyCht %>">*</asp:RegularExpressionValidator>              
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("companyCht") %>'></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCompanyCht" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox6"   
                                          ValidationExpression = "^[\s\S]{0,200}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCompanyCht %>">*</asp:RegularExpressionValidator>              
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("companyCht") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_sp_city %>" SortExpression="city">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCity" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox7"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCity %>">*</asp:RegularExpressionValidator>              
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCity" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox7"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCity %>">*</asp:RegularExpressionValidator>              
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_sp_cityCht %>" SortExpression="cityCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("cityCht") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCityCht" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox8"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCityCht %>">*</asp:RegularExpressionValidator>              
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("cityCht") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCityCht" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox8"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCityCht %>">*</asp:RegularExpressionValidator> 
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("cityCht") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_edit %>"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="New" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_new %>"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                CommandName="Delete" OnClientClick="ConfirmMessage();" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_del %>"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="<%$ Resources:Resource, sip_sp_update %>" ForeColor="#0095CD"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="<%$ Resources:Resource, sip_sp_cancel %>" ForeColor="#0095CD"></asp:LinkButton>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="<%$ Resources:Resource, sip_ins %>" ForeColor="#0095CD"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="<%$ Resources:Resource, sip_sp_cancel %>" ForeColor="#0095CD"></asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemStyle ForeColor="#0095CD" />
                    </asp:TemplateField>
                </Fields>
                <RowStyle CssClass="GridViewRowStyle2" />
            </asp:DetailsView>
            <br />
                      <asp:Button ID="Button35" runat="server" CssClass="blue" CausesValidation="False" Text="<%$ Resources:Resource, sip_back %>" 
                          Visible="False" />
            <br />
                                 
            <span class="style1">
                      <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                          
                                     SelectCommand="SELECT * FROM [StudentWorks] WHERE ([pess_cod] = @pess_cod) ORDER BY [start_year] DESC">

                          <SelectParameters>
                               <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                         </SelectParameters>

                      </asp:SqlDataSource>
                                 
                      <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                          DeleteCommand="DELETE FROM [StudentWorks] WHERE [id] = @id" 
                          InsertCommand="INSERT INTO [StudentWorks] ([pess_cod], [start_year], [end_year], [job], [company], [city], [jobCht], [companyCht], [cityCht]) VALUES (@pess_cod, @start_year, @end_year, @job, @company, @city, @jobCht, @companyCht, @cityCht)" 
                          SelectCommand="SELECT * FROM [StudentWorks] WHERE ([id] = @id)" 
                          
                                     UpdateCommand="UPDATE [StudentWorks] SET [pess_cod] = @pess_cod, [start_year] = @start_year, [end_year] = @end_year, [job] = @job, [company] = @company, [city] = @city, [jobCht] = @jobCht, [companyCht] = @companyCht, [cityCht] = @cityCht WHERE [id] = @id">
                          <DeleteParameters>
                              <asp:Parameter Name="id" Type="Int32" />
                          </DeleteParameters>
                          <InsertParameters>
                        
                             <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                              <asp:Parameter DbType="DateTime" Name="start_year" />
                         
                              <asp:Parameter Name="end_year" DbType="DateTime" />
                              <asp:Parameter Name="job" Type="String" />
                              <asp:Parameter Name="company" Type="String" />
                              <asp:Parameter Name="city" Type="String" />
                              <asp:Parameter Name="jobCht" Type="String" />
                              <asp:Parameter Name="companyCht" Type="String" />
                              <asp:Parameter Name="cityCht" Type="String" />
                          </InsertParameters>
                          <SelectParameters>
                              <asp:ControlParameter ControlID="GridView4" Name="id" 
                                  PropertyName="SelectedValue" Type="Int32" />
                          </SelectParameters>
                          <UpdateParameters>
                              <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                              <asp:Parameter DbType="DateTime" Name="start_year" />
                              <asp:Parameter Name="end_year" DbType="DateTime" />
                              <asp:Parameter Name="job" Type="String" />
                              <asp:Parameter Name="company" Type="String" />
                              <asp:Parameter Name="city" Type="String" />
                              <asp:Parameter Name="jobCht" Type="String" />
                              <asp:Parameter Name="companyCht" Type="String" />
                              <asp:Parameter Name="cityCht" Type="String" />
                              <asp:Parameter Name="id" Type="Int32" />
                          </UpdateParameters>
                      </asp:SqlDataSource>
                      </span><br />
					  </div>
                     </asp:View>
                          <asp:View ID="View2" runat="server">
                           <br/><br/><br/>
                           <div style="width:1024px; height: 321px;" id="Div1">
                           <div style="width:447px; float:left; height: 272px; margin-right: 80px;">
                              <table class="style17">
                                  <tr>
                                      <td class="style30">
                                          <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, sip_sp_Addstartdate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
                                          <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                              ControlToValidate="TextBox22" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                               <Ajax:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox22">
                        </Ajax:CalendarExtender>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style30">
                                          <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, sip_sp_Addenddate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
                                          <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                              ControlToValidate="TextBox23" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                               <Ajax:CalendarExtender ID="CalendarExtender2" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox23">
                        </Ajax:CalendarExtender>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style26">
                                          <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, sip_sp_AddjobName %>"></asp:Label>
                                      </td>
                                      <td class="style27">
                                          <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox24"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorJobName %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                    <tr>
                                      <td class="style30">
                                          <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Resource, sip_sp_AddjobNameCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox33" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox33"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorJobNameCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style30">
                                          <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, sip_sp_AddCompany %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox25"   
                                          ValidationExpression = "^[\s\S]{0,200}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCompany %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                    <tr>
                                      <td class="style30">
                                          <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Resource, sip_sp_AddCompanyCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox34" runat="server"></asp:TextBox>
                                               <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox34"   
                                          ValidationExpression = "^[\s\S]{0,200}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCompanyCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style30">
                                          <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, sip_sp_AddCity%>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox26"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCity %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                    <tr>
                                      <td class="style30">
                                          <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Resource, sip_sp_AddCityCht%>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox35" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox35"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCityCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style30">
                                          &nbsp;</td>
                                      <td class="style23">
                                      <br />
                                          <asp:Button ID="workIns" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_confirm %>" />
                                          <asp:Button ID="workCel" runat="server" CssClass="blue" CausesValidation="False" Text="<%$ Resources:Resource, sip_sp_cancel %>" />
                                         
                                      </td>
                                  </tr>
                                   <tr>
                                   <td class="style30" colspan="2">
                                   <asp:ValidationSummary ID="ValidationSummary4" runat="server" Width="430px" />
                                   </td>
                                   </tr>
                              </table>
                              </div>
                                   <div style="width:227px; float:left;">
             
            </div>

<div style="clear:both; height: 1px; width: 681px;">
 
      
 
        </div>
</div>
                          </asp:View>
                      </asp:MultiView>
            
            
     
                </asp:View>
                <asp:View ID="View15" runat="server">
                    <asp:MultiView ID="MultiView4" runat="server" ActiveViewIndex="0">
                        <asp:View ID="View3" runat="server">
	<div style="margin-left:50px;">
                             
   <asp:Label ID="relevantExp" runat="server" Text="<%$ Resources:Resource, sip_relevantExperience %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
                  <br />
                    <br />
                
    <asp:Button ID="reLevantBtn" runat="server" CausesValidation="False" Text="<%$ Resources:Resource, sip_sp_addrelevant %>" 
                                     CssClass="blue" />
                              <br /><br />
                    <asp:GridView ID="GridView5" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" 
                        DataKeyNames="id" DataSourceID="SqlDataSource12" 
                        GridLines="Horizontal" Width="1000px" CssClass="GridViewStyle" 
                                  EmptyDataText="<%$ Resources:Resource, sip_data_check %>">
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <Columns>
                         <asp:TemplateField></asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" SortExpression="startDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" 
                                        Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>' Width="80px"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidatorGridVant" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                        Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                            <Ajax:CalendarExtender ID="CalendarExtenderGridVant" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox1">
                        </Ajax:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" SortExpression="endDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" 
                                        Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>' Width="80px"></asp:TextBox>
                                         <asp:CompareValidator ID="CompareValidatorGridVantEnd" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                        Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                            <Ajax:CalendarExtender ID="CalendarExtenderGridVantEnd" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox2">
                        </Ajax:CalendarExtender>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_courseName %>" SortExpression="course">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("course") %>'></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCourse" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox3"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourse %>">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                 <asp:LinkButton ID="courseLink" runat="server" CommandName="Select" 
                                        Text='<%# Bind("course") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>" SortExpression="organization">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("organization") %>'></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditOrg" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox4"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourseOrg %>">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("organization") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantCity %>" SortExpression="city">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCity" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox5"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCity %>">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_sp_relevantCountry %>" SortExpression="country">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("country") %>'></asp:TextBox>
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCountry" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox6"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCountry %>">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                        CommandName="Update" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_update %>"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_cancel %>"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Edit"  Visible='<% #show() %>' ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_edit %>"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Delete"  OnClientClick="ConfirmMessage();" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_del %>"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle CssClass="GridViewHeaderStyle" ForeColor="White" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                        <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                        <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
                    </asp:GridView>
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                    <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                        DeleteCommand="DELETE FROM [RelevantExperience] WHERE [id] = @id" 
                        InsertCommand="INSERT INTO [RelevantExperience] ([ALUN_NUMERO], [ALUN_NUMERO_SEQ], [pess_cod], [date], [course], [detail], [organization], [city], [country]) VALUES (@ALUN_NUMERO, @ALUN_NUMERO_SEQ, @pess_cod, @date, @course, @detail, @organization, @city, @country)" 
                        SelectCommand="SELECT * FROM [RelevantExperience]" 
                        UpdateCommand="UPDATE [RelevantExperience] SET [ALUN_NUMERO] = @ALUN_NUMERO, [ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ, [pess_cod] = @pess_cod, [date] = @date, [course] = @course, [detail] = @detail, [organization] = @organization, [city] = @city, [country] = @country WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="ALUN_NUMERO" Type="String" />
                            <asp:Parameter Name="ALUN_NUMERO_SEQ" Type="Decimal" />
                            <asp:Parameter Name="pess_cod" Type="Decimal" />
                            <asp:Parameter DbType="DateTime" Name="date" />
                            <asp:Parameter Name="course" Type="String" />
                            <asp:Parameter Name="detail" Type="String" />
                            <asp:Parameter Name="organization" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="country" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ALUN_NUMERO" Type="String" />
                            <asp:Parameter Name="ALUN_NUMERO_SEQ" Type="Decimal" />
                            <asp:Parameter Name="pess_cod" Type="Decimal" />
                            <asp:Parameter DbType="DateTime" Name="date" />
                            <asp:Parameter Name="course" Type="String" />
                            <asp:Parameter Name="detail" Type="String" />
                            <asp:Parameter Name="organization" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="country" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                        DeleteCommand="DELETE FROM [RelevantExperience] WHERE [id] = @id" 
                        InsertCommand="INSERT INTO [RelevantExperience] ([pess_cod], [startDate], [endDate], [course], [detail], [organization], [city], [country]) VALUES (@pess_cod, @startDate, @endDate, @course, @detail, @organization, @city, @country)" 
                        SelectCommand="SELECT * FROM [RelevantExperience] WHERE ([pess_cod] = @pess_cod) ORDER BY [startDate] DESC"
                        
            UpdateCommand="UPDATE [RelevantExperience] SET [pess_cod] = @pess_cod, [startDate] = @startDate, [endDate] = @endDate, [course] = @course, [detail] = @detail, [organization] = @organization, [city] = @city, [country] = @country WHERE [id] = @id">
                         <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                           
                            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                             <asp:Parameter DbType="DateTime" Name="startDate" />
                            <asp:Parameter Name="endDate" DbType="DateTime" />
                            <asp:Parameter Name="course" Type="String" />
                            <asp:Parameter Name="detail" Type="String" />
                            <asp:Parameter Name="organization" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="country" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                           <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                        </SelectParameters>
                           <UpdateParameters>
                           <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                           <asp:Parameter DbType="DateTime" Name="startDate" />
                            <asp:Parameter Name="endDate" DbType="DateTime" />
                            <asp:Parameter Name="course" Type="String" />
                            <asp:Parameter Name="detail" Type="String" />
                            <asp:Parameter Name="organization" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="country" Type="String" />
                               <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:DetailsView ID="DetailsView3" runat="server" AllowPaging="True" 
                        AutoGenerateRows="False" DataKeyNames="id" 
                        DataSourceID="SqlDataSource13" GridLines="Horizontal" 
                        Height="32px" Width="575px" CssClass="GridViewStyle">
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                        <Fields>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" SortExpression="startDate">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                              
                                                <asp:TextBox ID="TextBox1" runat="server" 
                                                    Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                
                                                <asp:CompareValidator ID="CompareValidator11" runat="server" 
                                                    ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                                    Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                    <Ajax:CalendarExtender ID="CalendarExtender11" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox1">
                        </Ajax:CalendarExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                  
                                                <asp:TextBox ID="TextBox1" runat="server" 
                                                    Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                        
                                                <asp:CompareValidator ID="CompareValidator12" runat="server" 
                                                    ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                                    Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                             <Ajax:CalendarExtender ID="CalendarExtender12" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox1">
                        </Ajax:CalendarExtender>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" SortExpression="endDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" 
                                        Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                       <asp:CompareValidator ID="CompareValidatorDetailEndDate" runat="server" 
                                                    ControlToValidate="TextBox3" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                                    Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                    <Ajax:CalendarExtender ID="CalendarExtenderDetailEndDate" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox3">
                              </Ajax:CalendarExtender>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" 
                                        Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                    
                                       <asp:CompareValidator ID="CompareValidatorDetailInsEndDate" runat="server" 
                                                    ControlToValidate="TextBox3" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                                    Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                    <Ajax:CalendarExtender ID="CalendarExtenderDetailInsEndDate" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox3">
                              </Ajax:CalendarExtender>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" 
                                        Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_sp_courseName %>" SortExpression="course">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("course") %>'></asp:TextBox>
                                      <asp:RegularExpressionValidator ID="ValidatorEditCourse" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox4"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourse %>">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("course") %>'></asp:TextBox>
                                      <asp:RegularExpressionValidator ID="ValidatorInsCourse" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox4"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourse %>">*</asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("course") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantDescrib %>" 
                                SortExpression="detail">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("detail") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Height="123px" 
                                        Text='<%# Bind("detail") %>' TextMode="MultiLine" Width="228px"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="ValidatorEditCourseDetail" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox2"   
                                          ValidationExpression = "^[\s\S]{0,500}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourseDetail %>">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Height="123px" 
                                        Text='<%# Bind("detail") %>' TextMode="MultiLine" Width="228px"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="ValidatorInsCourseDetail" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox2"   
                                          ValidationExpression = "^[\s\S]{0,500}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourseDetail %>">*</asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>" SortExpression="organization">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("organization") %>'></asp:TextBox>
                                       <asp:RegularExpressionValidator ID="ValidatorEditCourseOrg" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox5"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourseOrg %>">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("organization") %>'></asp:TextBox>
                                      <asp:RegularExpressionValidator ID="ValidatorInsCourseOrg" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox5"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourseOrg %>">*</asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("organization") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_sp_city %>" SortExpression="city">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="ValidatorEditCourseCity" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox6"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_sp_errorCity %>">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("city") %>'></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="ValidatorInsCourseCity" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox6"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_sp_errorCity %>">*</asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("city") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantCountry %>"  SortExpression="country">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("country") %>'></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="ValidatorEditCourseCountry" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox7"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_sp_errorCountry %>">*</asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("country") %>'></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="ValidatorInsCourseCountry" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox7"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_sp_errorCountry %>">*</asp:RegularExpressionValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Edit" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_edit %>"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="New" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_new %>"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                        CommandName="Delete" OnClientClick="ConfirmMessage();" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_del %>"></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                        CommandName="Update" Text="<%$ Resources:Resource, sip_sp_update %>" ForeColor="#0095CD"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" Text="<%$ Resources:Resource, sip_sp_cancel %>" ForeColor="#0095CD"></asp:LinkButton>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                        CommandName="Insert" Text="<%$ Resources:Resource, sip_ins %>" ForeColor="#0095CD"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" Text="<%$ Resources:Resource, sip_sp_cancel %>" ForeColor="#0095CD"></asp:LinkButton>
                                </InsertItemTemplate>
                                <ItemStyle ForeColor="#0095CD" />
                            </asp:TemplateField>
                        </Fields>
                        <RowStyle CssClass="GridViewRowStyle2" />
                    </asp:DetailsView>
                     <br />
                    <asp:Button ID="Button36" runat="server" CssClass="blue" CausesValidation="False" Text="<%$ Resources:Resource, sip_back %>" 
                        Visible="False" />
                    <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                        DeleteCommand="DELETE FROM [RelevantExperience] WHERE [id] = @id" 
                        InsertCommand="INSERT INTO [RelevantExperience] ([pess_cod], [startDate], [endDate], [course], [detail], [organization], [city], [country]) VALUES (@pess_cod, @startDate, @endDate, @course, @detail, @organization, @city, @country)" 
                        SelectCommand="SELECT [id], [startDate], [endDate], [course],[detail],[organization],[city],[country] FROM [RelevantExperience] WHERE ([id] = @id)" 
                        UpdateCommand="UPDATE [RelevantExperience] SET [pess_cod] = @pess_cod, [startDate] = @startDate, [endDate] = @endDate, [course] = @course, [detail] = @detail, [organization] = @organization, [city] = @city, [country] = @country WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                           
                            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                            <asp:Parameter DbType="DateTime" Name="startDate" />
                              <asp:Parameter DbType="DateTime" Name="endDate" />
                            <asp:Parameter Name="course" Type="String" />
                            <asp:Parameter Name="detail" Type="String" />
                            <asp:Parameter Name="organization" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="country" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridView5" Name="id" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                           <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                              <asp:Parameter DbType="DateTime" Name="startDate" />
                              <asp:Parameter DbType="DateTime" Name="endDate" />
                            <asp:Parameter Name="course" Type="String" />
                            <asp:Parameter Name="detail" Type="String" />
                            <asp:Parameter Name="organization" Type="String" />
                            <asp:Parameter Name="city" Type="String" />
                            <asp:Parameter Name="country" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <br />
            <br />
                    <br />

</div>
                            
                        </asp:View>
                        <asp:View ID="View4" runat="server">
						<br /><br /><br /><br />
                          <div style="width:1024px; height: 321px;" id="Div2">
                           <div style="width:337px; float:left; height: 272px;">
                              <table class="style17">
                                  <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource, sip_sp_Addstartdate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox27" runat="server"></asp:TextBox>
                                          <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                              ControlToValidate="TextBox27" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                               <Ajax:CalendarExtender ID="CalendarExtender3" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox27">
                        </Ajax:CalendarExtender>
                                      </td>
                                  </tr>
                                   <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Resource, sip_sp_Addenddate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox52" runat="server"></asp:TextBox>
                                          <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                              ControlToValidate="TextBox52" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                               <Ajax:CalendarExtender ID="CalendarExtender4" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox52">
                        </Ajax:CalendarExtender>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource, sip_sp_addcourseName %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox28" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox28"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourse %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Resource, sip_sp_AddrelevantDescrib %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox29" runat="server" Height="123px" TextMode="MultiLine" 
                                              Width="228px"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox29"   
                                          ValidationExpression = "^[\s\S]{0,500}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourseDetail %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Resource, sip_sp_AddrelevantOrg %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox30" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox30"   
                                          ValidationExpression = "^[\s\S]{0,100}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCourseOrg %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, sip_sp_AddCity %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox31" runat="server"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox31"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCity %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Resource, sip_sp_AddrelevantCountry %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="TextBox32" runat="server"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" 
                                          Display = "Dynamic" ControlToValidate = "TextBox32"   
                                          ValidationExpression = "^[\s\S]{0,50}$"  
                                          ErrorMessage="<%$ Resources:Resource, sip_sp_errorCountry %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style22">
                                          &nbsp;</td>
                                      <td class="style23">
                                      <br />
                                          <asp:Button ID="relevantIns" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_confirm %>" />
                                          <asp:Button ID="relevantCel" runat="server" CssClass="blue" CausesValidation="False" Text="<%$ Resources:Resource, sip_sp_cancel %>" />
                                        
                                      </td>
                                  </tr>
                                       <tr>
                                   <td class="style22" colspan="2">
                                   <asp:ValidationSummary ID="ValidationSummary3" runat="server" Width="325px" />
                                   </td>
                                   </tr>
                              </table>
                              </div>
                                   <div style="width:227px; float:left;">
             
            </div>

<div style="clear:both; height: 1px; width: 681px;">
 
      
 
        </div>
</div>



                            </asp:View>

                    </asp:MultiView>
           
                 </asp:View>
                <asp:View ID="View16" runat="server">
                <asp:DataList ID="DataList1" runat="server" 
                        DataSourceID="SqlDataSource10" Height="10px" 
                        Width="1024px" DataKeyField="id" CssClass="GridViewStyle">
                        <AlternatingItemStyle CssClass="GridViewAlternatingRowStyle2" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <HeaderTemplate>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="instructorInfoTeach" runat="server" Text="<%$ Resources:Resource, sip_instructorReference %>"></asp:Label>
                        </HeaderTemplate>
                        <ItemStyle CssClass="GridViewRowStyle2" />
                        <ItemTemplate>
                           <br />
                            <br />
                           <asp:Label ID="teachName" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceTeacher %>"></asp:Label>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Teacher_Type" runat="server" 
                                Text='<%# Eval("teacher_type") %>' />
                            <asp:Label ID="teacherLabel" runat="server" Text='<%# Eval("teacher") %>' />
                            <br />
                            <br />
                              <asp:Label ID="teachNameCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceTeacherCht %>"></asp:Label>
                              &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;   
                             <asp:Label ID="teacherChtLabel" runat="server" Text='<%# Eval("teacherCht") %>' />
                             <asp:Label ID="teacher_typeChtLabel" runat="server" 
                                Text='<%# Eval("teacher_typeCht") %>' />
                            <br />
                            <br />
                            <asp:Label ID="pos" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePosition %>"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="positionLabel" runat="server" Text='<%# Eval("position") %>' />
                            <br />
                            <br />
                            <asp:Label ID="posCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePositionCht %>"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="positionChtLabel" runat="server" Text='<%# Eval("positionCht") %>' />
                            <br />
                            <br />
                            <asp:Label ID="programReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceProgram %>"></asp:Label>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="programLabel" runat="server" Text='<%# Eval("program") %>' />
                            <br />
                            <br />
                             <asp:Label ID="programReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceProgramCht %>"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                            <asp:Label ID="programChtLabel" runat="server" Text='<%# Eval("programCht") %>' />
                            <br />
                            <br />
                            <asp:Label ID="schoolReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceSchool %>"></asp:Label>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="schoolLabel" runat="server" Text='<%# Eval("school") %>' />
                            <br />
                            <br />
                              <asp:Label ID="schoolReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceSchoolCht %>"></asp:Label>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                            <asp:Label ID="schoolChtLabel" runat="server" Text='<%# Eval("schoolCht") %>' />
                            <br />
                            <br />
                             <asp:Label ID="institute" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceInstitute %>"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:Label ID="instituteLabel" runat="server" Text='<%# Eval("institute") %>' />
                            <br />
                            <br />
                               <asp:Label ID="InstituteCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceInstituteCht %>"></asp:Label>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:Label ID="instituteChtLabel" runat="server" Text='<%# Eval("instituteCht") %>' />
                            <br />
                            <br />
                             <asp:Label ID="addressReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceAddress %>"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                            <br />
                            <br />
                            <asp:Label ID="addressReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceAddressCht %>"></asp:Label>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:Label ID="addressChtLabel" runat="server" Text='<%# Eval("addressCht") %>' />
                            <br />
                            <br />
                             <asp:Label ID="cityReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCity %>"></asp:Label>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                            <asp:Label ID="cityLabel" runat="server" Text='<%# Eval("city") %>' />
                            <br />
                            <br />
                             <asp:Label ID="cityReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCityCht %>"></asp:Label>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:Label ID="cityChtLabel" runat="server" Text='<%# Eval("cityCht") %>' />
                            <br />
                            <br />
                              <asp:Label ID="countryReference" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCountry %>"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:Label ID="countryLabel" runat="server" Text='<%# Eval("country") %>' />
                            <br />
                            <br />
                               <asp:Label ID="countryReferenceCht" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceCountryCht %>"></asp:Label>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                             <asp:Label ID="countryChtLabel" runat="server" Text='<%# Eval("countryCht") %>' />
                            <br />
                            <br />
                            <asp:Label ID="phone" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePhone %>"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                            <asp:Label ID="phoneLabel" runat="server" 
                                Text='<%# Eval("phone") %>' />
                            <br />
                            <br />
                            <asp:Label ID="email" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceEmail %>"></asp:Label>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                            <br />
                            &nbsp;<asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' 
                                Visible="False" />
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </asp:View>
                <asp:View ID="View17" runat="server">
         
            <asp:Label ID="perInfo" runat="server" Text="<%$ Resources:Resource, sip_person_info %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
			<br />
			<div align="center">
                    <iframe ID="I2" frameborder="no" scrolling="no" 
                        src="http://172.26.122.66/siweb/stud_info.asp" style="width:900px;min-height:675px;overflow: auto;"></iframe>
						</div>
             <br />
            
            <br />
                    
                </asp:View>
             <asp:View ID="View18" runat="server">
                

            <asp:Label ID="eduInfo" runat="server" Text="<%$ Resources:Resource, sip_edu_info %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>

                        
            <div id="Div3">
            
            <br />

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                
                SelectCommand="SELECT [START_YEAR], [END_YEAR], [LEVEL_CH]+' / '+ [LEVEL_EN] AS LEVEL, ISNULL([SCHOOL_CH],'')+CASE when [SCHOOL_CH]!='' AND [SCHOOL_EN]!='' Then '/' ELSE '' END+ISNULL([SCHOOL_EN],'') AS School FROM [education_info] WHERE ([PESS_COD] = @PESS_COD) ORDER BY [END_YEAR]">
                <SelectParameters>
                     
                      <asp:SessionParameter Name="PESS_COD" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                SelectCommand="SELECT STUDENT_ID,SCHOOL_CODE+' / '+SCHOOL_CH+' / '+SCHOOL_EN AS School, PROGRAM_COMPOSITE_CODE,PROGRAM_COMPOSITE_CH,PROGRAM_COMPOSITE_EN,STUDENT_STATUS_EN,GPA FROM [student_academic_info] WHERE ([ALUN_NUMERO] = @ALUN_NUMERO AND [ALUN_NUMERO_SEQ] = @ALUN_NUMERO_SEQ) ORDER BY [STUDENT_ID] DESC">
                <SelectParameters>
                   <asp:SessionParameter Name="ALUN_NUMERO" SessionField="ALUN_NUMERO" Type="String" />
                   <asp:SessionParameter Name="ALUN_NUMERO_SEQ" SessionField="ALUN_NUMERO_SEQ" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            	<div align="center">

            <asp:DetailsView 
                ID="DetailsView2" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" DataSourceID="SqlDataSource5" Font-Names="Calibri" 
                GridLines="Horizontal" Height="50px" Width="1024px" 
                CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Fields>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="<%$ Resources:Resource, sip_advice_std_id %>" 
                        SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="School" HeaderText="<%$ Resources:Resource, sip_edu_school %>" 
                        ReadOnly="True" SortExpression="School" />
                    <asp:BoundField DataField="PROGRAM_COMPOSITE_CODE" HeaderText="<%$ Resources:Resource, sip_edu_program %>" 
                        SortExpression="PROGRAM_COMPOSITE_CODE" />
                    <asp:BoundField DataField="PROGRAM_COMPOSITE_CH" 
                        SortExpression="PROGRAM_COMPOSITE_CH" />
                    <asp:BoundField DataField="PROGRAM_COMPOSITE_EN" 
                        SortExpression="PROGRAM_COMPOSITE_EN" />
                    <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                </Fields>
                <RowStyle CssClass="GridViewRowStyle" />
            </asp:DetailsView>
              <br />
            
            <br />
            <asp:DataList ID="DataList2" runat="server" 
                DataSourceID="SqlDataSource2" Width="1024px" CssClass="GridViewStyle">
                <AlternatingItemStyle CssClass="GridViewAlternatingRowStyle" />
                <ItemStyle CssClass="GridViewRowStyle" />
                <ItemTemplate>
                    <asp:Label ID="from" runat="server" Text="<%$ Resources:Resource, sip_sp_from %>"></asp:Label>
                 &nbsp;&nbsp;
                    <asp:Label ID="START_YEARLabel" runat="server" 
                        Text='<%# Eval("START_YEAR") %>' />
                    <br />
                    <br />
                    <asp:Label ID="to" runat="server" Text="<%$ Resources:Resource, sip_sp_to %>"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="END_YEARLabel" runat="server" Text='<%# Eval("END_YEAR") %>' />
                    <br />
                    <br />
                    <asp:Label ID="EduLevel" runat="server" Text="<%$ Resources:Resource, sip_edu_level %>"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:Label ID="LEVELLabel" runat="server" Text='<%# Eval("LEVEL") %>' />
                    <br />
                    <br />
                     <asp:Label ID="EduSchool" runat="server" Text="<%$ Resources:Resource, sip_sp_referenceSchool %>"></asp:Label>
                    <asp:Label ID="SchoolLabel" runat="server" Text='<%# Eval("School") %>' />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <br />
        </div>

        </div>





             </asp:View>
            </asp:MultiView>

            <table class="style3">
                <tr>
                    <td class="style6">
                        <span class="style1">
                        <asp:Button ID="Button15" runat="server" CssClass="blue" CausesValidation="False" Text="Biography" 
                            Width="200px" />
                        <br />
                        <br />
                        </span></td>
                    <td class="style6">
                        <span class="style1">
                        <asp:Button ID="Button10" runat="server" CausesValidation="False" CssClass="blue" 
                            Text="Technical Skills" Width="200px" />
                        <br />
                        <br />
                        </span></td>
                    <td class="style6">
                        <span class="style1">
                        <asp:Button ID="Button11" runat="server" CssClass="blue" CausesValidation="False" Text="Social Skills " 
                            Width="200px" />
                        <br />
                        <br />
                        </span></td>
                    <td class="style6">
                          <span class="style1">
                          <asp:Button ID="Button28" runat="server" CausesValidation="False" CssClass="blue" 
                              Text="Work Experience" Width="200px" />
                          <br />
                          <br />
                          </span></td>
                </tr>
                <tr>
                    <td class="style7">
                        <span class="style1">
                        <asp:Button ID="Button34" runat="server" CausesValidation="False" CssClass="blue" 
                            Text="Relevant Experience" Width="200px" />
                        </span>
                    </td>
                    <td class="style7">
                        <span class="style1">
                        <asp:Button ID="Button12" runat="server" CssClass="blue" CausesValidation="False" Text="Languages" 
                            Width="200px" />
                        </span>
                    </td>
                    <td class="style7">
                        <span class="style1">
                        <asp:Button ID="Button13" runat="server" CssClass="blue" CausesValidation="False" Text="Interests" 
                            Width="200px" />
                        </span>
                    </td>
                    <td class="style7">
                        <span class="style1">
                        <asp:Button ID="Button4" runat="server" CssClass="blue" CausesValidation="False" Text="References" 
                            Width="200px" />
                        </span>
                    </td>
                </tr>
            </table>
          </asp:View>
        <asp:View ID="ViewEducation" runat="server">
        


        </asp:View>
        <asp:View ID="ViewAcademicResult" runat="server">
            <br /><br /><br />
            <span class="style1">Academic Results<br />
            <br /><br />
            </span>




			<div align="center">
             <iframe id="I1" frameborder="no" scrolling="no" src="http://172.26.122.66/siweb/grade.asp"  style="width:900px;min-height:1280px;overflow: auto;padding-bottom:30px;"></iframe>
                 

			 </div>
            <br />
            <br />
        </asp:View>
        
    </asp:MultiView>
          <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="position" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>
    </div>
	</div>

</td>
</tr>
    </table>
    </form>

</body>
</html>
