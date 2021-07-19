<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SeminarReg.aspx.vb" Inherits="SystemAdmin_SeminarReg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 68px;
        }
        .style3
        {
            height: 68px;
            width: 108px;
        }
        .style4
        {
            width: 108px;
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
                    <td class="style3">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" 
                            Text="Seminar:"></asp:Label>
                    </td>
                    <td class="style2">
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="topicName" 
                            DataValueField="topicName" Width="100px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Register" />
                        
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:EPConnectionString4 %>" 
                SelectCommand="SELECT  distinct [topicName] FROM [Seminar_Info]">
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

