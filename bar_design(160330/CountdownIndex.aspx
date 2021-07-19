<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CountdownIndex.aspx.cs" Inherits="CountdownIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: auto; width: 1200px; text-align: center">
            <img src="countdownstyle/icon.png" />
            <img src="countdownstyle/pic.png" />
            <br />
            <asp:Button ID="Button1" Style="width: 80px; margin-left: -13px; margin-top: 35px" runat="server" Text="开始" PostBackUrl="~/Countdown01.aspx" />
        </div>
    </form>
</body>
</html>
