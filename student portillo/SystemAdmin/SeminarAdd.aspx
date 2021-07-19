<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SeminarAdd.aspx.vb" Inherits="ep.SeminarAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
            margin-bottom: 27px;
        }
        .style2
        {
            width: 396px;
        }
        .style3
        {
            width: 173px;
        }
        .style4
        {
            width: 116px;
        }
         .style5
        {
            font-family: "Berlin Sans FB";
            font-size: xx-large;
        }
    </style>
    <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body background="../images/background.gif">
    <form id="form1" runat="server">
    <div>
     <span class="style5">Add Seminar By Data Collector</span>
     <asp:LinkButton ID="LinkButton1" runat="server" CssClass="blue" 
                  style="margin-left: 112px" Font-Size="Large">Home</asp:LinkButton>
                  <br />
                  <br />
                  <br />
        <table class="style1">
            <tr>
                <td class="style4">
                    <asp:Label ID="Label1" runat="server" Text="Seminar:"></asp:Label>
                </td>
                <td class="style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="topicName" 
                        DataValueField="topicName">
                    </asp:DropDownList>
                    <br />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    <asp:Label ID="Label2" runat="server" Text="Student ID:"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td class="style3">
                <br />
                    <asp:Button ID="Button1" runat="server" style="margin-left: 0px" 
                        Text="insert" CssClass="blue" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT  distinct [topicName] FROM [Seminar_Info]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        
        SelectCommand="SELECT [PESS_COD] FROM [student_academic_info] WHERE ([card_snr] = @card_snr)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="card_snr" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
        SelectCommand="SELECT distinct [topicName],  [category], [startDate],  [duration], [organizer],[mpi_gen] FROM [Seminar_Info] WHERE ([topicName] = @topicName)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="topicName" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
