<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="multiview.aspx.cs" Inherits="multiview.multiview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Multiview Page</h1>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="View1" runat="server">
                    <p>View 1</p>
                    <p>
                        Enter something:
                    <asp:TextBox ID="txtSomething" runat="server"></asp:TextBox>
                    </p>
                    <asp:Button ID="btnSubmit" runat="server" Text="Sumbit" OnClick="btnSubmit_Click" />
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <p>View 2</p>
                    The data you entered is:
                <asp:Label ID="lblOutput" runat="server" Text="Label"></asp:Label>
                </asp:View>

            </asp:MultiView>
        </div>
    </form>
</body>
</html>
