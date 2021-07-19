<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SeminarReg.aspx.vb" Inherits="Operator_SeminarReg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            height: 68px;
            }
        .style4
        {
            width: 108px;
            height: 48px;
        }
        .style5
        {
            height: 34px;
        }
        .style6
        {
            width: 108px;
            height: 56px;
        }
        .style7
        {
            height: 56px;
        }
        .style8
        {
            height: 48px;
        }
    </style>
      <link rel="stylesheet" href="../button.css" type="text/css" media="screen" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server" Height="320px" Width="240px">
            <table class="style1">
                <tr>
                    <td class="style3" colspan="2">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" 
            Font-Size="Larger" Text="Seminar Register"></asp:Label></td>
                </tr>
                <tr>
                    <td class="style5">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
                            Text="Seminar Year:"></asp:Label>
                    </td>
                    <td class="style5">
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource1" DataTextField="year" DataValueField="year" 
                            Width="116px" Height="25px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" 
                            Text="Topic:"></asp:Label>
                    </td>
                    <td class="style7">
                        <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" Width="116px" 
                            DataSourceID="SqlDataSource2" DataTextField="topicName" DataValueField="id">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        </td>
                    <td class="style8">
                        <asp:Button ID="Button1" runat="server" Text="Register" Height="38px" 
                            Width="81px" />
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
                
                SelectCommand="SELECT  distinct year([startDate]) as year FROM [Seminar_Info] ORDER BY year DESC">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EPConnectionString %>" 
        SelectCommand="SELECT distinct [topicName],id FROM [Seminar_Info] where  year([startDate])=@year">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="year" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
          <asp:HiddenField ID="loginID" runat="server" Value="garychan" />
            <asp:HiddenField ID="time" runat="server" />
            <asp:HiddenField ID="key" runat="server" />
            <asp:HiddenField ID="confirm" runat="server" />
            <asp:HiddenField ID="verify" runat="server" 
                Value="298faefb173f2a5761596fedfd9f64f448606fad" />
        </asp:Panel>
        
    </div>
    </form>
</body>
</html>

