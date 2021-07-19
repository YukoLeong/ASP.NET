<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Community.aspx.vb" ClientTarget="uplevel" Inherits="Student_Community" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="Ajax" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
            font-size: x-large;
           
        }
        .style2
        {
            width: 130%;
            height: 306px;
        }
        .style9
        { width: 100%;
        }
        .style10
        {
             width: 128px;
        }
        .style11
        {
        }
         .ajax__htmleditor_editor_bottomtoolbar {
            display :none;
         }
        
        #imageStyle {
	margin:0px auto;
	width:252px; height:252px;
	
        }
        .image {
	float:left;
	position:relative;
	margin:3px;
        }

        .image:hover {
	border:0; 
	z-index:1;
        }
        .image span { 
	position:absolute;
	visibility:hidden;
        }
        .image:hover span { 
	visibility:visible;
	top:37px; left:37px; 
        }
	
        #ImageButton2{
            width:150px;
            height:55px;
        }


                /*animatemenu*/

		#main-nav-wrapper{			
			overflow:hidden;
			margin-left: 10%;
		}

        .main-nav {
           position: absolute;
             /* bottom: 0;*/
			/*width:1024px;*/	
            width:900px;		
			height: 100px;
            padding: 0;
            text-align: right;
			margin-left: auto;
            margin-right: auto;
			margin: 0;
            font-size: 0;
            /*margin-top:-184px;*/
            /*z-index:-1;*/
            top:10px;
            
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
                    /*background-color: #00a7ef;*/
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

                .main-nav-list li .aimg {
                    display: inline-block;
                    cursor: pointer;
                    margin: 0;
                    padding: 0;
                }

                /*animatemenu close*/



        .style12
        {
            height: 42px;
        }
        .style13
        {
            width: 128px;
            height: 42px;
        }



        .style14
        {
            width: 117px;
        }

        .aimg{
            width:75px;
        }
        .aimgactive{
            width:130px;
        }

        </style>

     

    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
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
<body background="images/church.gif" onkeypress="return CancelReturnKey();">
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

    <tr>
<td>
    <div>
    
<%--        <span class="style1">Extracurricular Activities
          <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 232px" Font-Size="Large">Back</asp:LinkButton>
        <br />
      
        <br />
        </span>--%>
      <asp:Label ID="title" runat="server" Text="<%$ Resources:Resource, sip_ex_active %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
      
    <div style="text-align:center;margin-top:-32px;padding-bottom:12px;width:1005px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" /> 
    </div>
    </div>

     

    <%--animemenu--%>

            <div id="main-nav-wrapper">
            <nav class="main-nav">
                <ul class="main-nav-list">

                    <li class="apic10color">
                        <img src="animatedmenu3/nocolor.png" class="nocolorimg" />

                    </li>

                    <li class="apic9color">
                        <asp:ImageButton ID="ImageButtonapic9" runat="server" ImageUrl="~/Student/animatedmenu3/bpic9.png" CssClass="aimg"
                         OnClick="ImageButtonapic9_Click" CausesValidation="False"  />
                    </li>


                    <li class="apic1color">
                        <asp:ImageButton ID="ImageButtonapic1" runat="server" ImageUrl="~/Student/animatedmenu3/dpic1.png" CssClass="aimgactive" OnClick="ImageButtonapic1_Click" />

                    </li>
                 <%--
                    <li class="apic2color">

                        <asp:ImageButton ID="ImageButtonapic2" runat="server" ImageUrl="~/Student/animatedmenu3/dpic2.png" CssClass="aimg" OnClick="ImageButtonapic2_Click" />


                    </li>
                 --%>
                </ul>
            </nav>
        </div>


    <%--animemenu close--%>


    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <br /><br /><br /><br /><br /><br /><br /><br />
     <asp:Button ID="AddCommBtn" runat="server" Text="<%$ Resources:Resource, sip_ea_addCommbtn %>" CausesValidation="False" CssClass="blue" />       
                                     <br /><br />
         <asp:GridView ID="GridViewComm" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataKeyNames="id" DataSourceID="SqlDataSource1" 
        EmptyDataText="<%$ Resources:Resource, sip_data_check %>" 
        GridLines="Horizontal" PageSize="6" 
        style="z-index: 1; left: 15px; top: 75px; " 
        Font-Names="Calibri" Font-Size="Small" Width="1024px" 
        CssClass="GridViewStyle">
        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
        <Columns>
         <asp:TemplateField></asp:TemplateField>
            <asp:BoundField DataField="startDate" 
                HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" 
                SortExpression="startDate" DataFormatString="{0:yyyy/MM/dd}">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="endDate" 
                HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" SortExpression="endDate" 
                DataFormatString="{0:yyyy/MM/dd}">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_ea_activeName %>" SortExpression="actName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("actName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                  <asp:LinkButton ID="actNameLink" runat="server" CommandName="Select" 
                        Text='<%# Bind("actName") %>'></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_ea_activeNameCht %>" 
                SortExpression="actNameCht">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("actNameCht") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                  <asp:LinkButton ID="actNameLinkCht" runat="server" CommandName="Select" 
                        Text='<%# Bind("actNameCht") %>'></asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:BoundField DataField="orgName" HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>" 
                SortExpression="orgName" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="orgNameCht" HeaderText="<%$ Resources:Resource, sip_sp_relevantOrgCht %>" 
                SortExpression="orgNameCht">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="position" HeaderText="<%$ Resources:Resource, sip_ea_position %>" 
                SortExpression="position">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="positionCht" HeaderText="<%$ Resources:Resource, sip_ea_positionCht %>" 
                SortExpression="positionCht">
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
 

     <div style="width:1024px;" id="middle">
    <div style="width:550px;float:left;">
   <asp:DetailsView ID="DetailsViewComm" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" DataKeyNames="id" 
        DataSourceID="SqlDataSource2" GridLines="Horizontal" 
        style="z-index: 1; left: 15px; top: 314px;  " 
        Font-Names="Calibri" Font-Size="Small" Width="550px" 
        CssClass="GridViewStyle">
        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
        <Fields>
            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" SortExpression="startDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                          <Ajax:CalendarExtender ID="CalendarExtender3" runat="server" CssClass="orange" 
                                    Format="yyyy/MM/dd" TargetControlID="TextBox1">
                                </Ajax:CalendarExtender>
                  
             
                                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                    Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                  
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                           <Ajax:CalendarExtender ID="CalendarExtender4" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox1">
                        </Ajax:CalendarExtender>
                                <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                    ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                    Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" SortExpression="endDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                        <Ajax:CalendarExtender ID="CalendarExtenderEnd" runat="server" CssClass="orange" 
                                    Format="yyyy/MM/dd" TargetControlID="TextBox2">
                                </Ajax:CalendarExtender>
                  
             
                                <asp:CompareValidator ID="CompareValidatorEnd" runat="server" 
                                    ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                    Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                      <Ajax:CalendarExtender ID="CalendarExtenderInsEnd" runat="server" CssClass="orange" 
                                    Format="yyyy/MM/dd" TargetControlID="TextBox2">
                                </Ajax:CalendarExtender>
                  
             
                                <asp:CompareValidator ID="CompareValidatorInsEnd" runat="server" 
                                    ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                    Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
         
            <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_ea_activeName %>" SortExpression="actName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("actName") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditActiveName" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorName %>">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("actName") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsActiveName" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorName %>">*</asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("actName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_ea_activeNameCht %>" SortExpression="actNameCht">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("actNameCht") %>'></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditActiveNameCht" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorNameCht %>">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("actNameCht") %>'></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsActiveNameCht" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorNameCht %>">*</asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("actNameCht") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>" SortExpression="orgName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("orgName") %>'></asp:TextBox>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditOrg" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorOrg %>">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("orgName") %>'></asp:TextBox>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsOrg" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorOrg %>">*</asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("orgName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantOrgCht %>" SortExpression="orgNameCht">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("orgNameCht") %>'></asp:TextBox>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditOrgCht" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorOrgCht %>">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("orgNameCht") %>'></asp:TextBox>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsOrgCht" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorOrgCht %>">*</asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("orgNameCht") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_ea_position %>" SortExpression="position">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("position") %>'></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditPos" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorPositon %>">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("position") %>'></asp:TextBox>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsPos" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorPositon %>">*</asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("position") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_ea_positionCht %>" SortExpression="positionCht">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("positionCht") %>'></asp:TextBox>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditPosCht" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox9"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorPositonCht %>">*</asp:RegularExpressionValidator>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("positionCht") %>'></asp:TextBox>
                      <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsPosCht" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox9"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorPositonCht %>">*</asp:RegularExpressionValidator>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("positionCht") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Edit" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_edit %>" Visible="<% #show() %>"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="New" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_new %>" Visible="<% #show() %>"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                        CommandName="Delete" ForeColor="#0095CD" OnClientClick="ConfirmMessage();" 
                        Text="<%$ Resources:Resource, sip_sp_del %>" Visible="<% #show() %>"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_update %>"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_cancel %>"></asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Insert" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_ins %>"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_cancel %>"></asp:LinkButton>
                </InsertItemTemplate>
                <ItemStyle BackColor="#D1DDF1" />
            </asp:TemplateField>
        </Fields>
        <RowStyle CssClass="GridViewRowStyle2" />
    </asp:DetailsView>
    <br />
       <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
  <br />
  <br />
    <asp:Button ID="Button1" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_ea_upload %>" 
        Visible="False" />
  
    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <br />
    <br />
         <asp:Button ID="Button10" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" Visible="False" />
            <asp:Button ID="Button9" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
                Visible="False" />
            <asp:Button ID="Button11" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
                Visible="False" />
             <asp:Button ID="Button2" runat="server" Text="<%$ Resources:Resource, sip_back %>" CssClass="blue" CausesValidation="False"
              Visible="False" />
            <br />
           
            
            <span class="style1"><asp:Label ID="Label20" runat="server" 
            Text="<%$ Resources:Resource, sip_er_describEditor %>" Visible="False"></asp:Label></span><cc1:Editor ID="Editor1" 
                runat="server" Height="200px" Width="512px" Visible="False" 
                ActiveMode="Preview" />

       </div>

<div style="width:253px; float:left;">
<div id="imageStyle" runat="server">
<a class="image" href="#">
        <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" Visible="False"></asp:Image><span><asp:Image ID="Image2" runat="server" ></asp:Image></span></a>
</div>

</div>	
<div style="clear:both;">
 
      
 
        </div>
</div>
   
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                SelectCommand="Select path from CommAct where pess_cod=@pess_cod and path is not NULL">
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
   
    <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>"   
        
                SelectCommand="SELECT * FROM [CommAct] WHERE ([pess_cod] = @pess_cod) ORDER BY [startDate] DESC">
        
        <SelectParameters>
         <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </SelectParameters>

    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        DeleteCommand="DELETE FROM [CommAct] WHERE [id] = @id;
                       update Learning_Records_Correspond set [count] = [count] - 1 where (pess_cod = @pess_cod and experience_id='8')"  
        InsertCommand="INSERT INTO [CommAct] ([pess_cod], [actName], [actType], [orgName], [startDate], [endDate], [position], [path], [actNameCht], [actTypeCht], [orgNameCht], [positionCht]) VALUES (@pess_cod, @actName, @actType, @orgName, @startDate, @endDate, @position, @path, @actNameCht, @actTypeCht, @orgNameCht, @positionCht);
                       update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='8')" 
        SelectCommand="SELECT * FROM [CommAct] WHERE ([id] = @id)" 
        UpdateCommand="UPDATE [CommAct] SET [pess_cod] = @pess_cod, [actName] = @actName, [actType] = @actType, [orgName] = @orgName, [startDate] = @startDate, [endDate] = @endDate, [position] = @position, [path] = @path, [actNameCht] = @actNameCht, [actTypeCht] = @actTypeCht, [orgNameCht] = @orgNameCht, [positionCht] = @positionCht WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            <asp:Parameter Name="actName" Type="String" />
            <asp:Parameter Name="actType" Type="String" />
            <asp:Parameter Name="orgName" Type="String" />
            <asp:Parameter Name="startDate" DbType="DateTime" />
            <asp:Parameter Name="endDate" DbType="DateTime" />
            <asp:Parameter Name="position" Type="String" />
          
             <asp:Parameter Name="path" Type="String" />
             <asp:Parameter Name="actNameCht" Type="String" />
             <asp:Parameter Name="actTypeCht" Type="String" />
             <asp:Parameter Name="orgNameCht" Type="String" />
             <asp:Parameter Name="positionCht" Type="String" />
             
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewComm" Name="id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
            <asp:Parameter Name="actName" Type="String" />
            <asp:Parameter Name="actType" Type="String" />
            <asp:Parameter Name="orgName" Type="String" />
            <asp:Parameter Name="startDate" DbType="DateTime" />
             <asp:Parameter Name="endDate" DbType="DateTime" />
            <asp:Parameter Name="position" Type="String" />
           
              <asp:Parameter Name="path" Type="String" />
              <asp:Parameter Name="actNameCht" Type="String" />
              <asp:Parameter Name="actTypeCht" Type="String" />
              <asp:Parameter Name="orgNameCht" Type="String" />
              <asp:Parameter Name="positionCht" Type="String" />
          
              <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
       
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [CommAct]"></asp:SqlDataSource>
    <br />
     <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
       <asp:SqlDataSource ID="SqlDataSource5" runat="server"
       ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="position" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>
</asp:View>

<asp:View ID="View2" runat="server">
  <asp:Panel ID="Panel1" runat="server">
   <Ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
                     
     <div style="width:1024px; height: 829px;" id="Div1">
    <div style="width:337px; float:left; height: 548px;margin-top:93px">
            <table class="style2">
                <tr>
                    <td class="style11">
                       
                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:Resource, sip_sp_Addstartdate %>"></asp:Label>
                       
                    </td>
                    <td class="style10">
                     
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                       
                     
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                    
                           <Ajax:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox2">
                        </Ajax:CalendarExtender>
                     
                    </td>
                </tr>
                 <tr>
                    <td class="style11">
                       
                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Resource, sip_sp_Addenddate %>"></asp:Label>
                       
                    </td>
                    <td class="style10">
                     
                        <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                       
                     
                        <asp:CompareValidator ID="CompareValidator2" runat="server" 
                            ControlToValidate="TextBox11" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                           <Ajax:CalendarExtender ID="CalendarExtender2" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox11">
                        </Ajax:CalendarExtender>
                     
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:Resource, sip_ea_AddactiveName %>"></asp:Label>
                    </td>
                    <td class="style10">
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorName %>">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                  <tr>
                    <td class="style11">
                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource, sip_ea_AddactiveNameCht %>"></asp:Label>
                    </td>
                    <td class="style10">
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorNameCht %>">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style11">
                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, sip_sp_AddrelevantOrg %>"></asp:Label>
                    </td>
                    <td class="style10">
                        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorOrg %>">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                   <tr>
                    <td class="style11">
                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, sip_sp_AddrelevantOrgCht %>"></asp:Label>
                    </td>
                    <td class="style10">
                        <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox10"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorOrgCht %>">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style12">
                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePosition %>"></asp:Label>
                    </td>
                    <td class="style13">
                        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorPositon %>">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                   <tr>
                    <td class="style11">
                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:Resource, sip_sp_referencePositionCht %>"></asp:Label>
                    </td>
                    <td class="style10">
                        <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                            ValidationExpression = "^[\s\S]{0,50}$"  
                            ErrorMessage="<%$ Resources:Resource, sip_er_errorPositonCht %>">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
              
                
                <tr>
                    <td class="style11">
                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, sip_ea_AddworkUpload %>"></asp:Label>
                    </td>
                    <td class="style10">
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                    </td>
                </tr>
               
                <tr>
                    <td class="style9" colspan="2">
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                 <tr>
                    <td class="style11">
                                           
                      <asp:Label ID="AddDescrib" runat="server" Text="<%$ Resources:Resource, sip_er_Adddescrib %>"></asp:Label>
                                          </td>
                                          <td class="style10">
                                              
                                          </td>
                                  </tr>
                                  
            </table>
            <cc1:Editor ID="Editor2" runat="server" Height="200px" 
                                                  Visible="True" Width="512px" />

                                           
              </div>
               
            <div style="width:227px; float:left;">
        
            </div>

<div style="clear:both; height: 36px; width: 681px; margin-top: 27px;">
 
              <table class="style9">
            <tr>
                <td class="style14">
                    <span class="style1">
                      <asp:Button ID="CommIns" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_confirm %>" />
                    </span>
                </td>
                <td>
                    <span class="style1">
                    <asp:Button ID="CommCel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" CausesValidation="False" />
                    </span>
                    
                    
                    
                </td>
                 </tr>
                         <tr>
                         <td class="style16" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" Width="400px" />
                    </td>
                </tr>
        </table>
 
        </div>
</div>
        </asp:Panel>
    </asp:View>

    </asp:MultiView>

 </td>
</tr>
    </table>
 </form>
</body>
</html>
