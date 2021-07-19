<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SetGiftTime.aspx.vb" Inherits="Admin_SetGiftTime" %>
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
        <div class="style1">Gift Register/Exchange Time Setting</div>
      <div style="text-align:center;margin-top:-45px;padding-bottom:12px">
               <asp:ImageButton ID="ImageButton2" runat="server" onmouseover="this.src='../images/homeblue_hover.png'" onmouseout="this.src='../images/homeblue.png'" ImageUrl="~/images/homeblue.png" CausesValidation="False" Height="55px" Width="150px"/>
   
   
   
               <br />
               <br />
               <br />
               <br />
               <br />
               <br />
   
   
   
    </div>
        
              <Ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />

        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1" GridLines="Horizontal" 
            Height="50px" Width="1000px" CssClass="GridViewStyle">
            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle2" />
            <Fields>
                <asp:TemplateField HeaderText="Register Start Time" SortExpression="startTime">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" 
                            Text='<%# Bind("startTime", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                               <asp:CompareValidator ID="CompareValidatorEditRegStart" runat="server" 
                                 ControlToValidate="TextBox1" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                 Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                               <Ajax:CalendarExtender ID="CalendarExtenderRegStart" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox1"> </Ajax:CalendarExtender>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" 
                            Text='<%# Bind("startTime", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" 
                            Text='<%# Bind("startTime", "{0:yyyy/MM/dd}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Register End Time" SortExpression="endTime">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" 
                            Text='<%# Bind("endTime", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                                 <asp:CompareValidator ID="CompareValidatorEditRegEnd" runat="server" 
                                 ControlToValidate="TextBox2" ErrorMessage="<%$ Resources:Resource, sip_errorenddate_msg %>" 
                                 Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                               <Ajax:CalendarExtender ID="CalendarExtenderEditRegEnd" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox2"> </Ajax:CalendarExtender>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" 
                            Text='<%# Bind("endTime", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" 
                            Text='<%# Bind("endTime", "{0:yyyy/MM/dd}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exchange Start Time" 
                    SortExpression="startTimeEx">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" 
                            Text='<%# Bind("startTimeEx", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                               <asp:CompareValidator ID="CompareValidatorEditExchangeStart" runat="server" 
                                 ControlToValidate="TextBox3" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                 Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                               <Ajax:CalendarExtender ID="CalendarExtenderExchangeStart" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox3"> </Ajax:CalendarExtender>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" 
                            Text='<%# Bind("startTimeEx", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" 
                            Text='<%# Bind("startTimeEx", "{0:yyyy/MM/dd}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Exchange End Time" SortExpression="endTimeEx">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" 
                            Text='<%# Bind("endTimeEx", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                              <asp:CompareValidator ID="CompareValidatorEditExchangeEnd" runat="server" 
                                 ControlToValidate="TextBox4" ErrorMessage="<%$ Resources:Resource, sip_errorstartdate_msg %>" 
                                 Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                               <Ajax:CalendarExtender ID="CalendarExtenderExchangeEnd" runat="server" CssClass="orange" 
                                Format="yyyy/MM/dd" TargetControlID="TextBox4"> </Ajax:CalendarExtender>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" 
                            Text='<%# Bind("endTimeEx", "{0:yyyy/MM/dd}") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" 
                            Text='<%# Bind("endTimeEx", "{0:yyyy/MM/dd}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField DataField="active" HeaderText="Active" 
                    SortExpression="active" />
                <asp:CommandField ShowEditButton="True" />
            </Fields>
            <HeaderStyle Height="50px" />
            <RowStyle CssClass="GridViewRowStyle2" Height="40px" />
        </asp:DetailsView>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
            DeleteCommand="DELETE FROM [giftAccessTime] WHERE [id] = @id" 
            InsertCommand="INSERT INTO [giftAccessTime] ([startTime], [endTime], [startTimeEx], [endTimeEx], [active]) VALUES (@startTime, @endTime, @startTimeEx, @endTimeEx, @active)" 
            SelectCommand="SELECT * FROM [giftAccessTime]" 
            UpdateCommand="UPDATE [giftAccessTime] SET [startTime] = @startTime, [endTime] = @endTime, [startTimeEx] = @startTimeEx, [endTimeEx] = @endTimeEx, [active] = @active WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="startTime" Type="DateTime" />
                <asp:Parameter Name="endTime" Type="DateTime" />
                <asp:Parameter Name="startTimeEx" Type="DateTime" />
                <asp:Parameter Name="endTimeEx" Type="DateTime" />
                <asp:Parameter Name="active" Type="Boolean" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="startTime" Type="DateTime" />
                <asp:Parameter Name="endTime" Type="DateTime" />
                <asp:Parameter Name="startTimeEx" Type="DateTime" />
                <asp:Parameter Name="endTimeEx" Type="DateTime" />
                <asp:Parameter Name="active" Type="Boolean" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <br />
    
    </div>
    </form>
</body>
</html>
