<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SeminarStudent.aspx.vb" Inherits="Admin_SeminarStudent" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="Ajax" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
     <link rel="stylesheet" href="../Student/styles/orange.css" type="text/css" media="screen" />  
       <style type="text/css">
        .style1
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
            margin-top:30px;
        }


        </style>
</head>
<body background="../images/church.gif">
    <form id="form1" runat="server">
    <div>
         <div class="style1">Registered Student Management</div>
      <div style="text-align:center;margin-top:-45px;padding-bottom:12px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" Height="55px" Width="150px"/>
   
   </div>
   <br />  <br />  <br />
        <Ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Register Time:"></asp:Label>
         <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                            Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                    
                           <Ajax:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="orange" 
                            Format="yyyy/MM/dd" TargetControlID="TextBox1">
                      </Ajax:CalendarExtender>
     <asp:Button ID="Button1" runat="server" Text="Search" CssClass="blue" /><br /><br />
            <asp:GridView ID="GridViewRegGift" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" BorderStyle="None" 
                CssClass="GridViewStyle" GridLines="Horizontal" Width="100%" 
                DataKeyNames="PRIMARY_EMAIL" 
                EmptyDataText="There are no data records to display">
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="Student ID">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NAME_CH" HeaderText="Chinese Name">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="NAME_PT" HeaderText="English Name">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="PRIMARY_EMAIL" HeaderText="Email">
                    <HeaderStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:CommandField SelectText="Send Email" ShowSelectButton="True" />
                </Columns>
                <HeaderStyle CssClass="GridViewHeaderStyle" Font-Size="Large" ForeColor="White" 
                    Height="40px" />
                <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
                <RowStyle CssClass="GridViewRowStyle" />
            </asp:GridView>
               <br /><br />
                    <asp:Button ID="Button2" runat="server" Text="Cancel Above Registered Students" CssClass="blue" 
                Visible="False" />
    <asp:Button ID="Button3" runat="server" Text="Send Email To All Above Students" CssClass="blue" 
                Visible="False" />
            <br />
        </asp:View>
         <asp:View ID="View2" runat="server">
             <table border="0" cellpadding="0" cellspacing="0">
                 <tr>
                     <td style="width: 80px">
                         To:
                     </td>
                     <td>
                         <asp:TextBox ID="txtTo" runat="server" Height="93px" TextMode="MultiLine" 
                             Width="711px"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         &nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>
                         Subject:
                     </td>
                     <td>
                         <asp:TextBox ID="txtSubject" runat="server" Width="709px"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         &nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td valign="top">
                         Content:
                     </td>
                     <td>
                         <asp:TextBox ID="txtBody" runat="server" Height="150px" TextMode="MultiLine" 
                             Width="715px"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         &nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>
                         &nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>
                         Email:
                     </td>
                     <td>
                         <asp:TextBox ID="txtEmail" runat="server" Width="303px"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         &nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>
                         Password:
                     </td>
                     <td>
                         <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="303px"></asp:TextBox>
                     </td>
                 </tr>
                 <tr>
                     <td>
                         &nbsp;
                     </td>
                 </tr>
                 <tr>
                     <td>
                     </td>
                     <td>
                         <asp:Button ID="Button4" runat="server" Text="Send" CssClass="blue" />
                         <asp:Button ID="Button5" runat="server" Text="Cancel" CssClass="blue" />
                     </td>
                 </tr>
             </table>
    </asp:View>
    </asp:MultiView>




    </div>
   
    </form>
   
</body>
</html>
