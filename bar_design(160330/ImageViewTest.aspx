<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageViewTest.aspx.cs" Inherits="ImageViewTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" Width="300" Height="300" />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
    </div>
    </form>
</body>
</html>
