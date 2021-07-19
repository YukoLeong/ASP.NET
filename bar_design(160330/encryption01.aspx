<%@ Page Language="C#" AutoEventWireup="true" CodeFile="encryption01.aspx.cs" Inherits="encryption01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        #TextBox1{
            margin-left:23px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <h3>Register Page</h3>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Name: "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Sumbit" OnClick="Button1_Click" />
        <br /><br />



    </div>
    </form>
</body>
</html>
