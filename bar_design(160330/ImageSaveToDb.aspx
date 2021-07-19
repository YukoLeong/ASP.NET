<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImageSaveToDb.aspx.cs" Inherits="ImageSaveToDb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" AllowMultiple="true" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" Height="225px" Width="225px" Visible="false" />

        </div>
    </form>
</body>
</html>
