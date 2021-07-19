<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Learning.aspx.vb" ClientTarget="uplevel" Inherits="Student_Learning" %>

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
        .style9
        {
            width: 100%;
           /* height: 95px;*/
        }
        .ajax__htmleditor_editor_bottomtoolbar {
            display :none;
         }
        
        .style12
        {
            width: 287px;
            text-align:center;
        }
        

        .btn-success {
            width: 120px;
            height: 40px;
            border: solid #1F861F 1.5px;
            font-size: 18px;
        }

            .btn-success:hover {
                width: 120px;
                height: 40px;
                border: solid #1F861F 2px;
                font-size: 18px;
                /*color: #1F861F;*/
            }

        .btn-success:before {
            font-family: FontAwesome;
            content: "\f015";
            position:relative;
            left:-13px;
        }
        



        .style13
        {
            height: 26px;
        }
                



        .style16
        {
            width: 117px;
        }
          
        .hidden
       {
         display:none;
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
            width:13%;
        }
		
        #ImageButton2{
            width:13%;
        }
		

        /*animatemenu*/

		#main-nav-wrapper{
			height:100px;
			overflow:hidden;

		}

        .main-nav {
           position: absolute;
             /* bottom: 0;*/
			width:1158px;			
			height: 100px;
            padding: 0;
            text-align: right;
			margin-left: auto;
            margin-right: auto;
			margin: 0;
            font-size: 0;
            /*z-index:-1;*/
            margin-top:-24px;
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

                .main-nav-list li .aimg {
                    display: inline-block;
                    cursor: pointer;
                    margin: 0;
                    padding: 0;
                }


                /*animatemenu close*/

        .style17
        {
            height: 29px;
            width: 515px;
        }
        .style18
        {
            height: 29px;
            width: 219px;
        }
        .style19
        {
            width: 219px;
        }

        .style20
        {
            width: 278px;
        }
        .style21
        {
            width: 278px;
            height: 26px;
        }

        .style22
        {
            height: 29px;
            width: 226px;
        }
        .style23
        {
            width: 226px;
        }
        .style24
        {
            height: 29px;
            width: 499px;
        }
        .style25
        {
            width: 499px;
        }

        .style29
        {
            height: 29px;
            width: 159px;
        }
        .style31
        {
            height: 29px;
            width: 151px;
        }
        .style33
        {
            height: 29px;
            width: 72px;
        }
        .style34
        {
            height: 29px;
            width: 91px;
        }
        .aimg{
            width:75px;
        }
        .aimgactive{
            width:130px;
        }
 </style>
<script type="text/javascript">
        function CancelReturnKey() {
            if (window.event.keyCode == 13)
                return false;
        }
    </script>
        
        <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="../button1.css" type="text/css" media="screen" />
         <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
         <link rel="stylesheet" href="../Student/styles/orange.css" type="text/css" media="screen" />  

		  
</head>
<body background="../images/church.gif" onkeypress="return CancelReturnKey();">

       

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

      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-36251023-1']);
      _gaq.push(['_setDomainName', 'jqueryscript.net']);
      _gaq.push(['_trackPageview']);

      (function () {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();

    </script>



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

    <%--animemenu js close--%>


        <script>
function isPostBack() { //function to check if page is a postback-ed one
  return document.getElementById('_ispostback').value == 'True';
}
    </script>
    <form id="form1" runat="server">

                 
    <table cellpadding="0" cellspacing="0" border="0" width="1160" align="center">

    <tr>
<td>
    
    
<div>
 <asp:Label ID="Label54" runat="server" Text="<%$ Resources:Resource, sip_learn_record %>" style="color:black;font-size:xx-large;font-family: 'Berlin Sans FB';"></asp:Label>
    <%--           <div style="text-align:center;margin-top:-25px;padding-bottom:12px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" /> </div>   --%><%--<button id="Button17" runat="server" class="btn btn-success hvr-icon-pulse-grow">Home</button>
             <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin:auto;width:1200px" Font-Size="Large">Back</asp:LinkButton>--%><%--animemenu--%>

  <div id="main-nav-wrapper">
            <nav class="main-nav">
                <ul class="main-nav-list">

                    <li class="apic9color">
                        <img src="animatedmenu3/nocolor.png" alt="" title="" class="nocolorimg" />
                        <%--<asp:ImageButton ID="ImageButtonapic9" runat="server" ImageUrl="~/Student/animatedmenu3/nocolor.png" CssClass="nocolorimg"/>--%>
                    </li>

                    <li class="apic8color">
                        <asp:ImageButton ID="ImageButtonapic8" runat="server" ImageUrl="~/Student/animatedmenu3/apic8.png" CssClass="aimg" CausesValidation="False" />
                    </li>


                    <li class="apic1color">
                        <%--<img src="animatedmenu3/apic1.png" alt="Evolution and inheritance" title="Evolution and inheritance" />--%>
                        <asp:ImageButton ID="ImageButtonapic1" runat="server" ImageUrl="~/Student/animatedmenu3/apic1.png" CssClass="aimgactive" />
                    </li>

                    <li class="apic2color">
                        <asp:ImageButton ID="ImageButtonapic2" runat="server" ImageUrl="~/Student/animatedmenu3/apic2.png" CssClass="aimg" />
                    </li>

                    <li class="apic3color">
                        <asp:ImageButton ID="ImageButtonapic3" runat="server" ImageUrl="~/Student/animatedmenu3/apic3.png" CssClass="aimg" />
                    </li>
                    <li class="apic4color">
                        <asp:ImageButton ID="ImageButtonapic4" runat="server" ImageUrl="~/Student/animatedmenu3/apic4.png" CssClass="aimg" />
                    </li>
                    <li class="apic5color">
                        <asp:ImageButton ID="ImageButtonapic5" runat="server" ImageUrl="~/Student/animatedmenu3/apic5.png" CssClass="aimg" />
                    </li>
                    <li class="apic6color">
                        <asp:ImageButton ID="ImageButtonapic6" runat="server" ImageUrl="~/Student/animatedmenu3/apic6.png" CssClass="aimg" />
                    </li>
                    <li class="apic7color">
                        <asp:ImageButton ID="ImageButtonapic7" runat="server"  ImageUrl="~/Student/animatedmenu3/apic7.png" CssClass="aimg" />
                    </li>
                </ul>
            </nav>
		
    </div>

    <%--animemenu close--%>
    
   
        <table class="style9" style="display:none;">
            <tr>
                <td class="style12">
     <asp:Button ID="Button1" runat="server" Text="Seminar/Conference" 
        CssClass="blue" Width="250px" />
                </td>
                <td class="style12">
                <asp:Button ID="Button2" runat="server" Text="Professional Certificate" 
        CssClass="blue" Width="250px" />
                </td>
                <td class="style12">
                  <asp:Button ID="Button5" runat="server" Text="Award/Scholarship" 
                      CssClass="blue" Width="250px" />
                </td>
                <td class="style12">
    <asp:Button ID="Button3" runat="server" 
        Text="Competition" CssClass="blue" Width="250px" />
                </td>
            </tr>
            <tr>
                <td class="style12">
                <br />
                <asp:Button ID="Button7" runat="server" Text="Internship" CssClass="blue" 
                        Width="250px" />
                </td>
                <td class="style12">
                <br />
                  <asp:Button ID="Button6" runat="server" Text="Student Exchange Program" 
        CssClass="blue" Width="250px" />
                </td>
                <td class="style12">
                <br />
              <asp:Button ID="Button4" runat="server" Text="Study Reference" CssClass="blue" 
                        Width="250px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
 
       
   <br />
   

    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0"   >
        <asp:View ID="ViewMonograph" runat="server">
            <asp:Label ID="seminarTitle0" runat="server" 
                style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';" 
                Text="<%$ Resources:Resource, sip_lr_seminar %>"></asp:Label>
                     <br /><br />
            <asp:MultiView ID="MultiView8" runat="server" ActiveViewIndex="0">
                <asp:View ID="View13" runat="server">
                   <asp:Button ID="AddSemBtn" runat="server" Text="<%$ Resources:Resource, sip_lr_AddSem %>" CausesValidation="False"
                                     CssClass="blue" />       
                                     <br /><br />
                    <asp:GridView ID="GridViewSeminar" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CssClass="GridViewStyle" 
                        DataKeyNames="id,status" DataSourceID="SqlDataSource1" 
                        EmptyDataText="<%$ Resources:Resource, sip_data_check %>" Font-Names="Calibri" 
                        Font-Size="Small" GridLines="Horizontal" PageSize="6" Width="100%">
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <Columns>
                            <asp:TemplateField></asp:TemplateField>
                            <asp:BoundField DataField="startDate" DataFormatString="{0:yyyy/MM/dd}" 
                                HeaderText="<%$ Resources:Resource, sip_sp_relevantDate %>" 
                                SortExpression="startDate">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField SortExpression="topicName" HeaderText="<%$ Resources:Resource, sip_lr_topic %>">
                                <ItemTemplate>
                                 <asp:LinkButton ID="SemTopicLink" runat="server" CommandName="Select" 
                                  Text='<%# Bind("topicName") %>'></asp:LinkButton>
                                   </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("topicName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="topicNameCht" HeaderText="<%$ Resources:Resource, sip_lr_semTopicCht %>">
                                <ItemTemplate>
                                    <asp:LinkButton ID="SemTopicChtLink" runat="server" CommandName="Select" 
                                    Text='<%# Bind("topicNameCht") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("topicNameCht") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="organizer" 
                                HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>" 
                                SortExpression="organizer">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="organizerCht" HeaderText="<%$ Resources:Resource, sip_lr_semOrgCht %>" SortExpression="organizerCht">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bonus_point" 
                                HeaderText="<%$ Resources:Resource, sip_lr_bonus %>" 
                                SortExpression="bonus_point">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="status" HeaderText="Status" Visible="False">
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Select" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_relevantDescrib %>"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle CssClass="GridViewHeaderStyle" Font-Size="Large" ForeColor="White" 
                            Height="40px" />
                        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                        <RowStyle CssClass="GridViewRowStyle" Height="40px" HorizontalAlign="Left" />
                        <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                        <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                        <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
                    </asp:GridView>
                       <br /> 
                    <asp:SqlDataSource ID="SqlDataSource19" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                        SelectCommand="SELECT [id] FROM [Learning_Records_Experience]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" SelectCommand="SELECT Seminar_Info.id, Seminar_Info.topicName, Seminar_Info.category, Seminar_Info.startDate, Seminar_Info.duration,Seminar_Info.organizer,Seminar_Info.bonus_point,Seminar_Info.status, Seminar_Info.topicNameCht, Seminar_Info.categoryCht, Seminar_Info.organizerCht
                FROM Seminar INNER JOIN Seminar_Info ON Seminar.Seminar_info_id = Seminar_Info.id
                WHERE (Seminar.pess_cod = @pess_cod)
                 UNION SELECT id, topicName, category, startDate, duration, organizer, bonus_point, status, topicNameCht, categoryCht, organizerCht
                  FROM Seminar_Info
                  WHERE (Seminar_Info.pess_cod = @pess_cod)
                   ORDER BY Seminar_Info.startDate DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                        </SelectParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="pess_cod1" SessionField="pess_cod" Type="Decimal" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
          
            <asp:Label ID="Label5" runat="server" ForeColor="Blue" 
                style="font-size:larger;margin-left:855px;" 
                Text="<%$ Resources:Resource, sip_lr_total_bonus %>"></asp:Label>
            <asp:Label ID="Label3" runat="server" ForeColor="Red"></asp:Label>

               
            
            <asp:ValidationSummary ID="ValidationSummary3" runat="server" />
            <asp:DetailsView ID="DetailsViewSeminar" runat="server" 
                AutoGenerateRows="False" CssClass="GridViewStyle" 
                DataSourceID="SqlDataSource21" GridLines="Horizontal" Height="50px" 
                Visible="False" Width="578px">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                <Fields>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantDate %>">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidatorEditSem" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="Invalid date format." 
                                Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                            <Ajax:CalendarExtender ID="CalendarExtenderEditSem" runat="server" 
                                CssClass="orange" Format="yyyy/MM/dd" TargetControlID="TextBox1">
                            </Ajax:CalendarExtender>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidatorInsSem" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="Invalid date format." 
                                Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                            <Ajax:CalendarExtender ID="CalendarExtenderInsSem" runat="server" 
                                CssClass="orange" Format="yyyy/MM/dd" TargetControlID="TextBox1">
                            </Ajax:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_semTopic %>">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("topicName") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditSem" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,200}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicName %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("topicName") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsSem" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,200}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicName %>">*</asp:RegularExpressionValidator>


                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("topicName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_semTopicCht %>">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("topicNameCht") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditSemCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,200}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicNameCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("topicNameCht") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsSemCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,200}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicNameCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("topicNameCht") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_type %>">
                      <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditType" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicType %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsType" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicType %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_semTypeCht %>">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("categoryCht") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditTypeCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicTypeCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("categoryCht") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsTypeCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicTypeCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("categoryCht") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_duration %>">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("duration") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("duration") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("duration") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("organizer") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditTopicOrg" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicOrg %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("organizer") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsTopicOrg" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicOrg %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("organizer") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_semOrgCht %>">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("organizerCht") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditTopicOrgCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicOrgCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("organizerCht") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsTopicOrgCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicOrgCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("organizerCht") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="bonus_point" 
                        HeaderText="<%$ Resources:Resource, sip_lr_bonus %>" ReadOnly="True" 
                        InsertVisible="False" />
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Update" ForeColor="#0095CD" 
                                Text="<%$ Resources:Resource, sip_sp_update %>"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" ForeColor="#0095CD" 
                                Text="<%$ Resources:Resource, sip_sp_cancel %>"></asp:LinkButton>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Insert" ForeColor="#0095CD" 
                                Text="<%$ Resources:Resource, sip_ins %>"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" ForeColor="#0095CD" 
                                Text="<%$ Resources:Resource, sip_sp_cancel %>"></asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" ForeColor="#0095CD" 
                                Text="<%$ Resources:Resource, sip_sp_edit %>" Visible="<% #show() %>"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="New" ForeColor="#0095CD" 
                                Text="<%$ Resources:Resource, sip_sp_new %>" Visible="<% #show() %>"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                CommandName="Delete" ForeColor="#0095CD" OnClientClick="ConfirmMessage();" 
                                Text="<%$ Resources:Resource, sip_sp_del %>" Visible="<% #show() %>"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <RowStyle CssClass="GridViewRowStyle2" Height="40px" />
            </asp:DetailsView>
            <br />
            <asp:Button ID="semBack" runat="server" CausesValidation="False" 
                CssClass="blue" Text="<%$ Resources:Resource, sip_back %>" Visible="False" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource21" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                DeleteCommand="DELETE FROM [Seminar_Info] WHERE [id] = @id;
                               update Learning_Records_Correspond set [count] = [count] - 1 where (pess_cod = @pess_cod and experience_id='1')" 
                InsertCommand="INSERT INTO [Seminar_Info] ([topicName], [category], [startDate], [duration], [organizer], [status], [pess_cod], [topicNameCht], [categoryCht], [organizerCht]) VALUES (@topicName, @category, @startDate, @duration, @organizer, @status, @pess_cod, @topicNameCht, @categoryCht, @organizerCht);
                               update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='1')" 
                SelectCommand="SELECT  Seminar_Info.topicName, Seminar_Info.category, Seminar_Info.startDate, Seminar_Info.duration,Seminar_Info.organizer,Seminar_Info.bonus_point,Seminar_Info.status, Seminar_Info.topicNameCht, Seminar_Info.categoryCht, Seminar_Info.organizerCht
                FROM Seminar INNER JOIN Seminar_Info ON Seminar.Seminar_info_id = Seminar_Info.id
                WHERE (Seminar.pess_cod = @pess_cod and  Seminar_Info.id=@id)
               
                 UNION SELECT topicName, category, startDate, duration, organizer, bonus_point, status, topicNameCht, categoryCht, organizerCht
                  FROM Seminar_Info
                  WHERE (Seminar_Info.pess_cod = @pess_cod and Seminar_Info.id=@id)
                   ORDER BY Seminar_Info.startDate DESC" 
                UpdateCommand="UPDATE [Seminar_Info] SET [topicName] = @topicName, [category] = @category, [startDate] = @startDate, [duration] = @duration, [organizer] = @organizer, [topicNameCht]=@topicNameCht, [categoryCht]=@categoryCht, [organizerCht]=@organizerCht  WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridViewSeminar" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                          <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="topicName" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="startDate" Type="DateTime" />
                    <asp:Parameter Name="duration" Type="Int32" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter Name="bonus_point" Type="Int32" />
                    <asp:Parameter DefaultValue="External" Name="status" Type="String" />
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                     <asp:Parameter Name="topicNameCht" Type="String" />
                    <asp:Parameter Name="categoryCht" Type="String" />
                    <asp:Parameter Name="organizerCht" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:ControlParameter ControlID="GridViewSeminar" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="topicName" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="startDate" Type="DateTime" />
                    <asp:Parameter Name="duration" Type="Int32" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:ControlParameter ControlID="GridViewSeminar" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter Name="topicNameCht" Type="String" />
                    <asp:Parameter Name="categoryCht" Type="String" />
                    <asp:Parameter Name="organizerCht" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />


                </asp:View>

                <asp:View ID="View14" runat="server">


                           <table class="style17">
                                  <tr>
                                      <td class="style18">
                                          <asp:Label ID="semDate" runat="server" Text="<%$ Resources:Resource, sip_lr_addSeminarDate %>"></asp:Label>
                                      </td>
                                      <td class="style17">
                                          <asp:TextBox ID="semDateTxt" runat="server"></asp:TextBox>
                                           <asp:CompareValidator ID="CompareValidatorAddSemDate" runat="server" 
                                              ControlToValidate="semDateTxt" ErrorMessage="<%$ Resources:Resource, sip_lr_error_TopicDate %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                                <Ajax:CalendarExtender ID="CalendarExtenderAddSemDate" runat="server" CssClass="orange" 
                                                Format="yyyy/MM/dd" TargetControlID="semDateTxt">
                                                </Ajax:CalendarExtender>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td class="style19">
                                          <asp:Label ID="semTopic" runat="server" Text="<%$ Resources:Resource, sip_lr_addSeminarTopic %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="semTopicTxt" runat="server"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "semTopicTxt"   
                                           ValidationExpression = "^[\s\S]{0,200}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicName %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                     <tr>
                                      <td class="style19">
                                          <asp:Label ID="semTopicCht" runat="server" Text="<%$ Resources:Resource, sip_lr_addSeminarTopicCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="semTopicChtTxt" runat="server"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "semTopicChtTxt"   
                                           ValidationExpression = "^[\s\S]{0,200}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicNameCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                      <tr>
                                      <td class="style19">
                                          <asp:Label ID="semType" runat="server" Text="<%$ Resources:Resource, sip_lr_addSeminarType %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="semTypeTxt" runat="server"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator11" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "semTypeTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicType %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                      <tr>
                                      <td class="style19">
                                          <asp:Label ID="semTypeCht" runat="server" Text="<%$ Resources:Resource, sip_lr_addSeminarTypeCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="semTypeChtTxt" runat="server"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator12" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "semTypeChtTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicTypeCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td class="style19">
                                          <asp:Label ID="semDuration" runat="server" Text="<%$ Resources:Resource, sip_lr_addSeminarDuration %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="semDurationTxt" runat="server"></asp:TextBox>
                                             
                                      </td>
                                  </tr>
                                      <tr>
                                      <td class="style19">
                                          <asp:Label ID="semOrg" runat="server" Text="<%$ Resources:Resource, sip_lr_addSeminarOrg %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="semOrgTxt" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "semOrgTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicOrg %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style19">
                                          <asp:Label ID="semOrgCht" runat="server" Text="<%$ Resources:Resource, sip_lr_addSeminarOrgCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="semOrgChtTxt" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator14" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "semOrgChtTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorTopicOrgCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style19">
                                          &nbsp;</td>
                                      <td class="style23">
                                      
                                          <asp:Button ID="SemIns" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_confirm %>" />
                                          <asp:Button ID="SemCancel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" CausesValidation="False" />
                                        
                                      </td>
                                  </tr>
                                    <tr>
                         <td class="style19" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary4" runat="server" Width="400px" />
                    </td>
                </tr>
                              </table>


                </asp:View>
            </asp:MultiView>
      
        </asp:View>
      
        <asp:View ID="ViewProfessional" runat="server">
           <asp:Label ID="certTitle" runat="server" Text="<%$ Resources:Resource, sip_lr_certTitle %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
           <br /><br />
            <asp:MultiView ID="MultiView2" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">

                      
                         <asp:Button ID="addCert" runat="server" Text="<%$ Resources:Resource, sip_lr_AddCert %>" CausesValidation="False"
                                     CssClass="blue" />       
                                     <br /><br />
            <asp:GridView ID="GridViewProfessional" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource2" 
                EmptyDataText="<%$ Resources:Resource, sip_data_check %>" 
                GridLines="Horizontal" Font-Names="Calibri" Font-Size="Small" Width="100%" 
                PageSize="5" CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                         <asp:TemplateField></asp:TemplateField>
                    <asp:BoundField DataField="certDate" HeaderText="<%$ Resources:Resource, sip_lr_certDate %>" 
                        SortExpression="certDate" DataFormatString="{0:yyyy/MM/dd}" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                         <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_certName %>" SortExpression="certName">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("certName") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                   <asp:LinkButton ID="CertLink" runat="server" CommandName="Select" 
                                Text='<%# Bind("certName") %>'></asp:LinkButton>
                             </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" />
                         </asp:TemplateField>
                         <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_certNameCht %>" SortExpression="certNameCht">
                             <EditItemTemplate>
                                 <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("certNameCht") %>'></asp:TextBox>
                             </EditItemTemplate>
                             <ItemTemplate>
                                     <asp:LinkButton ID="CertLinkCht" runat="server" CommandName="Select" 
                                Text='<%# Bind("certNameCht") %>'></asp:LinkButton>
                             </ItemTemplate>
                             <HeaderStyle HorizontalAlign="Left" />
                         </asp:TemplateField>
                    <asp:BoundField DataField="organizer" HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>" 
                        SortExpression="organizer" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="organizerCht" HeaderText="<%$ Resources:Resource, sip_sp_relevantOrgCht %>" 
                        SortExpression="organizerCht">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                         <asp:TemplateField ShowHeader="False">
                             <ItemTemplate>
                                 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                     CommandName="Select" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_relevantDescrib %>"></asp:LinkButton>
                             </ItemTemplate>
                         </asp:TemplateField>
                </Columns>
              
                <HeaderStyle ForeColor="White" 
                    Font-Size="Large" Height="40px" CssClass="GridViewHeaderStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" CssClass="GridViewRowStyle" 
                    Height="40px" />
                <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
            </asp:GridView>

                    <asp:ValidationSummary ID="ValidationSummary13" runat="server" />
    <div style="width:1024px;" id="middle">
    <div style="width:578px;float:left;">
    <asp:DetailsView ID="DetailsViewProfessional" runat="server" AllowPaging="True" 
                            AutoGenerateRows="False" DataKeyNames="id" 
                            DataSourceID="SqlDataSource9" Font-Names="Calibri" 
        Font-Size="Small" GridLines="Horizontal" Height="50px" Width="578px" 
                            Visible="False" CssClass="GridViewStyle">
                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                            <Fields>
                                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_certDate %>" SortExpression="certDate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("certDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                         <asp:CompareValidator ID="CompareValidatorEditCert" runat="server" 
                                                        ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertDate %>" 
                                                        Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                                   <Ajax:CalendarExtender ID="CalendarExtenderEditCert" runat="server" CssClass="orange" 
                                                          Format="yyyy/MM/dd" TargetControlID="TextBox1"> </Ajax:CalendarExtender>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("certDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidatorInsCert" runat="server" 
                                                        ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertDate %>" 
                                                        Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                                         <Ajax:CalendarExtender ID="CalendarExtenderInsCert" runat="server" CssClass="orange" 
                                                          Format="yyyy/MM/dd" TargetControlID="TextBox1"> </Ajax:CalendarExtender>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("certDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_certName %>" SortExpression="certName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("certName") %>'></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCert" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox2"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertName %>">*</asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("certName") %>'></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCert" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox2"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertName %>">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("certName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_certNameCht %>" SortExpression="certNameCht">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("certNameCht") %>'></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCertCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertNameCht %>">*</asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("certNameCht") %>'></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCertCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertNameCht %>">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("certNameCht") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_courseName %>" SortExpression="courseName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("courseName") %>'></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCourseName" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseName %>">*</asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("courseName") %>'></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCourseName" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseName %>">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("courseName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_courseNameCht %>" SortExpression="courseNameCht">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("courseNameCht") %>'></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCourseNameCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseNameCht %>">*</asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("courseNameCht") %>'></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCourseNameCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseNameCht %>">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("courseNameCht") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_courseType %>" SortExpression="courseType">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("courseType") %>'></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCourseType" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseType %>">*</asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("courseType") %>'></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCourseType" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseType %>">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("courseType") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_courseTypeCht %>" SortExpression="courseTypeCht">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("courseTypeCht") %>'></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCourseTypeCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseTypeCht %>">*</asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("courseTypeCht") %>'></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCourseTypeCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseTypeCht %>">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("courseTypeCht") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>" SortExpression="organizer">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("organizer") %>'></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCertOrg" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertOrg %>">*</asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("organizer") %>'></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCertOrg" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertOrg %>">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("organizer") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantOrgCht %>" SortExpression="organizerCht">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("organizerCht") %>'></asp:TextBox>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditCertOrgCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox9"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertOrgCht %>">*</asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("organizerCht") %>'></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsCertOrgCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox9"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertOrgCht %>">*</asp:RegularExpressionValidator>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("organizerCht") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField ShowHeader="False">
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
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                            CommandName="Edit" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_edit %>"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                            CommandName="New" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_new %>"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                            CommandName="Delete" OnClientClick="ConfirmMessage();" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_del %>"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <RowStyle Height="40px" CssClass="GridViewRowStyle2" />
                        </asp:DetailsView>
                            <asp:FileUpload ID="FileUpload1" runat="server" Visible="False" />
                          <br />
                          <br />
                          <asp:Button ID="Button8" runat="server" CssClass="blue" 
                            Text="<%$ Resources:Resource, sip_lr_certUpload %>" Visible="False" />
                              <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        <br />
                        <br />
                        <asp:Button ID="Button12" runat="server" Text="<%$ Resources:Resource, sip_back %>" CssClass="blue" 
                            Visible="False" CausesValidation="False" />
                      </div>

                      <div style="width:260px; float:left;">
                   <div id="imageStyle" runat="server"><a class="image" href="#">
                  <asp:Image ID="Image1" runat="server" Height="250px" Width="400px" Visible="False"></asp:Image><span><asp:Image ID="Image2" runat="server" ></asp:Image></span></a>
                 </div>

                 </div>	

                 <div style="clear:both;"></div>
                </div>
           
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
       
 
                 
                             SelectCommand="SELECT * FROM [ProfessionalCert] WHERE ([pess_cod] = @pess_cod) ORDER BY [certDate] DESC">
                <SelectParameters>
                  <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
                
            </asp:SqlDataSource>
          
                         <asp:SqlDataSource ID="SqlDataSource22" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" SelectCommand="SELECT [path] FROM [ProfessionalCert] WHERE ([pess_cod] = @pess_cod and path is not NULL)
">
                             <SelectParameters>
                                 <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                             </SelectParameters>
                         </asp:SqlDataSource>
          
            <br />
          
            
            <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                DeleteCommand="DELETE FROM [ProfessionalCert] WHERE [id] = @id;
                               update Learning_Records_Correspond set [count] = [count] - 1 where (pess_cod = @pess_cod and experience_id='2')" 
                InsertCommand="INSERT INTO [ProfessionalCert] ([pess_cod], [certName], [courseName], [courseType], [duration], [organizer], [certDate], [category], [path], [certNameCht], [courseNameCht], [courseTypeCht], [organizerCht]) VALUES (@pess_cod, @certName, @courseName, @courseType, @duration, @organizer, @certDate, @category, @path, @certNameCht, @courseNameCht, @courseTypeCht, @organizerCht);
                               update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='2')" 
                SelectCommand="SELECT * FROM [ProfessionalCert] WHERE ([id] = @id)" 
                UpdateCommand="UPDATE [ProfessionalCert] SET [pess_cod] = @pess_cod, [certName] = @certName, [courseName] = @courseName, [courseType] = @courseType, [duration] = @duration, [organizer] = @organizer, [certDate] = @certDate, [category] = @category, [path] = @path, [certNameCht] = @certNameCht, [courseNameCht] = @courseNameCht, [courseTypeCht] = @courseTypeCht, [organizerCht] = @organizerCht WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                     <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
               </DeleteParameters>
                <InsertParameters>
                  
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="certName" Type="String" />
                    <asp:Parameter Name="courseName" Type="String" />
                    <asp:Parameter Name="courseType" Type="String" />
                    <asp:Parameter Name="duration" Type="Double" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter DbType="DateTime" Name="certDate" />
                  
                     <asp:Parameter Name="category" Type="String" />
                     <asp:Parameter Name="path" Type="String" />
                     <asp:Parameter Name="certNameCht" Type="String" />
                     <asp:Parameter Name="courseNameCht" Type="String" />
                     <asp:Parameter Name="courseTypeCht" Type="String" />
                     <asp:Parameter Name="organizerCht" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewProfessional" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="certName" Type="String" />
                    <asp:Parameter Name="courseName" Type="String" />
                    <asp:Parameter Name="courseType" Type="String" />
                    <asp:Parameter Name="duration" Type="Double" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter DbType="DateTime" Name="certDate" />
                 
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="path" Type="String" />
                    <asp:Parameter Name="certNameCht" Type="String" />
                    <asp:Parameter Name="courseNameCht" Type="String" />
                    <asp:Parameter Name="courseTypeCht" Type="String" />
                    <asp:Parameter Name="organizerCht" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource20" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [ProfessionalCert]"></asp:SqlDataSource>
            <br />
            <br />
            <br />

                </asp:View>
                <asp:View ID="View2" runat="server">
                
                                <div style="width:1024px; height: 321px;" id="Div1">
                           <div style="width:513px; float:left; height: 272px;">
                              <table class="style17">
                                  <tr>
                                      <td class="style24">
                                          <asp:Label ID="Label4" runat="server" Text="<%$ Resources:Resource, sip_lr_addCertDate %>"></asp:Label>
                                      </td>
                                      <td class="style17">
                                          <asp:TextBox ID="certDateTxt" runat="server"></asp:TextBox>
                                           <asp:CompareValidator ID="CompareValidatorAddCert" runat="server" 
                                              ControlToValidate="certDateTxt" ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertDate %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                                <Ajax:CalendarExtender ID="CalendarExtenderAddCert" runat="server" CssClass="orange" 
                                                Format="yyyy/MM/dd" TargetControlID="certDateTxt">
                                                </Ajax:CalendarExtender>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td class="style25">
                                          <asp:Label ID="Label6" runat="server" Text="<%$ Resources:Resource, sip_lr_addCertName %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="certNameTxt" runat="server"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator15" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "certNameTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertName %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                      <tr>
                                      <td class="style25">
                                          <asp:Label ID="Label37" runat="server" Text="<%$ Resources:Resource, sip_lr_addCertNameCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="certNameChtTxt" runat="server"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator16" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "certNameChtTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertNameCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style25">
                                          <asp:Label ID="Label7" runat="server" Text="<%$ Resources:Resource, sip_lr_addCourseName %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="courseNameTxt" runat="server"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "courseNameTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseName %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                      <tr>
                                      <td class="style25">
                                          <asp:Label ID="Label38" runat="server" Text="<%$ Resources:Resource, sip_lr_addCourseNameCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="courseNameChtTxt" runat="server"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator18" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "courseNameChtTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseNameCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style25">
                                          <asp:Label ID="Label8" runat="server" Text="<%$ Resources:Resource, sip_lr_addCourseType %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="certTypeTxt" runat="server"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator19" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "certTypeTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseType %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style25">
                                          <asp:Label ID="Label39" runat="server" Text="<%$ Resources:Resource, sip_lr_addCourseTypeCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="certTypeChtTxt" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "certTypeChtTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CourseTypeCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style25">
                                          <asp:Label ID="Label9" runat="server" Text="<%$ Resources:Resource, sip_sp_AddrelevantOrg %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="CertOrgTxt" runat="server"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator21" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "CertOrgTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertOrg %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style25">
                                          <asp:Label ID="Label40" runat="server" Text="<%$ Resources:Resource, sip_sp_AddrelevantOrgCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="CertOrgChtTxt" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator22" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "CertOrgChtTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_CertOrgCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style25">
                                          <asp:Label ID="Label11" runat="server" Text="<%$ Resources:Resource, sip_lr_addCertUpload %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:FileUpload ID="FileUpload2" runat="server" />
                                      </td>
                                  </tr>
                             
                                  <tr>
                                      <td class="style22" colspan="2">
                                          <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style25">
                                          &nbsp;</td>
                                      <td class="style23">
                                      
                                          <asp:Button ID="CertIns" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_confirm %>" />
                                          <asp:Button ID="CertCel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" CausesValidation="False" />
                                       
                                      </td>
                                  </tr>
                                       <tr>
                         <td class="style25" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary8" runat="server" Width="380px" />
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
        <asp:View ID="ViewMatch" runat="server">
         <asp:Label ID="matchTitle" runat="server" Text="<%$ Resources:Resource, sip_lr_match %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
		 
         <br /><br />
            <asp:MultiView ID="MultiView4" runat="server" ActiveViewIndex="0">
                <asp:View ID="View5" runat="server">

               
            <asp:Button ID="addMatch" runat="server" Text="<%$ Resources:Resource, sip_lr_AddCompetitionTitle %>" CausesValidation="False"
                                     CssClass="blue" />       
                                     <br /><br />
            <asp:GridView ID="GridViewMatch" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource3" GridLines="Horizontal" AllowPaging="True" 
                AllowSorting="True" Font-Names="Calibri" Font-Size="Small" Width="100%" 
                CssClass="GridViewStyle" EmptyDataText="<%$ Resources:Resource, sip_data_check %>">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                 <asp:TemplateField></asp:TemplateField>
                    <asp:BoundField DataField="dateMatch" 
                        HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" SortExpression="dateMatch" 
                        DataFormatString="{0:yyyy/MM/dd}">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                
                     <asp:BoundField DataField="dateEnd" DataFormatString="{0:yyyy/MM/dd}" 
                        HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" SortExpression="dateEnd">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_competition %>" 
                        SortExpression="matchName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("matchName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                              <asp:LinkButton ID="matchLink" runat="server" CommandName="Select" 
                                Text='<%# Bind("matchName") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_competitionCht %>" 
                        SortExpression="matchNameCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("matchNameCht") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="matchLinkCht" runat="server" CommandName="Select" 
                                Text='<%# Bind("matchNameCht") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="category" HeaderText="<%$ Resources:Resource, sip_lr_competitionType %>" 
                        SortExpression="category">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="categoryCht" HeaderText="<%$ Resources:Resource, sip_lr_competitionTypeCht %>"
                      SortExpression="categoryCht">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Select" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_relevantDescrib %>"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle ForeColor="White" 
                    Font-Size="Large" Height="40px" CssClass="GridViewHeaderStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" CssClass="GridViewRowStyle" 
                    Height="40px" />
                <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                        SelectCommand="SELECT * FROM [MatchRecord] WHERE ([pess_cod] = @pess_cod) ORDER BY [dateMatch] DESC">
                
                <SelectParameters>
             <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>

        </asp:SqlDataSource>
            <br />
                    <asp:ValidationSummary ID="ValidationSummary14" runat="server" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource10" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [MatchRecord] WHERE ([id] = @id)" 
                DeleteCommand="DELETE FROM [MatchRecord] WHERE [id] = @id;
                               update Learning_Records_Correspond set [count] = [count] - 1 where (pess_cod = @pess_cod and experience_id='3')" 
                InsertCommand="INSERT INTO [MatchRecord] ([pess_cod], [matchName], [dateMatch], [dateEnd], [category], [position], [description], [matchNameCht], [categoryCht]) VALUES (@pess_cod, @matchName, @dateMatch, @dateEnd, @category, @position, @description, @matchNameCht, @categoryCht);
                               update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='3')" 
                UpdateCommand="UPDATE [MatchRecord] SET [pess_cod] = @pess_cod, [matchName] = @matchName, [dateMatch] = @dateMatch, [dateEnd] = @dateEnd, [category] = @category, [position] = @position, [description] = @description, [matchNameCht] = @matchNameCht, [categoryCht] = @categoryCht WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="matchName" Type="String" />
                    <asp:Parameter Name="dateMatch" DbType="DateTime" />
                    <asp:Parameter Name="dateEnd" DbType="DateTime" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="position" Type="Decimal" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="matchNameCht" Type="String" />
                    <asp:Parameter Name="categoryCht" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewMatch" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                  
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="matchName" Type="String" />
                    <asp:Parameter Name="dateMatch" DbType="DateTime" />
                    <asp:Parameter Name="dateEnd" DbType="DateTime" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="position" Type="Decimal" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="matchNameCht" Type="String" />
                    <asp:Parameter Name="categoryCht" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
        </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsViewMatch" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" DataKeyNames="id" 
                DataSourceID="SqlDataSource10" GridLines="Horizontal" Height="50px" 
                Width="512px" Font-Names="Calibri" Font-Size="Small" 
                CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                <Fields>
                
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" SortExpression="dateMatch">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("dateMatch", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                 <asp:CompareValidator ID="CompareValidatorEditMatch" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                <Ajax:CalendarExtender ID="CalendarExtenderEditMatch" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox1">
                               </Ajax:CalendarExtender>
                        
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("dateMatch", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                  <asp:CompareValidator ID="CompareValidatorInsMatch" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                <Ajax:CalendarExtender ID="CalendarExtenderInsMatch" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox1">
                               </Ajax:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Bind("dateMatch", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" SortExpression="dateEnd">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" 
                                Text='<%# Bind("dateEnd", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                  <asp:CompareValidator ID="CompareValidatorEditEndMatch" runat="server" 
                                ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                <Ajax:CalendarExtender ID="CalendarExtenderEditEndMatch" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox2">
                               </Ajax:CalendarExtender>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" 
                                Text='<%# Bind("dateEnd", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                   <asp:CompareValidator ID="CompareValidatorInsEndMatch" runat="server" 
                                ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                <Ajax:CalendarExtender ID="CalendarExtenderInsEndMatch" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox2">
                               </Ajax:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" 
                                Text='<%# Bind("dateEnd", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_competition %>" SortExpression="matchName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("matchName") %>'></asp:TextBox>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditMatchName" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchName %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("matchName") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsMatchName" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchName %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("matchName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField   HeaderText="<%$ Resources:Resource, sip_lr_competitionCht %>" SortExpression="matchNameCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("matchNameCht") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditMatchNameCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchNameCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("matchNameCht") %>'></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsMatchNameCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchNameCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("matchNameCht") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_competitionType %>" SortExpression="category">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditMatchType" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchType %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsMatchType" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchType %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_competitionTypeCht %>" SortExpression="categoryCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("categoryCht") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditMatchTypeCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchTypeCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("categoryCht") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsMatchTypeCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchTypeCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("categoryCht") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField ShowHeader="False">
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
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_edit %>"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="New" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_new %>"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                                CommandName="Delete" OnClientClick="ConfirmMessage();" ForeColor="#0095CD" Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_del %>"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <RowStyle Height="40px" CssClass="GridViewRowStyle2" />
            </asp:DetailsView>
             <br />
            <asp:Button ID="Button10" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_edit %>" Visible="False" />
            <asp:Button ID="Button9" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_update %>" 
                Visible="False" />
            <asp:Button ID="Button11" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" 
                Visible="False" />
            <asp:Button ID="Button13" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_back %>" 
                Visible="False" CausesValidation="False" />
            <br />
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
            
            <span class="style1"><asp:Label ID="Label20" runat="server" Text="<%$ Resources:Resource, sip_lr_competitionContent %>"></asp:Label></span><cc1:Editor ID="Editor1" 
                runat="server" Height="200px" Width="512px" Visible="False" 
                ActiveMode="Preview" />

                </asp:View>
               <asp:View ID="View6" runat="server">
                <Ajax:CalendarExtender ID="CalendarExtender2" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="matchDate">
                        </Ajax:CalendarExtender>
                       <div style="width:1024px; height: 421px;" id="Div3">
                           <div style="width:508px; float:left; height: 428px;">
                              <table class="style17">
                                  <tr>
                                      <td class="style20">
                                          <asp:Label ID="Label16" runat="server" Text="<%$ Resources:Resource, sip_sp_Addstartdate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="matchDate" runat="server"></asp:TextBox>
                                           <asp:CompareValidator ID="CompareValidatorAddMatch" runat="server" 
                                              ControlToValidate="matchDate" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                            <Ajax:CalendarExtender ID="CalendarExtenderAddMatch" runat="server" CssClass="orange" 
                                             Format="yyyy/MM/dd" TargetControlID="matchDate">
                                            </Ajax:CalendarExtender>
                                      </td>
                                  </tr>

                                   <tr>
                                      <td class="style20">
                                          <asp:Label ID="Label41" runat="server" Text="<%$ Resources:Resource, sip_sp_Addenddate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="matchEndDate" runat="server"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidatorAddMatchEnd" runat="server" 
                                              ControlToValidate="matchEndDate" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                            <Ajax:CalendarExtender ID="CalendarExtenderAddMatchEnd" runat="server" CssClass="orange" 
                                             Format="yyyy/MM/dd" TargetControlID="matchEndDate">
                                            </Ajax:CalendarExtender>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style20">
                                          <asp:Label ID="Label17" runat="server" Text="<%$ Resources:Resource, sip_lr_Addcompetition %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="matchName" runat="server"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator23" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "matchName"   
                                           ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchName %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>

                                      <tr>
                                      <td class="style20">
                                          <asp:Label ID="Label42" runat="server" Text="<%$ Resources:Resource, sip_lr_AddcompetitionCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="matchNameCht" runat="server"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator24" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "matchNameCht"   
                                           ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchNameCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style21">
                                          <asp:Label ID="Label18" runat="server" Text="<%$ Resources:Resource, sip_lr_AddcompetitionType %>"></asp:Label>
                                      </td>
                                      <td class="style13">
                                          <asp:TextBox ID="matchCategory" runat="server"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator25" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "matchCategory"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchType %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                   <tr>
                                      <td class="style21">
                                          <asp:Label ID="Label43" runat="server" Text="<%$ Resources:Resource, sip_lr_AddcompetitionTypeCht %>"></asp:Label>
                                      </td>
                                      <td class="style13">
                                          <asp:TextBox ID="matchCategoryCht" runat="server"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator26" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "matchCategoryCht"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_MatchTypeCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                      <tr>
                                          <td class="style21">
                                              <asp:Label ID="Label19" runat="server" Text="<%$ Resources:Resource, sip_lr_AddcompetitionContent %>"></asp:Label>
                                          </td>
                                          <td class="style13">
                                              
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
                <td class="style16">
                    <span class="style1">
                    <asp:Button ID="matchIns" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_confirm %>" />
                    </span>
                </td>
                <td>
                    <span class="style1">
                    <asp:Button ID="matchCel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" CausesValidation="False" />
                    </span>
                    
                    
                    
                </td>
                 </tr>
                         <tr>
                         <td class="style16" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary9" runat="server" Width="400px" />
                    </td>
                </tr>
        </table>
 
      
 
        </div>
</div>


                </asp:View>
            </asp:MultiView>
          
        </asp:View>
        <asp:View ID="ViewReading" runat="server">
        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:Resource, sip_lr_studyRecord %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
		
            <br /><br /> 
            <asp:MultiView ID="MultiView7" runat="server" ActiveViewIndex="0">
                <asp:View ID="View11" runat="server">
                
            <asp:Button ID="addRead" runat="server" Text="<%$ Resources:Resource, sip_lr_AddStudyTitle %>"  CausesValidation="False"
                                     CssClass="blue" />       
                                     <br /><br />
            <asp:GridView ID="GridViewReading" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource4" 
                EmptyDataText="<%$ Resources:Resource, sip_data_check %>" 
                GridLines="Horizontal" PageSize="6" Font-Names="Calibri" Font-Size="Small" 
                Width="100%" CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                 <asp:TemplateField></asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_bookName %>" SortExpression="bookName">
                        <ItemTemplate>
                            <asp:LinkButton ID="bookLink" runat="server" CommandName="Select" 
                                Text='<%# Bind("bookName") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("bookName") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionEditBookName" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox1"   
                                           ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookName %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_author %>" SortExpression="author">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("author") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionEditAuthor" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_author %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("author") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_ver %>" 
                        SortExpression="version">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("version") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("version") %>' 
                                Width="50px"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                                ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_lr_error_version %>" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                                ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_lr_error_versionSize %>" 
                                ValidationExpression="^([\S\s]{0,2})$">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_publisher %>" SortExpression="publisher">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("publisher") %>'></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionEditPublisher" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_publisher %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("publisher") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_isbn %>" SortExpression="isbn">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("isbn") %>'></asp:TextBox>
                                   <asp:RegularExpressionValidator ID="RegularExpressionEditISBN" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookISBN %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("isbn") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_type %>" SortExpression="category">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionEditType" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookType %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("category") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="readEdit" runat="server" CausesValidation="False" 
                                CommandName="Edit"  Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_edit %>" ForeColor="#0095CD"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="readDel" runat="server" CausesValidation="False" 
                                CommandName="Delete"  Visible='<% #show() %>' Text="<%$ Resources:Resource, sip_sp_del %>"  OnClientClick="ConfirmMessage();" ForeColor="#0095CD"></asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="readUpdate" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="<%$ Resources:Resource, sip_sp_update %>" ForeColor="#0095CD"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="readCel" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="<%$ Resources:Resource, sip_sp_cancel %>" ForeColor="#0095CD"></asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle ForeColor="White" 
                    Font-Size="Large" Height="40px" CssClass="GridViewHeaderStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" CssClass="GridViewRowStyle" 
                    Height="40px" />
                <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
            </asp:GridView>
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:EPConnectionString.ProviderName %>" 
                 DeleteCommand="DELETE FROM [ReadingRecord] WHERE [id] = @id;
                               update Learning_Records_Correspond set [count] = [count] - 1 where (pess_cod = @pess_cod and experience_id='4')" 
                InsertCommand="INSERT INTO [ReadingRecord] ([pess_cod], [bookName], [author], [version], [publisher], [isbn], [category]) VALUES (@pess_cod, @bookName, @author, @version, @publisher, @isbn, @category);
                               update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='4')" 
                SelectCommand="SELECT * FROM [ReadingRecord] WHERE ([pess_cod] = @pess_cod)"
                UpdateCommand="UPDATE [ReadingRecord] SET [pess_cod] = @pess_cod, [bookName] = @bookName, [author] = @author, [version] = @version, [publisher] = @publisher, [isbn] = @isbn, [category] = @category WHERE [id] = @id">
                <SelectParameters>
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
                  <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="bookName" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="version" Type="Decimal" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="isbn" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="bookName" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="version" Type="Decimal" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="isbn" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:DetailsView ID="DetailsViewReading" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" DataKeyNames="id" 
                DataSourceID="SqlDataSource11" Height="50px" Width="579px" 
                Font-Names="Calibri" Font-Size="Small" GridLines="Horizontal" 
                CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                <Fields>
                  
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_bookName %>" SortExpression="bookName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("bookName") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditBookName" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox2"   
                                           ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookName %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("bookName") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsBookName" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox2"   
                                           ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookName %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("bookName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_author %>" SortExpression="author">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("author") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAuthor" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_author %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("author") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAuthor" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_author %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("author") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_ver %>" 
                        SortExpression="version">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("version") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("version") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_lr_error_version %>" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_lr_error_versionSize %>" 
                                ValidationExpression="^([\S\s]{0,2})$">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("version") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_lr_error_version %>" 
                                ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_lr_error_versionSize %>" 
                                ValidationExpression="^([\S\s]{0,2})$">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_publisher %>" SortExpression="publisher">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("publisher") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditPublisher" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_publisher %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("publisher") %>'></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsPublisher" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_publisher %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("publisher") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_isbn %>" SortExpression="isbn">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("isbn") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditISBN" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookISBN %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("isbn") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsISBN" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookISBN %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("isbn") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_type %>" SortExpression="category">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditType" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookType %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("category") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsType" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookType %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("category") %>'></asp:Label>
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
                    </asp:TemplateField>
                  
                </Fields>
                <RowStyle Height="40px" CssClass="GridViewRowStyle2" />
            </asp:DetailsView>
            <br />
                    <asp:Button ID="Button18" runat="server" CssClass="blue" 
                        Text="<%$ Resources:Resource, sip_back %>" CausesValidation="False" 
                        Visible="False" />
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                DeleteCommand="DELETE FROM [ReadingRecord] WHERE [id] = @id;
                               update Learning_Records_Correspond set [count] = [count] - 1 where (pess_cod = @pess_cod and experience_id='4')" 
                InsertCommand="INSERT INTO [ReadingRecord] ([pess_cod], [bookName], [author], [version], [publisher], [isbn], [category]) VALUES (@pess_cod, @bookName, @author, @version, @publisher, @isbn, @category);
                               update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='4')" 
                SelectCommand="SELECT * FROM [ReadingRecord] WHERE ([id] = @id)" 
                UpdateCommand="UPDATE [ReadingRecord] SET [pess_cod] = @pess_cod, [bookName] = @bookName, [author] = @author, [version] = @version, [publisher] = @publisher, [isbn] = @isbn, [category] = @category WHERE [id] = @id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewReading" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>

                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="bookName" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="version" Type="Decimal" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="isbn" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="bookName" Type="String" />
                    <asp:Parameter Name="author" Type="String" />
                    <asp:Parameter Name="version" Type="Decimal" />
                    <asp:Parameter Name="publisher" Type="String" />
                    <asp:Parameter Name="isbn" Type="String" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

                </asp:View>
                <asp:View ID="View12" runat="server">

                              <table class="style17">
                                  <tr>
                                      <td class="style34">
                                          <asp:Label ID="Label31" runat="server" Text="<%$ Resources:Resource, sip_lr_AddBookName %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="readName" runat="server"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator27" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "readName"   
                                           ValidationExpression = "^[\s\S]{0,100}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookName %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style34">
                                          <asp:Label ID="Label32" runat="server" Text="<%$ Resources:Resource, sip_lr_AddAuthor %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="readAuthor" runat="server"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator28" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "readAuthor"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_author %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style34">
                                          <asp:Label ID="Label33" runat="server" Text="<%$ Resources:Resource, sip_lr_Addver %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="readVer" runat="server"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                              ControlToValidate="readVer" ErrorMessage="<%$ Resources:Resource, sip_lr_error_version %>" 
                                              ValidationExpression="^[0-9]\d*$">*</asp:RegularExpressionValidator>
											  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                              ControlToValidate="readVer" ErrorMessage="<%$ Resources:Resource, sip_lr_error_versionSize %>" 
                                              ValidationExpression="^([\S\s]{0,2})$">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style34">
                                          <asp:Label ID="Label34" runat="server" Text="<%$ Resources:Resource, sip_lr_AddPublisher %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="readPub" runat="server"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator29" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "readPub"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_publisher %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style34">
                                          <asp:Label ID="Label35" runat="server" Text="<%$ Resources:Resource, sip_lr_AddIsbn %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="readISBN" runat="server"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator30" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "readISBN"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookISBN %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                             
                                
                                  <tr>
                                      <td class="style34">
                                          <asp:Label ID="Label36" runat="server" Text="<%$ Resources:Resource, sip_lr_AddCategory %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="readCategory" runat="server"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator31" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "readCategory"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_BookType %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                             
                                
                                  <tr>
                                      <td class="style34">
                                          &nbsp;</td>
                                      <td class="style23">
                                      <br />
                                          <asp:Button ID="readIns" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_confirm %>" />
                                          <asp:Button ID="readCel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>"  CausesValidation="False" />
										
										   
                                      </td>
                                  </tr>
                                  <tr>
                                <td class="style22" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="380px" />
                    </td>
                </tr>
                              </table>
              

                </asp:View>

            </asp:MultiView>
           
        </asp:View>
        <asp:View ID="ViewAward" runat="server">
        <asp:Label ID="awardTitle" runat="server" Text="<%$ Resources:Resource, sip_lr_awardTitle %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
		
            <br /><br />
            <asp:MultiView ID="MultiView3" runat="server" ActiveViewIndex="0">
                <asp:View ID="View3" runat="server">
                <asp:Button ID="addAward" runat="server" Text="<%$ Resources:Resource, sip_lr_AddAwardTitle %>" CausesValidation="False"
                                     CssClass="blue" />       
                                     <br /><br />
            <asp:GridView ID="GridViewAward" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource5" 
                EmptyDataText="<%$ Resources:Resource, sip_data_check %>" PageSize="6" 
                Font-Names="Calibri" Font-Size="Small" Width="100%" 
                CssClass="GridViewStyle" GridLines="Horizontal">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                  <asp:TemplateField></asp:TemplateField>
                    <asp:BoundField DataField="dateAward" 
                        HeaderText="<%$ Resources:Resource, sip_sp_relevantDate %>" SortExpression="dateAward" 
                        DataFormatString="{0:yyyy/MM/dd}" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_awardName %>" 
                        SortExpression="awardName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("awardName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                             <asp:LinkButton ID="awardLink" runat="server" CommandName="Select" 
                                Text='<%# Bind("awardName") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_awardNameCht %>" 
                        SortExpression="awardNameCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("awardNameCht") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="awardLinkCht" runat="server" CommandName="Select" 
                                Text='<%# Bind("awardNameCht") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="organizer" HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>" 
                        SortExpression="organizer" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="organizerCht" HeaderText="<%$ Resources:Resource, sip_sp_relevantOrgCht %>" 
                        SortExpression="organizerCht">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Select" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_relevantDescrib %>"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle 
                    Font-Size="Large" Height="40px" CssClass="GridViewHeaderStyle" 
                    ForeColor="White" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" CssClass="GridViewRowStyle" 
                    Height="40px" />
                <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
            </asp:GridView>
                 <asp:ValidationSummary ID="ValidationSummary15" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                        SelectCommand="SELECT * FROM [AwardRecord] WHERE ([pess_cod] = @pess_cod) ORDER BY [dateAward] DESC">
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:DetailsView ID="DetailsViewAward" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" DataKeyNames="id" 
                DataSourceID="SqlDataSource12" GridLines="Horizontal" 
                Height="50px" Width="575px" Font-Names="Calibri" Font-Size="Small" 
                CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                <Fields>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantDate %>" SortExpression="dateAward">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("dateAward", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidatorEditAward" runat="server" 
                                            ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_lr_error_TopicDate %>" 
                                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                  <Ajax:CalendarExtender ID="CalendarExtenderEditAward" runat="server" CssClass="orange" 
                                                          Format="yyyy/MM/dd" TargetControlID="TextBox1"> </Ajax:CalendarExtender>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("dateAward", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                 <asp:CompareValidator ID="CompareValidatorInsAward" runat="server" 
                                            ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_lr_error_TopicDate %>" 
                                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                  <Ajax:CalendarExtender ID="CalendarExtenderInsAward" runat="server" CssClass="orange" 
                                                          Format="yyyy/MM/dd" TargetControlID="TextBox1"> </Ajax:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Bind("dateAward", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_awardName %>" SortExpression="awardName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("awardName") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAwardName" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardName %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("awardName") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAwardName" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardName %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("awardName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_awardNameCht %>" SortExpression="awardNameCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("awardNameCht") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAwardNameCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardNameCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("awardNameCht") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAwardNameCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardNameCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("awardNameCht") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_description %>" 
                        SortExpression="description">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Height="123px" 
                                Text='<%# Bind("description") %>' TextMode="MultiLine" Width="245px"></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Height="123px" 
                                Text='<%# Bind("description") %>' TextMode="MultiLine" Width="245px"></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_relevantOrg %>" SortExpression="organizer">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("organizer") %>'></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAwardOrg" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardOrg %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("organizer") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAwardOrg" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardOrg %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("organizer") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_sp_relevantOrgCht %>" SortExpression="organizerCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("organizerCht") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAwardOrgCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardOrgCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("organizerCht") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAwardOrgCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardOrgCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("organizerCht") %>'></asp:Label>
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
                    </asp:TemplateField>
                </Fields>
                <RowStyle Height="40px" CssClass="GridViewRowStyle2" />
            </asp:DetailsView>
            <br />
            <asp:Button ID="Button14" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_back %>" 
                Visible="False" CausesValidation="False" />
            <asp:SqlDataSource ID="SqlDataSource12" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                DeleteCommand="DELETE FROM [AwardRecord] WHERE [id] = @id;
                               update Learning_Records_Correspond set [count] = [count] - 1 where (pess_cod = @pess_cod and experience_id='5')" 
                InsertCommand="INSERT INTO [AwardRecord] ([pess_cod], [awardName], [dateAward], [organizer], [description], [awardNameCht], [organizerCht]) VALUES (@pess_cod, @awardName, @dateAward, @organizer, @description, @awardNameCht, @organizerCht);
                               update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='5')" 
                SelectCommand="SELECT * FROM [AwardRecord] WHERE ([id] = @id)" 
                UpdateCommand="UPDATE [AwardRecord] SET [pess_cod] = @pess_cod, [awardName] = @awardName, [dateAward] = @dateAward, [organizer] = @organizer, [description] = @description, [awardNameCht] = @awardNameCht, [organizerCht] = @organizerCht WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="awardName" Type="String" />
                    <asp:Parameter Name="dateAward" DbType="DateTime" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="awardNameCht" Type="String" />
                    <asp:Parameter Name="organizerCht" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewAward" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                   <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="awardName" Type="String" />
                    <asp:Parameter Name="dateAward" DbType="DateTime" />
                    <asp:Parameter Name="organizer" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="awardNameCht" Type="String" />
                    <asp:Parameter Name="organizerCht" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>


                </asp:View>
                <asp:View ID="View4" runat="server">
             
                     <div style="width:1024px; height: 321px;" id="Div2">
                           <div style="width:672px; float:left; height: 272px;">
                              <table class="style17">
                                  <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label12" runat="server" Text="<%$ Resources:Resource, sip_sp_AddrelevantDate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="awardDateTxt" runat="server"></asp:TextBox>
                                           <asp:CompareValidator ID="CompareValidatorAddAward" runat="server" 
                                              ControlToValidate="awardDateTxt" ErrorMessage="<%$ Resources:Resource, sip_lr_error_TopicDate %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                           <Ajax:CalendarExtender ID="CalendarExtenderAddAward" runat="server" CssClass="orange" 
                                               Format="yyyy/MM/dd" TargetControlID="awardDateTxt">
                                            </Ajax:CalendarExtender>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style13">
                                          <asp:Label ID="Label13" runat="server" Text="<%$ Resources:Resource, sip_lr_AddAwardName %>"></asp:Label>
                                      </td>
                                      <td class="style13">
                                          <asp:TextBox ID="awardNameTxt" runat="server"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator32" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "awardNameTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardName %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                    <tr>
                                      <td class="style13">
                                          <asp:Label ID="Label44" runat="server" Text="<%$ Resources:Resource, sip_lr_AddAwardNameCht %>"></asp:Label>
                                      </td>
                                      <td class="style13">
                                          <asp:TextBox ID="awardNameChtTxt" runat="server"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator33" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "awardNameChtTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardNameCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label14" runat="server" Text="<%$ Resources:Resource, sip_lr_AddAwardDescrib %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="describtionTxt" runat="server" Height="123px" 
                                              TextMode="MultiLine" Width="245px"></asp:TextBox>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label15" runat="server" Text="<%$ Resources:Resource, sip_sp_AddrelevantOrg %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="organizationTxt" runat="server"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator34" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "organizationTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardOrg %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                   <tr>
                                      <td class="style22">
                                          <asp:Label ID="Label45" runat="server" Text="<%$ Resources:Resource, sip_sp_AddrelevantOrgCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="organizationChtTxt" runat="server"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator35" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "organizationChtTxt"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AwardOrgCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style22">
                                          &nbsp;</td>
                                      <td class="style23">
                                      <br />
                                          <asp:Button ID="awardIns" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_confirm %>" />
                                          <asp:Button ID="awardCel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" CausesValidation="False" />
                                      </td>
                                  </tr>
                                 <tr>
                                <td class="style22" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary10" runat="server" Width="400px" />
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
        <asp:View ID="ViewAbroad" runat="server">
         <asp:Label ID="studyTATitle" runat="server" Text="<%$ Resources:Resource, sip_lr_studyTA %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
		  
          <br /><br />
            <asp:MultiView ID="MultiView6" runat="server" ActiveViewIndex="0">
                <asp:View ID="View9" runat="server">
                 <asp:Button ID="addAbroad" runat="server" Text="<%$ Resources:Resource, sip_lr_AddStudentProgram %>" CausesValidation="False"
                                     CssClass="blue" />       
                                     <br /><br />
            <asp:GridView ID="GridViewAbroad" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource6" 
                EmptyDataText="<%$ Resources:Resource, sip_data_check %>" PageSize="6" 
                Font-Names="Calibri" Font-Size="Small" 
                GridLines="Horizontal" Width="100%" CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                 <asp:TemplateField></asp:TemplateField>
                    <asp:BoundField DataField="startDate" HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" 
                        SortExpression="startDate" DataFormatString="{0:yyyy/MM/dd}" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="endDate" HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" 
                        SortExpression="endDate" DataFormatString="{0:yyyy/MM/dd}" >
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="country" HeaderText="<%$ Resources:Resource, sip_lr_studyCountry %>" 
                        SortExpression="country">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="countryCht" HeaderText="<%$ Resources:Resource, sip_lr_studyCountryCht %>" 
                        SortExpression="countryCht">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="school" HeaderText="<%$ Resources:Resource, sip_lr_studySchool %>" SortExpression="school">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="schoolCht" HeaderText="<%$ Resources:Resource, sip_lr_studySchoolCht %>" 
                        SortExpression="schoolCht">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_studySubject %>" SortExpression="majorSubj">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("majorSubj") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                             <asp:LinkButton ID="abroadLink" runat="server" CommandName="Select" 
                                Text='<%# Bind("majorSubj") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_studySubjectCht %>" 
                        SortExpression="majorSubjCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("majorSubjCht") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                             <asp:LinkButton ID="abroadLinkCht" runat="server" CommandName="Select" 
                                Text='<%# Bind("majorSubjCht") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Select" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_relevantDescrib %>"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle ForeColor="White" 
                    Font-Size="Large" Height="40px" CssClass="GridViewHeaderStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <RowStyle CssClass="GridViewRowStyle" Height="40px" />
                <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
            </asp:GridView>
                 <asp:ValidationSummary ID="ValidationSummary16" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                        SelectCommand="SELECT * FROM [StudyTA] WHERE ([pess_cod] = @pess_cod) ORDER BY [startDate] DESC">
                
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:DetailsView ID="DetailsViewAbroad" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" DataKeyNames="id" 
                DataSourceID="SqlDataSource13" GridLines="Horizontal" Height="50px" 
                Width="613px" Font-Names="Calibri" Font-Size="Small" 
                CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                <Fields>
                  
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" SortExpression="startDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                
                            <asp:CompareValidator ID="CompareValidatorEditStudyTA" runat="server" 
                                 ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                           <Ajax:CalendarExtender ID="CalendarExtenderEditStudyTA" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox1"> </Ajax:CalendarExtender>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                   <asp:CompareValidator ID="CompareValidatorInsStudyTA" runat="server" 
                                 ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                           <Ajax:CalendarExtender ID="CalendarExtenderInsStudyTA" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox1"> </Ajax:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" SortExpression="endDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" 
                                Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                   <asp:CompareValidator ID="CompareValidatorEditStudyTAEnd" runat="server" 
                                 ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                           <Ajax:CalendarExtender ID="CalendarExtenderEditStudyTAEnd" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox2"> </Ajax:CalendarExtender>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" 
                                Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                   <asp:CompareValidator ID="CompareValidatorInsStudyTAEnd" runat="server" 
                                 ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                           <Ajax:CalendarExtender ID="CalendarExtenderInsStudyTAEnd" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox2"> </Ajax:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" 
                                Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_studyCountry %>" SortExpression="country">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("country") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("country") %>'></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAbroadCountry" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadCountry %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("country") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAbroadCountry" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadCountry %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_studyCountryCht %>" SortExpression="countryCht">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("countryCht") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("countryCht") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAbroadCountryCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadCountryCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("countryCht") %>'></asp:TextBox>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAbroadCountryCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadCountryCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_studySchool %>" SortExpression="school">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("school") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("school") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAbroadSchool" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadSchool %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("school") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAbroadSchool" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadSchool %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_studySchoolCht %>" SortExpression="schoolCht">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("schoolCht") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("schoolCht") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAbroadSchoolCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadSchoolCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("schoolCht") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAbroadSchoolCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadSchoolCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_studySubject %>" SortExpression="majorSubj">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("majorSubj") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("majorSubj") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAbroadSubject" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadTopic %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("majorSubj") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAbroadSubject" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadTopic %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_studySubjectCht %>" SortExpression="majorSubjCht">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("majorSubjCht") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("majorSubjCht") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditAbroadSubjectCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadTopicCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("majorSubjCht") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsAbroadSubjectCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadTopicCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
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
                                CommandName="Update" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_update %>"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_cancel %>"></asp:LinkButton>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Insert" Text="<%$ Resources:Resource, sip_ins %>" ForeColor="#0095CD"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="<%$ Resources:Resource, sip_sp_cancel %>" ForeColor="#0095CD"></asp:LinkButton>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                </Fields>
                <RowStyle Height="40px" CssClass="GridViewRowStyle2" />
            </asp:DetailsView>
            <br />
            <asp:Button ID="Button15" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_back %>" 
                Visible="False" CausesValidation="False" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource13" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                DeleteCommand="DELETE FROM [StudyTA] WHERE [id] = @id;
                               update Learning_Records_Correspond set [count] = [count] - 1  where (pess_cod = @pess_cod and experience_id='6')" 
                InsertCommand="INSERT INTO [StudyTA] ([pess_cod], [country], [school], [majorSubj], [grade], [startDate], [endDate], [description], [countryCht], [schoolCht], [majorSubjCht]) VALUES (@pess_cod, @country, @school, @majorSubj, @grade, @startDate, @endDate, @description, @countryCht, @schoolCht, @majorSubjCht);
                               update Learning_Records_Correspond set [count] = [count] + 1  where (pess_cod = @pess_cod and experience_id='6')" 
                SelectCommand="SELECT * FROM [StudyTA] WHERE ([id] = @id)" 
                
                
                
                        UpdateCommand="UPDATE [StudyTA] SET [pess_cod] = @pess_cod, [country] = @country, [school] = @school, [majorSubj] = @majorSubj, [grade] = @grade, [startDate] = @startDate, [endDate] = @endDate, [description] = @description, [countryCht] = @countryCht, [schoolCht] = @schoolCht, [majorSubjCht] = @majorSubjCht WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                     <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="country" Type="String" />
                    <asp:Parameter Name="school" Type="String" />
                    <asp:Parameter Name="majorSubj" Type="String" />
                    <asp:Parameter Name="grade" Type="String" />
                    <asp:Parameter DbType="DateTime" Name="startDate" />
                    <asp:Parameter Name="endDate" DbType="DateTime" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="countryCht" Type="String" />
                    <asp:Parameter Name="schoolCht" Type="String" />
                    <asp:Parameter Name="majorSubjCht" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewAbroad" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                     <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="country" Type="String" />
                    <asp:Parameter Name="school" Type="String" />
                    <asp:Parameter Name="majorSubj" Type="String" />
                    <asp:Parameter Name="grade" Type="String" />
                    <asp:Parameter Name="startDate" DbType="DateTime" />
                    <asp:Parameter Name="endDate" DbType="DateTime" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="countryCht" Type="String" />
                    <asp:Parameter Name="schoolCht" Type="String" />
                    <asp:Parameter Name="majorSubjCht" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />

                </asp:View>
            <asp:View ID="View10" runat="server">
             <Ajax:CalendarExtender ID="CalendarExtender4" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="abroadStart">
                        </Ajax:CalendarExtender>
             <Ajax:CalendarExtender ID="CalendarExtender5" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="abroadEnd">
                        </Ajax:CalendarExtender>
               <div style="width:1024px; height: 321px;" id="Div5">
                           <div style="width:522px; float:left; height: 272px;">
                              <table class="style17">
                                  <tr>
                                      <td class="style29">
                                          <asp:Label ID="Label26" runat="server" Text="<%$ Resources:Resource, sip_sp_Addstartdate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="abroadStart" runat="server"></asp:TextBox>
                                           <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                              ControlToValidate="abroadStart" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style29">
                                          <asp:Label ID="Label27" runat="server" Text="<%$ Resources:Resource, sip_sp_Addenddate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="abroadEnd" runat="server"></asp:TextBox>
                                           <asp:CompareValidator ID="CompareValidator5" runat="server" 
                                              ControlToValidate="abroadEnd" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style29">
                                          <asp:Label ID="Label28" runat="server" Text="<%$ Resources:Resource, sip_lr_AddStudyCountry %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="abroadCountry" runat="server"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator36" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "abroadCountry"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadCountry %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                    <tr>
                                      <td class="style29">
                                          <asp:Label ID="Label46" runat="server" Text="<%$ Resources:Resource, sip_lr_AddStudyCountryCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="abroadCountryCht" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator37" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "abroadCountryCht"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadCountryCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style29">
                                          <asp:Label ID="Label29" runat="server" Text="<%$ Resources:Resource, sip_lr_AddStudySchool %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="abroadSchool" runat="server"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator38" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "abroadSchool"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadSchool %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                     <tr>
                                      <td class="style29">
                                          <asp:Label ID="Label47" runat="server" Text="<%$ Resources:Resource, sip_lr_AddStudySchoolCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="abroadSchoolCht" runat="server"></asp:TextBox>
                                             <asp:RegularExpressionValidator ID="RegularExpressionValidator39" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "abroadSchoolCht"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadSchoolCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style29">
                                          <asp:Label ID="Label30" runat="server" Text="<%$ Resources:Resource, sip_lr_AddStudySubject %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="abroadTopic" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator40" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "abroadTopic"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadTopic %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                      <tr>
                                      <td class="style29">
                                          <asp:Label ID="Label48" runat="server" Text="<%$ Resources:Resource, sip_lr_AddStudySubjectCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="abroadTopicCht" runat="server"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator41" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "abroadTopicCht"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_error_AbroadTopicCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style29">
                                          &nbsp;</td>
                                      <td class="style23">
                                      <br />
                                          <asp:Button ID="abroadIns" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_confirm %>" />
                                          <asp:Button ID="abroadCel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" CausesValidation="False" />
                                      </td>
                                  </tr>
                                  <tr>
                                <td class="style22" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary11" runat="server" Width="380px" />
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
        <asp:View ID="ViewIntership" runat="server">
        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:Resource, sip_lr_internshipTitle %>" style="color:black;font-size:x-large;font-family: 'Berlin Sans FB';"></asp:Label>
		 
           <br /> <br />
            <asp:MultiView ID="MultiView5" runat="server" ActiveViewIndex="0">
                <asp:View ID="View7" runat="server">
                <asp:Button ID="addShip" runat="server" Text="<%$ Resources:Resource, sip_lr_AddInternship %>" CausesValidation="False"
                                     CssClass="blue" />       
                                     <br /><br />
            <asp:GridView ID="GridViewIntership" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource7" 
                EmptyDataText="<%$ Resources:Resource, sip_data_check %>" PageSize="6" 
                Font-Names="Calibri" Font-Size="Small" 
                GridLines="Horizontal" Width="100%" CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                  <asp:TemplateField></asp:TemplateField>
                    <asp:BoundField DataField="startDate" HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" 
                        SortExpression="startDate" DataFormatString="{0:yyyy/MM/dd}">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="endDate" HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" 
                        SortExpression="endDate" DataFormatString="{0:yyyy/MM/dd}">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="company" HeaderText="<%$ Resources:Resource, sip_sp_company %>" 
                        SortExpression="company">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="companyCht" HeaderText="<%$ Resources:Resource, sip_sp_companyCht %>" 
                        SortExpression="companyCht">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_jobTilte %>" SortExpression="jobTitle">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("jobTitle") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                          <asp:LinkButton ID="jobLink" runat="server" CommandName="Select" 
                                Text='<%# Bind("jobTitle") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_jobTilteCht %>" SortExpression="jobTitleCht">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("jobTitleCht") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                           <asp:LinkButton ID="jobLinkCht" runat="server" CommandName="Select" 
                                Text='<%# Bind("jobTitleCht") %>'></asp:LinkButton>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Select" ForeColor="#0095CD" Text="<%$ Resources:Resource, sip_sp_relevantDescrib %>"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle ForeColor="White" 
                    Font-Size="Large" Height="40px" CssClass="GridViewHeaderStyle" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" CssClass="GridViewRowStyle" 
                    Height="40px" />
                <SelectedRowStyle CssClass="GridViewSelectRowStyle" />
                <SortedAscendingCellStyle CssClass="GridViewSortStyle" />
                <SortedAscendingHeaderStyle CssClass="GridViewSortHeaderStyle" />
            </asp:GridView>
                 <asp:ValidationSummary ID="ValidationSummary17" runat="server" />
            <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                        SelectCommand="SELECT * FROM [Intership] WHERE ([pess_cod] = @pess_cod) ORDER BY [startDate] DESC">
                
                <SelectParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
             
            <br />
            <br />
            <asp:DetailsView ID="DetailsViewIntership" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource14" Height="50px" 
                Width="582px" Font-Names="Calibri" Font-Size="Small" 
                GridLines="Horizontal" CssClass="GridViewStyle">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
                <Fields>
                   
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_startdate %>" SortExpression="startDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidatorEditShip" runat="server" 
                                 ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                 Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                               <Ajax:CalendarExtender ID="CalendarExtenderEditShip" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox1"> </Ajax:CalendarExtender>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" 
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                  <asp:CompareValidator ID="CompareValidatorInsShip" runat="server" 
                                 ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                 Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                               <Ajax:CalendarExtender ID="CalendarExtenderInsShip" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox1"> </Ajax:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" 
                                Text='<%# Bind("startDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_enddate %>" SortExpression="endDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" 
                                Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                  <asp:CompareValidator ID="CompareValidatorEditShipEnd" runat="server" 
                                 ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                 Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                               <Ajax:CalendarExtender ID="CalendarExtenderEditShipEnd" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox2"> </Ajax:CalendarExtender>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" 
                                Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                   <asp:CompareValidator ID="CompareValidatorInsShipEnd" runat="server" 
                                 ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                 Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                               <Ajax:CalendarExtender ID="CalendarExtenderInsShipEnd" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox2"> </Ajax:CalendarExtender>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" 
                                Text='<%# Bind("endDate", "{0:yyyy/MM/dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_company %>" SortExpression="company">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("company") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("company") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditShipCompany" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipCompany %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("company") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsShipCompany" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox3"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipCompany %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_sp_companyCht %>" SortExpression="companyCht">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("companyCht") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("companyCht") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditShipCompanyCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipCompanyCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("companyCht") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsShipCompanyCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox4"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipCompanyCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_jobTilte %>" SortExpression="jobTitle">
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("jobTitle") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("jobTitle") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditShipJob" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipJob %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("jobTitle") %>'></asp:TextBox>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsShipJob" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox5"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipJob %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_jobTilteCht %>" SortExpression="jobTitleCht">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("jobTitleCht") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("jobTitleCht") %>'></asp:TextBox>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditShipJobCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipJobCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("jobTitleCht") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsShipJobCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox6"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipJobCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="<%$ Resources:Resource, sip_lr_jobDuration %>" SortExpression="duration">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("duration") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("duration") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditShipDuration" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipDuration %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("duration") %>'></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsShipDuration" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox7"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipDuration %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField  HeaderText="<%$ Resources:Resource, sip_lr_jobDurationCht %>" SortExpression="durationCht">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("durationCht") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("durationCht") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEditShipDurationCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipDurationCht %>">*</asp:RegularExpressionValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("durationCht") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidatorInsShipDurationCht" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "TextBox8"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipDurationCht %>">*</asp:RegularExpressionValidator>
                        </InsertItemTemplate>
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
                    </asp:TemplateField>
                </Fields>
                <RowStyle Height="40px" CssClass="GridViewRowStyle2" />
            </asp:DetailsView>
            <br />
            <asp:Button ID="Button16" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_back %>" 
                Visible="False" CausesValidation="False" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource14" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                DeleteCommand="DELETE FROM [Intership] WHERE [id] = @id;
                               update Learning_Records_Correspond set [count] = [count] - 1 where (pess_cod = @pess_cod and experience_id='7')" 
                InsertCommand="INSERT INTO [Intership] ([pess_cod], [company], [jobTitle], [description], [startDate], [endDate], [duration], [companyCht], [jobTitleCht], [durationCht]) VALUES (@pess_cod, @company, @jobTitle, @description, @startDate, @endDate, @duration, @companyCht, @jobTitleCht, @durationCht);
                               update Learning_Records_Correspond set [count] = [count] + 1 where (pess_cod = @pess_cod and experience_id='7')" 
                SelectCommand="SELECT * FROM [Intership] WHERE ([id] = @id)" 
                UpdateCommand="UPDATE [Intership] SET [pess_cod] = @pess_cod, [company] = @company, [jobTitle] = @jobTitle, [description] = @description, [startDate] = @startDate, [endDate] = @endDate, [duration] = @duration, [companyCht] = @companyCht, [jobTitleCht] = @jobTitleCht, [durationCht] = @durationCht WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                     <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                     <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="company" Type="String" />
                    <asp:Parameter Name="jobTitle" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter DbType="DateTime" Name="startDate" />
                    <asp:Parameter Name="endDate" DbType="DateTime" />
                    <asp:Parameter Name="duration" Type="String" />
                    <asp:Parameter Name="companyCht" Type="String" />
                    <asp:Parameter Name="jobTitleCht" Type="String" />
                    <asp:Parameter Name="durationCht" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridViewIntership" Name="id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="pess_cod" SessionField="pess_cod" Type="Decimal" />
                    <asp:Parameter Name="company" Type="String" />
                    <asp:Parameter Name="jobTitle" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter DbType="DateTime" Name="startDate" />
                    <asp:Parameter Name="endDate" DbType="DateTime" />
                    <asp:Parameter Name="duration" Type="String" />
                    <asp:Parameter Name="companyCht" Type="String" />
                    <asp:Parameter Name="jobTitleCht" Type="String" />
                    <asp:Parameter Name="durationCht" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

                </asp:View>
                <asp:View ID="View8" runat="server">
                  <Ajax:CalendarExtender ID="CalendarExtender6" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="shipStart">
                        </Ajax:CalendarExtender>
                  <Ajax:CalendarExtender ID="CalendarExtender7" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="shipEnd">
                        </Ajax:CalendarExtender>
                             <div style="width:1024px; height: 321px;" id="Div4">
                           <div style="width:337px; float:left; height: 272px;">
                              <table class="style17">
                                  <tr>
                                      <td class="style31">
                                          <asp:Label ID="Label21" runat="server" Text="<%$ Resources:Resource, sip_sp_Addstartdate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="shipStart" runat="server"></asp:TextBox>
                                               <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                              ControlToValidate="shipStart" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style31">
                                          <asp:Label ID="Label22" runat="server" Text="<%$ Resources:Resource, sip_sp_Addenddate %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="shipEnd" runat="server"></asp:TextBox>
                                           <asp:CompareValidator ID="CompareValidator7" runat="server" 
                                              ControlToValidate="shipEnd" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                              Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style31">
                                          <asp:Label ID="Label23" runat="server" Text="<%$ Resources:Resource, sip_sp_AddCompany %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="shipCompany" runat="server"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator42" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "shipCompany"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipCompany %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                      <tr>
                                      <td class="style31">
                                          <asp:Label ID="Label49" runat="server" Text="<%$ Resources:Resource, sip_sp_AddCompanyCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="shipCompanyCht" runat="server"></asp:TextBox>
                                          <asp:RegularExpressionValidator ID="RegularExpressionValidator43" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "shipCompanyCht"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipCompanyCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style31">
                                          <asp:Label ID="Label24" runat="server" Text="<%$ Resources:Resource, sip_lr_AddjobTilte %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="shipJob" runat="server"></asp:TextBox>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator44" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "shipJob"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipJob %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                   <tr>
                                      <td class="style31">
                                          <asp:Label ID="Label50" runat="server" Text="<%$ Resources:Resource, sip_lr_AddjobTilteCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="shipJobCht" runat="server"></asp:TextBox>
                                              <asp:RegularExpressionValidator ID="RegularExpressionValidator45" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "shipJobCht"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipJobCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style31">
                                          <asp:Label ID="Label25" runat="server" Text="<%$ Resources:Resource, sip_lr_AddjobDuration %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="shipDuration" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator46" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "shipDuration"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipDuration %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style31">
                                          <asp:Label ID="Label51" runat="server" Text="<%$ Resources:Resource, sip_lr_AddjobDurationCht %>"></asp:Label>
                                      </td>
                                      <td class="style23">
                                          <asp:TextBox ID="shipDurationCht" runat="server"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator47" runat="server" 
                                           Display = "Dynamic" ControlToValidate = "shipDurationCht"   
                                           ValidationExpression = "^[\s\S]{0,50}$"  
                                           ErrorMessage="<%$ Resources:Resource, sip_lr_errorShipDurationCht %>">*</asp:RegularExpressionValidator>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="style31">
                                          &nbsp;</td>
                                      <td class="style23">
                                      <br />
                                          <asp:Button ID="shipIns" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_confirm %>" />
                                          <asp:Button ID="shipCel" runat="server" CssClass="blue" Text="<%$ Resources:Resource, sip_sp_cancel %>" CausesValidation="False" />
                                      </td>
                                  </tr>
                                 <tr>
                                <td class="style22" colspan="2">
                        <asp:ValidationSummary ID="ValidationSummary12" runat="server" Width="380px" />
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
    </asp:MultiView>
    <asp:hiddenfield ID="message" runat="server"></asp:hiddenfield>
     <asp:SqlDataSource ID="SqlDataSource15" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [Learining_Records_Experience]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource16" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT * FROM [Learning_Records_Correspond]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:SessionParameter Name="id" SessionField="Role_Type" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource18" runat="server"   
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            SelectCommand="SELECT * FROM [userGroup] WHERE ([id] = @id)">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="position" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        
        <asp:HiddenField ID="pess_cod" runat="server" />
        
        

    </div>
</td>
</tr>
    </table>
    </form>

</body>
</html>