<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SpeedCal.aspx.cs" Inherits="SpeedCal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="CountLabel" runat="server" Text=""></asp:Label>
        <div style="margin: auto; width: 1200px; text-align: center; margin-top: 280px">
            <asp:Label ID="Label1" runat="server" Text="" Style="font-size: 33px"></asp:Label>
            <span style="font-size: 33px">X </span>
            <asp:Label ID="Label2" runat="server" Text="" Style="font-size: 33px"></asp:Label>
            <br /><br /><br />
            <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
            <br /><br />
            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Style="height: 27px; width: 100px" Text="Show Answer" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Style="height: 27px; width: 100px; margin-right: 4px" Text="Next" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
