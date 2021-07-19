<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentBonus.aspx.vb" Inherits="Admin_StudentBonus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
  <link rel="stylesheet" href="../teachGrid.css" type="text/css" media="screen" />
  <link rel="stylesheet" href="../grid.css" type="text/css" media="screen" />  
  <style type="text/css">
       .stylefont
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
        .style1
      {
          width: 100%;
      }
      .style2
      {
          height: 20px;
      }
      .style3
      {
          height: 20px;
          width: 73px;
      }
        </style>
</head>
<body background="../images/church.gif">
    <form id="form1" runat="server">
    <div>
   
             <span class="stylefont">Student Bonus Point</span>
              <div style="text-align:center;margin-top:-35px;padding-bottom:12px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" Height="55px" Width="150px"/>
               </div>
        
               <br />  <br /><br />
        
                  <table class="style1">
                      <tr>
                          <td class="style3">
                    <asp:Label ID="grade" runat="server" Text="Grade:" Font-Size="Large"></asp:Label>
                          </td>
                          <td class="style2">
                  <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                  <asp:ListItem Value="1">First Year</asp:ListItem>
                  <asp:ListItem Value="2">Second Year</asp:ListItem>
                  <asp:ListItem Value="3">Third Year</asp:ListItem>
                  <asp:ListItem Value="4">Fourth Year</asp:ListItem>
                 </asp:DropDownList>
                    
                          </td>
                      </tr>
             </table>
              <br /><br />
    <asp:GridView ID="GridViewBonus" runat="server" AutoGenerateColumns="False" 
            BorderStyle="None" CssClass="GridViewStyle" GridLines="Horizontal" 
            Width="100%" AllowPaging="True" AllowSorting="True" 
            EmptyDataText="There are no data records to display.">
        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
        <Columns>
          <asp:TemplateField>
                    </asp:TemplateField>
         <asp:BoundField DataField="STUDENT_ID" HeaderText="Student ID" SortExpression="STUDENT_ID">
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="NAME_PT" HeaderText="English Name" 
                SortExpression="NAME_PT" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="NAME_CH" HeaderText="Chinese Name" 
                SortExpression="NAME_CH" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="Total_Point" HeaderText="Earned Credit" 
                SortExpression="Total_Point" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="used_credit" HeaderText="Used Credit" 
                SortExpression="used_credit" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
            <asp:BoundField DataField="valid_credit" HeaderText="Available Credit" 
                SortExpression="valid_credit" >
            <HeaderStyle HorizontalAlign="Left" />
            </asp:BoundField>
        </Columns>
        <HeaderStyle CssClass="GridViewHeaderStyle" Font-Size="Large" ForeColor="White" 
            Height="40px" />
        <PagerStyle CssClass="GridViewPagerStyle" HorizontalAlign="Center" />
        <RowStyle CssClass="GridViewRowStyle" />
    </asp:GridView>
    </div>
    </form>
</body>
</html>
