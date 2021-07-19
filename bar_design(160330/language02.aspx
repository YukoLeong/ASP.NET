<%@ Page Language="C#" AutoEventWireup="true" CodeFile="language02.aspx.cs" Inherits="language02" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <a href="?lang=en" runat="server" id="linkEnglish">
                <asp:Literal ID="Literal1" runat="server" Text="<%$Resources:chienvh.language, langEnglish%>" /></a>
            <a href="?lang=zh" runat="server" id="linkChinese">
                <asp:Literal ID="Literal2" runat="server" Text="<%$Resources:chienvh.language, langVietnamese%>" /></a>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="<%$Resources:chienvh.language, testlan1%>"></asp:Label>
        </div>
    </form>
</body>
</html>
